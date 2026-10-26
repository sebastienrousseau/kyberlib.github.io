---
name: "kyberlib"
short_name: "kyberlib"
title: "Getting started with kyberlib: add the crate and agree a shared secret | kyberlib"
description: "Add kyberlib to a Rust project, generate an ML-KEM-768 key pair, encapsulate and decapsulate a shared secret, serialise keys, and build for no_std targets."
keywords: "kyberlib getting started, ML-KEM Rust example, cargo add kyberlib, no_std ML-KEM"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Getting started"
headline: "Your first ML-KEM key exchange"
lead: "From an empty Rust project to two matching shared secrets in one file."
nav_docs: "true"
---
## What do I need?

Rust 1.74 or newer: kyberlib's declared minimum supported Rust version, which
a CI job checks on every pull request. CI runs the test suite on Linux, macOS
and Windows.

## How do I add it?

```bash
cargo add kyberlib
cargo add rand@0.8
```

or in `Cargo.toml`:

```toml
[dependencies]
kyberlib = "0.0.10"
rand = "0.8"
```

kyberlib itself depends only on `rand_core`'s traits; `rand` is here for
`rand::thread_rng()` in the example below. Any generator implementing
`rand_core::CryptoRng + RngCore` works.

## How do I agree on a shared secret?

```rust
use kyberlib::{KemCore, MlKem768};

fn main() -> Result<(), kyberlib::KyberLibError> {
    let mut rng = rand::thread_rng();

    // The receiver generates a key pair and publishes `ek`.
    let (dk, ek) = MlKem768::generate(&mut rng)?;

    // The sender encapsulates against `ek` and sends `ct`.
    let (ct, ss_sender) = ek.encapsulate(&mut rng)?;

    // The receiver decapsulates `ct` with its secret key.
    let ss_receiver = dk.decapsulate(&ct);

    assert_eq!(ss_sender, ss_receiver);
    Ok(())
}
```

`ek` is the 1,184-byte encapsulation (public) key, `ct` the 1,088-byte
ciphertext, and both shared secrets are the same 32 bytes. Use the shared
secret as key material, for example as input to a key-derivation function,
rather than as a message.

## How do I send keys over the wire?

`as_bytes()` gives the fixed-size byte array, and `try_from_slice` reads one
back, refusing input of the wrong length:

```rust
use kyberlib::MlKem768EncapKey;

let wire_bytes = ek.as_bytes().to_vec();
let ek = MlKem768EncapKey::try_from_slice(&wire_bytes)?;
// Err(KyberLibError::InvalidLength) unless exactly 1,184 bytes.
```

## How do I choose a parameter set?

Swap the type: `MlKem512`, `MlKem768` or `MlKem1024`. All three implement
`KemCore`, so the calls above stay the same. The
[API guide](/documentation/#parameter-sets) lists their sizes and security
categories.

## How do I build for an embedded target?

Turn off the default features, keep a parameter set and supply your own
random-number generator:

```toml
[dependencies]
kyberlib = { version = "0.0.10", default-features = false, features = ["kyber768"] }
```

The crate then builds without `std` but still needs `alloc`. See
[no_std and embedded targets](/features/#no-std-and-embedded-targets).

## Where next?

- The [API guide](/documentation/) for the types, the legacy functions and
  the Cargo features.
- The [migration guide](/migration/) if you are coming from kyberlib 0.0.6 or
  another ML-KEM crate.
- The full API reference on [docs.rs](https://docs.rs/kyberlib).
