---
name: "kyberlib"
short_name: "kyberlib"
title: "API guide: parameter sets, types and Cargo features | kyberlib"
description: "A guide to kyberlib's API: the ML-KEM-512, 768 and 1024 types and their sizes, the typed KemCore API and the legacy functions, every Cargo feature, and the crates in the workspace."
keywords: "kyberlib api, KemCore, MlKem768, kyberlib cargo features, ML-KEM key sizes"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "API guide"
headline: "How the kyberlib API fits together"
lead: "The types, sizes and features you choose between, with the full reference on docs.rs."
nav_docs: "true"
---
## Parameter sets

| Type | NIST security category | Module rank | Encapsulation key | Decapsulation key | Ciphertext | Shared secret |
| :--- | :--- | ---: | ---: | ---: | ---: | ---: |
| `MlKem512` | 1 | 2 | 800 B | 1,632 B | 768 B | 32 B |
| `MlKem768` | 3 | 3 | 1,184 B | 2,400 B | 1,088 B | 32 B |
| `MlKem1024` | 5 | 4 | 1,568 B | 3,168 B | 1,568 B | 32 B |

Each type carries these sizes as constants, for example
`MlKem768::PUBLIC_KEY_BYTES` and `MlKem768::CIPHERTEXT_BYTES`, and an
`ALGORITHM_ID` string such as `"ML-KEM-768"`.

## Typed API and legacy functions

kyberlib has two surfaces over the same FIPS 203 code. New code should use the
typed one.

| Action | Typed `KemCore` API | Legacy free functions |
| :--- | :--- | :--- |
| Generate a key pair | `MlKem768::generate(&mut rng)?` | `kyberlib::keypair(&mut rng)?` |
| Encapsulate | `ek.encapsulate(&mut rng)?` | `kyberlib::encapsulate(&public, &mut rng)?` |
| Decapsulate | `dk.decapsulate(&ct)`, no `Result` | `kyberlib::decapsulate(&ct, &secret)?` |
| Secret key type | `MlKem768DecapKey`: not `Copy`, redacted `Debug` | `Keypair { public, secret }` byte arrays |

The typed API enforces secret hygiene in the types. The legacy functions take
and return raw byte arrays, which helps when migrating from 0.0.6 or
serialising, but the caller then owns the job of not copying or logging the
secret bytes. The legacy surface uses ML-KEM-768 by default and stays for
compatibility.

## Cargo features

| Feature | Default | What it does |
| :--- | :---: | :--- |
| `kyber768` | yes | Selects ML-KEM-768 for the legacy free functions. Keep it when you turn default features off. |
| `std` | yes | Adds `std::error::Error` for `KyberLibError`. Turn off for `no_std`. |
| `kyber512`, `kyber1024` | no | Select ML-KEM-512 or ML-KEM-1024 for the legacy free functions instead. Enable at most one. |
| `avx2` | no | x86-64 SIMD acceleration of the polynomial arithmetic. Permits `unsafe` in the SIMD module. |
| `nasm` | no | The AVX2 backend assembled with NASM, for toolchains without the GNU assembler. |
| `hazmat` | no | Exposes the IND-CPA primitives under the KEM. Bypasses the Fujisaki-Okamoto transform: for research and testing only. |
| `90s`, `90s-fixslice` | no | Kyber Round 3's AES-CTR and SHA-2 variant. Not part of FIPS 203; kept for compatibility. |
| `fips`, `verified` | no | Placeholders for planned backends (`aws-lc-rs` and `libcrux-ml-kem`). Not implemented: enabling one does nothing yet. |

The typed `MlKem512`, `MlKem768` and `MlKem1024` types work whichever
parameter-set feature is on.

## Authenticated key exchange

`Uake` (the server is authenticated) and `Ake` (both sides are
authenticated) wrap the legacy surface in a key-exchange handshake:

```rust
use kyberlib::{keypair, Uake};

let mut alice = Uake::new();
let mut bob = Uake::new();
let bob_keys = keypair(&mut rng)?;

let client_init = alice.client_init(&bob_keys.public, &mut rng)?;
let server_send = bob.server_receive(client_init, &bob_keys.secret, &mut rng)?;
alice.client_confirm(server_send)?;

assert_eq!(alice.shared_secret, bob.shared_secret);
```

## Crates in the workspace

| Crate | What it is | On crates.io |
| :--- | :--- | :--- |
| `kyberlib` | The core library: FIPS 203 ML-KEM, `no_std` with `alloc` | [Yes](https://crates.io/crates/kyberlib) |
| `kyberlib-wasm` | `wasm-bindgen` bindings for browsers and JavaScript runtimes | [Yes](https://crates.io/crates/kyberlib-wasm) |
| `kyberlib-hybrid` | X25519MLKEM768 hybrid key exchange for TLS 1.3 | Not yet |
| `kyberlib-pkcs8` | PKCS#8 and SubjectPublicKeyInfo encoding | Not yet: a skeleton |
| `kyberlib-asm` | Planned home of the SIMD backends | Not yet: a skeleton |

## Where is the full reference?

Every public item is documented, which the crate enforces with
`#![deny(missing_docs)]`. The rendered reference is on
[docs.rs/kyberlib](https://docs.rs/kyberlib), and the design decisions are in
the repository's
[architecture decision records](https://github.com/sebastienrousseau/kyberlib/tree/main/doc/adr).
