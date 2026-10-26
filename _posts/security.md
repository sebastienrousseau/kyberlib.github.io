---
name: "kyberlib"
short_name: "kyberlib"
title: "Security: threat model, constant-time claims and audit status | kyberlib"
description: "How to report a vulnerability in kyberlib, what it defends against, which functions are constant time, its audit status, its supply-chain controls, and how to verify a release."
keywords: "kyberlib security, ML-KEM constant time, KyberSlash, kyberlib audit, verify kyberlib release, SLSA"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Security"
headline: "Security model and how to check it"
lead: "What kyberlib defends against, what it leaves to you, and the evidence for each claim, including what has not been done yet."
nav_security: "true"
---
## How do I report a vulnerability?

Email **contact@kyberlib.com** with a description, the affected version
(a commit hash if you have one), a reproducer and the impact you assessed.
Reports are accepted in English or French. Please do not open a public GitHub
issue for a security bug.

The project aims to acknowledge a report within 48 hours, assign a severity
within 7 days, and fix critical issues within 30 days. Disclosure is
coordinated: a fix ships with a patched release, a CVE where one applies, a
RustSec advisory and credit to the reporter if they want it. The full policy,
including safe harbour for good-faith research, is in
[SECURITY.md](https://github.com/sebastienrousseau/kyberlib/security/policy).

Only the latest published 0.0.x release receives security fixes.

## What does kyberlib defend against?

As the caller, you supply a cryptographically secure random-number generator,
manage private keys under your own policy, and move public keys and
ciphertexts over a channel with the integrity you need. Within that, kyberlib
defends against:

| Threat | Defence |
| :--- | :--- |
| Decapsulation oracles | Implicit rejection (FIPS 203, section 6.3): no branch on ciphertext validity |
| Timing leaks in `decapsulate` | Constant-time `verify` and `cmov`; no division on secret values, guarded in CI |
| Secret material left in memory | `ZeroizeOnDrop` on secret keys and shared secrets; secret key types are not `Copy` |
| Panics on malformed input | `try_from` constructors return an error for bad lengths instead of panicking, checked by fuzzing |
| Algorithm confusion | An algorithm identifier and object identifier on each parameter set |

Out of scope: physical attacks such as cold boot, JTAG or fault injection; a
compromised kernel, hypervisor or random-number source; side channels in an
allocator you plug in; and attacks on the operating system's random-number
interface.

## Which functions are constant time?

| Function | Reference backend | AVX2 backend |
| :--- | :--- | :--- |
| `decapsulate` | Constant time | Constant time |
| `encapsulate` | Constant time | Constant time |
| `verify`, `cmov` | Constant time | Constant time |
| `poly_compress`, `poly_tomsg` | Constant time, KyberSlash audit clean | Constant time, SIMD multiply-high |
| Key serialisation | Constant time in secret bytes | Constant time |

The claim is checked statistically with dudect, a Welch's t-test on timing
distributions; the latest published results are on the
[performance page](/benchmarks/#is-decapsulation-constant-time). The division
audit is recorded in
[ADR 0003](https://github.com/sebastienrousseau/kyberlib/blob/main/doc/adr/0003-kyberslash-audit.md)
and enforced by `scripts/kyberslash-guard.sh` in CI.

## Has it been audited?

**Not yet.** Version 1.0 will not be tagged until a third-party audit is
complete and its findings are fixed and re-verified
([issue #177](https://github.com/sebastienrousseau/kyberlib/issues/177)). The
request for proposals, the materials package and the readiness checklist for
auditors are in
[doc/audits](https://github.com/sebastienrousseau/kyberlib/tree/main/doc/audits).

## FIPS 140-3

A pure-Rust crate cannot be FIPS 140-3 validated on its own. Passing the NIST
ACVP vectors shows kyberlib's output matches FIPS 203; it is not a CMVP
certificate. A `fips` feature that would hand the ML-KEM operations to
`aws-lc-rs` is planned
([issue #170](https://github.com/sebastienrousseau/kyberlib/issues/170)) but
not implemented, so if you need a validated module today, use one directly.

## How is the supply chain controlled?

- `cargo deny` runs in CI and checks licences, advisories and sources.
- `cargo vet` records audits imported from other organisations' audit sets.
- A CI job builds the workspace from `cargo vendor` output, offline.
- `Cargo.lock` is committed, and every GitHub Action is pinned to a commit.
- The core library's only required runtime dependencies are `rand_core` and
  `zeroize`.

## Verifying a release

The release workflow records SLSA build provenance for each `.crate` file it
publishes, signed through GitHub's artifact attestations. To check the crate
crates.io serves you:

```bash
curl -fsSLo kyberlib-0.0.10.crate \
  https://crates.io/api/v1/crates/kyberlib/0.0.10/download
gh attestation verify --owner sebastienrousseau kyberlib-0.0.10.crate
```

The attestation names `.github/workflows/release.yml` at the `v0.0.10` tag as
the build that produced the file. Releases whose assets are attached to the
GitHub release, such as
[v0.0.7](https://github.com/sebastienrousseau/kyberlib/releases/tag/v0.0.7),
also carry a keyless cosign bundle, SHA-256 and SHA-512 sums and a CycloneDX
cryptography bill of materials:

```bash
cosign verify-blob \
  --certificate-identity-regexp '^https://github\.com/sebastienrousseau/kyberlib/' \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --bundle kyberlib-0.0.7.crate.cosign-bundle.json \
  kyberlib-0.0.7.crate
```
