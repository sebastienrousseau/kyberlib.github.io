---
name: "kyberlib"
short_name: "kyberlib"
title: "About kyberlib and its author, Sebastien Rousseau | kyberlib"
description: "Who builds kyberlib, and the facts about the project: its crates, licence, minimum Rust version, latest release, versioning policy and where its source and security policy live."
keywords: "kyberlib author, sebastien rousseau, kyberlib licence, kyberlib versions"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "About"
headline: "About kyberlib"
lead: "kyberlib is an open-source project by Sebastien Rousseau and its contributors."
---
## Who builds kyberlib?

kyberlib is written by [Sebastien Rousseau](https://sebastienrousseau.com/)
and its contributors, who are credited collectively as "The kyberlib
contributors". He is on [GitHub](https://github.com/sebastienrousseau) as
sebastienrousseau. The first commit was made in November 2023, and version
0.0.7 in May 2026 moved the library from CRYSTALS-Kyber Round 3 to FIPS 203
ML-KEM.

## Project facts

| | |
| :--- | :--- |
| **Crates** | `kyberlib` and `kyberlib-wasm` on crates.io |
| **Language** | Rust, 2021 edition |
| **Minimum Rust version** | 1.74 |
| **Licence** | Apache-2.0 or MIT, at your option |
| **Standard** | FIPS 203 ML-KEM: ML-KEM-512, ML-KEM-768, ML-KEM-1024 |
| **Latest release** | [0.0.10](https://crates.io/crates/kyberlib/0.0.10), 11 October 2026 |
| **Source** | [github.com/sebastienrousseau/kyberlib](https://github.com/sebastienrousseau/kyberlib) |
| **API reference** | [docs.rs/kyberlib](https://docs.rs/kyberlib) |
| **Security policy** | [SECURITY.md](https://github.com/sebastienrousseau/kyberlib/security/policy) |
| **Contact** | contact@kyberlib.com |

## How is it versioned?

kyberlib is pre-1.0 and follows Semantic Versioning, with one caveat: while
the version is 0.0.x, the patch number is the one that marks breaking
changes, so 0.0.x to 0.0.(x+1) may break your build. Only the latest release
receives security fixes. Version 1.0 waits on the third-party audit described
on the [security page](/security/#has-it-been-audited).
