---
name: "kyberlib"
short_name: "kyberlib"
title: "Migrate to kyberlib from 0.0.6 or another ML-KEM crate | kyberlib"
description: "How to move from kyberlib 0.0.6 (CRYSTALS-Kyber Round 3) to FIPS 203 ML-KEM, and what changes when you switch to kyberlib from another Rust ML-KEM crate."
keywords: "kyberlib migration, CRYSTALS-Kyber to ML-KEM, pqcrypto-kyber migration, ml-kem crate alternative"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Migration"
headline: "Moving to kyberlib's FIPS 203 API"
lead: "What breaks when you upgrade from kyberlib 0.0.6, and what to check when you switch from another crate."
nav_migration: "true"
---
## From kyberlib 0.0.6 or earlier

**Regenerate every stored key.** Version 0.0.7 moved from CRYSTALS-Kyber
Round 3 to FIPS 203 ML-KEM, which adds a domain separator to key
generation, drops the hash of the encapsulation message, and replaces the
final key-derivation step and the rejection value with FIPS 203's. Secret keys, ciphertexts and shared secrets made
with 0.0.6 do not work with 0.0.7 or later, so both peers must move together.
The byte-level changes are in
[ADR 0001](https://github.com/sebastienrousseau/kyberlib/blob/main/doc/adr/0001-fips203-migration.md).

```diff
 [dependencies]
-kyberlib = "0.0.6"
+kyberlib = "0.0.10"
```

The free functions still compile and now call the typed API. Moving to the
typed API is optional but recommended:

```diff
-let keys = kyberlib::keypair(&mut rng)?;
-let (ct, ss_a) = kyberlib::encapsulate(&keys.public, &mut rng)?;
-let ss_b = kyberlib::decapsulate(&ct, &keys.secret)?;
+let (dk, ek) = kyberlib::MlKem768::generate(&mut rng)?;
+let (ct, ss_a) = ek.encapsulate(&mut rng)?;
+let ss_b = dk.decapsulate(&ct);
```

Other changes in 0.0.7 that can break a build:

- `Keypair` is no longer `Copy`, so a secret key cannot be duplicated by
  accident; clone it explicitly where you really need two.
- `Keypair::import` overwrites the secret slice you pass with zeros once the
  import succeeds.
- The crate builds only as an `rlib`; WebAssembly builds moved to the
  separate `kyberlib-wasm` crate.
- The minimum Rust version is 1.74, and the crate uses the 2021 edition.

## From another Rust ML-KEM crate

The kyberlib README keeps side-by-side migration snippets for
`RustCrypto/ml-kem`, `libcrux-ml-kem`, `pqcrypto-kyber` and `oqs`. The
kyberlib side is the same in every case:

```rust
use kyberlib::{KemCore, MlKem768};

let (dk, ek) = MlKem768::generate(&mut rng)?;
let (ct, ss_a) = ek.encapsulate(&mut rng)?;
let ss_b = dk.decapsulate(&ct);
```

Points to check when you switch:

- **Decapsulation returns no `Result`.** kyberlib applies implicit rejection,
  so an invalid ciphertext yields a pseudorandom secret instead of an error.
  Remove error handling around `decapsulate` rather than expecting it to fail.
- **Randomness is passed in.** `generate` and `encapsulate` take a generator
  implementing `rand_core::CryptoRng + RngCore`; kyberlib does not pick one.
- **Round 3 is not FIPS 203.** Keys and ciphertexts from a Kyber Round 3
  library, such as `pqcrypto-kyber`, are not byte-compatible with ML-KEM. Plan
  to regenerate them.
- **Key types are named per parameter set**: `MlKem768EncapKey`,
  `MlKem768DecapKey` and `MlKem768Ciphertext`, with 1,184, 2,400 and 1,088
  bytes.

For the exact lines to replace in each library, read
[Migrating to FIPS 203 ML-KEM](https://github.com/sebastienrousseau/kyberlib#migrating-to-fips-203-ml-kem)
in the README, and check the other crate's documentation for its current API.
