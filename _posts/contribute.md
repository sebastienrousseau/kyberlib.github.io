---
name: "kyberlib"
short_name: "kyberlib"
title: "Contributing to kyberlib | kyberlib"
description: "How to contribute to kyberlib: open an issue first, what a pull request needs, the rules for cryptographic code, and how contributions are licensed."
keywords: "contribute to kyberlib, kyberlib pull request, kyberlib contributing guide"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "Contributing"
headline: "Contributing to kyberlib"
lead: "A summary of the project's contributing guide; the guide in the repository is the reference."
---
## Before you write code

Open an [issue](https://github.com/sebastienrousseau/kyberlib/issues) first.
kyberlib is a cryptographic library, so changes face a higher bar and a longer
review than in most crates, and additions to the API are often declined.
Security bugs go to contact@kyberlib.com, never to a public issue.

## What every pull request needs

- A branch named for its type, such as `feat/...`, `fix/...` or `docs/...`.
- Conventional Commits: `<type>(<scope>): <subject>`, imperative, with the
  body wrapped at 72 characters.
- A test for every change in behaviour, in the same pull request.
- A green build on Rust 1.74 as well as stable.
- Clean `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo doc` and
  `cargo deny check`.
- For a breaking change, a CHANGELOG entry and an architecture decision
  record under `doc/adr/`.

## Rules for cryptographic code

These override the general Rust style guide where the two disagree:

1. No `/` or `%` on secret-derived integers; use Barrett or Montgomery
   reduction.
2. No branches that depend on secret data; use the constant-time `verify`
   and `cmov` helpers.
3. No allocation in the hot path: the crate must build as `no_std` with
   `alloc`.
4. Public types that hold secrets are not `Copy`, are `ZeroizeOnDrop`, and
   redact their `Debug` output.
5. New `unsafe` code belongs in the `kyberlib-asm` crate, and every
   `unsafe` block carries a `// SAFETY:` comment.

Changes to the cryptographic paths also need the AVX2 tests, a Miri pass and
a fuzzing run; the commands are in the
[contributing guide](https://github.com/sebastienrousseau/kyberlib/blob/main/CONTRIBUTING.md).

## Licence of contributions

By submitting a contribution you agree that it is licensed under both MIT
and Apache-2.0, matching the project.

## Improving this website

The source of kyberlib.com is in the
[kyberlib.github.io repository](https://github.com/sebastienrousseau/kyberlib.github.io).
Report a mistake on the site there, or through the [contact page](/contact/).
