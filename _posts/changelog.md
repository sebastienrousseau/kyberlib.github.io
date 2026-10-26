---
name: "kyberlib"
short_name: "kyberlib"
title: "Changelog: kyberlib releases up to 0.0.10 | kyberlib"
description: "What changed in kyberlib's recent releases, from the move to FIPS 203 ML-KEM in 0.0.7 to 0.0.10, with links to the full changelog."
keywords: "kyberlib changelog, kyberlib releases, kyberlib 0.0.10, kyberlib 0.0.7"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Changelog"
headline: "kyberlib releases up to 26 October 2026"
lead: "The releases since 0.0.6, summarised from the project's CHANGELOG.md. 0.0.8 has no recorded changes."
---
## 0.0.10, 11 October 2026

- Dependency updates across the workspace, and refreshed GitHub Actions in
  CI and the release workflow.
- kyberlib and kyberlib-wasm 0.0.10 published on crates.io, with SLSA build
  provenance for the kyberlib crate.

## 0.0.9, 3 August 2026

- **Security:** replaced the `atty` dependency, pulled in by the
  constant-time benchmark harness, with a small compatibility crate built on
  the standard library's `IsTerminal`, removing RUSTSEC-2021-0145 from the
  dependency graph.
- Pinned `zeroize_derive` to 1.4.2 so the locked dependency graph still
  builds on Rust 1.74.

## 0.0.7, 22 May 2026

The release that moved kyberlib to FIPS 203 ML-KEM. Keys and ciphertexts from
0.0.6 do not work with it; see the [migration guide](/migration/).

- Implements FIPS 203 ML-KEM in place of CRYSTALS-Kyber Round 3.
- Declares Rust 1.74 as the minimum version and moves to the 2021 edition.
- Splits the project into a workspace, with WebAssembly bindings in the
  separate `kyberlib-wasm` crate.
- `Keypair` is no longer `Copy`, and secret material is zeroised on drop
  unconditionally.
- Removes the git dependency on `commons` and the unused `pqc_core`, `rlg`
  and `tokio` dependencies.
- Every public item is documented, enforced with `#![deny(missing_docs)]`.

## 0.0.6, 2024

CRYSTALS-Kyber Round 3 reference and AVX2 implementations, validated against
the Round 3 known-answer tests, dual-licensed under MIT and Apache-2.0.

## Where is the full history?

Every change is in
[CHANGELOG.md](https://github.com/sebastienrousseau/kyberlib/blob/main/CHANGELOG.md),
and the releases are on
[GitHub](https://github.com/sebastienrousseau/kyberlib/releases) and
[crates.io](https://crates.io/crates/kyberlib/versions).
