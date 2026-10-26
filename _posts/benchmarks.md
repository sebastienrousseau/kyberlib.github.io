---
name: "kyberlib"
short_name: "kyberlib"
title: "Performance: ML-KEM-768 timings and the constant-time check | kyberlib"
description: "Measured kyberlib timings for ML-KEM-768 key generation, encapsulation and decapsulation, the machine they were measured on, the dudect constant-time results, and how to reproduce them."
keywords: "kyberlib benchmark, ML-KEM-768 performance, Rust ML-KEM speed, dudect"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Performance"
headline: "How long each operation takes"
lead: "Published measurements from the kyberlib repository, with the machine and release they came from."
nav_docs: "true"
---
## How fast is ML-KEM-768?

These are the figures published in the repository's
[doc/BENCHMARKS.md](https://github.com/sebastienrousseau/kyberlib/blob/main/doc/BENCHMARKS.md),
measured on kyberlib 0.0.7 with Criterion in quick mode (one sample window,
no plots). They are the mean time per operation; lower is better.

| Operation | Typed `KemCore` API | Legacy free functions |
| :--- | ---: | ---: |
| Key generation | 22.91 µs | 22.58 µs |
| Encapsulation | 20.91 µs | 18.19 µs |
| Decapsulation, valid ciphertext | 19.93 µs | 19.85 µs |
| Decapsulation, tampered ciphertext | not measured | 19.61 µs |

A full handshake (key generation, encapsulation and decapsulation through
the typed API) took 66.99 µs, about 14,900 handshakes per second on one core.

## What machine was that?

| | |
| :--- | :--- |
| **CPU** | Apple M1 Pro (aarch64) |
| **Memory** | 16 GiB |
| **Operating system** | macOS 26.5 |
| **Toolchain** | rustc 1.95.0 |
| **Backend** | The pure-Rust reference backend; the AVX2 backend does not apply on aarch64 |

Numbers on another machine, another release or with the `avx2` feature will
differ. No measurements of the AVX2 backend are published yet.

## Is decapsulation constant time?

The repository tests it with dudect, which runs Welch's t-test on two timing
distributions; a statistic above 10 suggests a leak.

| Test | Largest t | Result |
| :--- | ---: | :--- |
| Valid against invalid ciphertexts | about 1.4 | Pass |
| Matching ciphertext against one from another key pair | about 1.8 | Pass |

CI runners are too noisy for this test, so the release process calls for
full runs on a quiet machine before each release.

## How do I reproduce them?

From a clone of the repository:

```bash
make bench                # Criterion benchmarks, with an HTML report
cargo xtask dudect quick  # the constant-time check, 5,000 samples per class
```
