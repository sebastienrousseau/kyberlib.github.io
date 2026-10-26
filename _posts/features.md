---
name: "kyberlib"
short_name: "kyberlib"
title: "Features: FIPS 203 ML-KEM, ACVP conformance and side-channel defences | kyberlib"
description: "What kyberlib does: the three FIPS 203 ML-KEM parameter sets behind one trait, 180/180 NIST ACVP vectors, no unsafe code by default, KyberSlash-clean arithmetic, self-erasing secret keys, no_std and WebAssembly."
keywords: "kyberlib features, ML-KEM-768, ML-KEM-1024, ACVP, KyberSlash, zeroize, no_std, wasm"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Features"
headline: "What kyberlib does, and where it stops"
lead: "Each section says what the feature is, how it is checked and what it does not cover yet."
nav_features: "true"
---
## FIPS 203 ML-KEM

**kyberlib implements the three ML-KEM parameter sets defined in FIPS 203.**
Each one is a type, `MlKem512`, `MlKem768` or `MlKem1024`, and each implements
the sealed `KemCore` trait, so the parameter set is chosen where you call it
rather than by a Cargo feature, and all three can be used in the same build.

```rust
use kyberlib::{KemCore, MlKem1024};

let (dk, ek) = MlKem1024::generate(&mut rng)?;
let (ct, ss_sender) = ek.encapsulate(&mut rng)?;
let ss_receiver = dk.decapsulate(&ct);
assert_eq!(ss_sender, ss_receiver);
```

Decapsulation uses implicit rejection (FIPS 203, section 6.3): a tampered
ciphertext does not produce an error, it produces a pseudorandom shared
secret, so `decapsulate` returns no `Result` and never branches on whether
the ciphertext was valid. The older free functions `keypair`, `encapsulate`
and `decapsulate` still work and call the typed API; the
[API guide](/documentation/#typed-api-and-legacy-functions) compares the two.

## NIST ACVP conformance

**All 180 functional test vectors from NIST's Automated Cryptographic
Validation Protocol pass.** The vectors come from
[usnistgov/ACVP-Server](https://github.com/usnistgov/ACVP-Server), are checked
into the repository with their SHA-256 sums, and are run by
`tests/test_acvp.rs`:

| Parameter set | Key generation | Encapsulation | Decapsulation |
| :--- | ---: | ---: | ---: |
| ML-KEM-512 | 25 / 25 | 25 / 25 | 10 / 10 |
| ML-KEM-768 | 25 / 25 | 25 / 25 | 10 / 10 |
| ML-KEM-1024 | 25 / 25 | 25 / 25 | 10 / 10 |

Run them yourself from a clone of the repository with `make acvp`. The 60
key-check vectors in the same corpus, which test whether malformed keys are
rejected, are not run yet.

Passing ACVP vectors shows the output matches the standard byte for byte. It
is not a FIPS 140-3 validation, which a pure-Rust crate cannot obtain on its
own; see the [security page](/security/#fips-140-3).

## No unsafe code in the default build

**With default features, the crate compiles with `#![forbid(unsafe_code)]`.**
The compiler rejects any `unsafe` block, and no inner attribute can lift the
ban. Only the optional `avx2` and `nasm` features, which add x86-64 SIMD
acceleration, permit `unsafe`, and then only inside the module that holds the
intrinsics and assembly.

## KyberSlash-clean arithmetic

**No division or remainder operation runs on secret-derived values.**
KyberSlash (TCHES 2025) showed that a hardware divide on secret data leaks
timing. kyberlib's reference backend reduces modulo `q` with Barrett
multiply-and-shift, and the AVX2 backend uses SIMD multiply-high instructions,
which have no divide at all. The audit is recorded in
[ADR 0003](https://github.com/sebastienrousseau/kyberlib/blob/main/doc/adr/0003-kyberslash-audit.md),
and `scripts/kyberslash-guard.sh` runs in CI on every pull request, failing
the build if a `/` or `%` against `KYBER_Q` appears in the source.

## Secret keys that clean up after themselves

**The type system handles secret hygiene for you.** Decapsulation keys
(`MlKem512DecapKey`, `MlKem768DecapKey`, `MlKem1024DecapKey`) are not `Copy`,
so an assignment cannot leave a stray copy on the stack. They and the
`SharedSecret` are `ZeroizeOnDrop`: their memory is overwritten when they go
out of scope. Their `Debug` output is redacted, so a log line or a panic
message cannot print the key:

```text
MlKem768DecapKey([REDACTED 2400 bytes])
SharedSecret([REDACTED 32 bytes])
```

Public keys and ciphertexts are not secret and stay `Copy`.

## `no_std` and embedded targets

**The core builds without the Rust standard library.** Turn off the default
features and keep a parameter set:

```toml
[dependencies]
kyberlib = { version = "0.0.10", default-features = false, features = ["kyber768"] }
```

It still needs `alloc`. kyberlib never looks for randomness itself: every
function that needs it takes a caller-supplied generator implementing
`rand_core::CryptoRng + RngCore`, so on bare metal you pass your hardware
random-number generator. A CI job builds the crate this way on every pull
request.

## WebAssembly

**[kyberlib-wasm](https://crates.io/crates/kyberlib-wasm) wraps the library
with `wasm-bindgen`** for browsers and JavaScript runtimes. It exports
`keypair`, `encapsulate` and `decapsulate` plus `Keys`, `Kex` and `Params`
classes, and is built with `wasm-pack`:

```bash
git clone https://github.com/sebastienrousseau/kyberlib.git
cd kyberlib
wasm-pack build crates/kyberlib-wasm --release --target web
```

The WebAssembly bindings use ML-KEM-768. kyberlib-wasm is published on
crates.io; it is not on npm.

## Hybrid key exchange

**The `kyberlib-hybrid` crate implements X25519MLKEM768**, the hybrid of
X25519 and ML-KEM-768 from the IETF draft `draft-ietf-tls-ecdhe-mlkem-04`
used in TLS 1.3. The client share is 1,216 bytes, the server share 1,120
bytes, and the combined shared secret 64 bytes. The crate is in the
repository but not yet published on crates.io, and its P-256 and P-384
variants are not implemented.

## Signed releases

**The release workflow signs and attests what it publishes.** For each
release it builds the `.crate` file, signs it with keyless cosign (Fulcio and
Rekor, with no long-lived signing key), records SLSA build provenance with GitHub
artifact attestations, and generates a CycloneDX cryptography bill of
materials. The kyberlib 0.0.10 crate on crates.io carries that provenance;
the [security page](/security/#verifying-a-release) shows how to check it.
