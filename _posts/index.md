---
name: "kyberlib"
short_name: "kyberlib"
title: "kyberlib: FIPS 203 ML-KEM post-quantum key exchange for Rust"
description: "kyberlib is a pure-Rust implementation of FIPS 203 ML-KEM (ML-KEM-512, 768 and 1024), the post-quantum key-encapsulation mechanism standardised from CRYSTALS-Kyber, for std, no_std and WebAssembly."
keywords: "kyberlib, ML-KEM, FIPS 203, CRYSTALS-Kyber, post-quantum cryptography, Rust, key encapsulation, no_std, WebAssembly"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "index"
language: "en-GB"
schema: "page"
changefreq: "weekly"
eyebrow: "Open-source Rust library"
headline: "Post-quantum key exchange for Rust, built to FIPS 203"
lead: "kyberlib implements ML-KEM, the key-encapsulation mechanism NIST standardised from CRYSTALS-Kyber, in pure Rust, and passes all 180 NIST ACVP test vectors."
---
## What is kyberlib?

kyberlib is a free, open-source Rust library that implements **FIPS 203
ML-KEM**, the post-quantum key-encapsulation mechanism NIST published in
August 2024 as the standardised form of CRYSTALS-Kyber. Two parties use it to
agree on a 32-byte shared secret: the receiver generates a key pair, the sender
encapsulates a secret against the public key, and the receiver decapsulates
the ciphertext to recover the same secret. It supports ML-KEM-512,
ML-KEM-768 and ML-KEM-1024, builds with or without the Rust standard library,
and is dual-licensed under Apache-2.0 or MIT.

## Is it CRYSTALS-Kyber or ML-KEM?

Both names describe the same family, but the bytes differ. Up to version
0.0.6, kyberlib implemented CRYSTALS-Kyber Round 3. Since 0.0.7 it implements
FIPS 203 ML-KEM, which changes the key-generation domain separator, the
encapsulation pre-hash and the rejection key derivation. Keys, ciphertexts and
shared secrets from 0.0.6 do not work with 0.0.7 or later; the
[migration guide](/migration/) covers the change.

## Can I use it in production?

Read the [security page](/security/) first. kyberlib is pre-1.0 and has not
yet had a third-party audit: version 1.0 will not be tagged until one is
complete and its findings are fixed. It is not FIPS 140-3 validated, and as a
pure-Rust crate it cannot be on its own. The [FAQ](/faqs/) lists the other
cases where a different library fits better today.

## Who makes it?

kyberlib is written by [Sebastien Rousseau](https://sebastienrousseau.com/)
and its contributors. The source, the issue tracker and every release are on
[GitHub](https://github.com/sebastienrousseau/kyberlib); the crates are on
[crates.io](https://crates.io/crates/kyberlib). Read more on the
[about page](/about/).
