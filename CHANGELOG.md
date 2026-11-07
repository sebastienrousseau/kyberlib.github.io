<!-- SPDX-License-Identifier: Apache-2.0 OR MIT -->

# Changelog

All notable changes to kyberlib.com are documented here.

## [0.0.15] - Unreleased

First tagged release of the site. It ships at the kyberlib family's
version (`~/Code/AGENTS.md` §3), so the untagged 0.0.2 work is released
under this heading.

### Changed

- Built with ssg 0.0.73 (was 0.0.69), the latest release, locally and in
  both workflows; CI checks the published SHA-256 of the release archive.
- Pages describe kyberlib 0.0.11, the latest published release: version,
  install snippets, changelog entry (GHSA-3g97-82p7-9p2w), minimum Rust
  1.89 (was stated as 1.74), and the provenance and cosign examples.
- Rebuilt the site with Static Site Generator 0.0.69 and the Prism theme,
  coloured from the kyberlib logo, replacing the 2023 Shokunin site.
- Rewrote every page from the kyberlib repository at version 0.0.10: the
  site now describes FIPS 203 ML-KEM rather than CRYSTALS-Kyber Round 3,
  and drops text copied from another project.
- `make build` checks colour contrast (WCAG AAA), requires ssg's quality
  gate at 10/10, verifies every `#fragment` and SRI hash, renders one social
  image per page and runs `ssg audit`; the Pages workflow builds and deploys
  the result instead of uploading committed output.

## [0.0.1] - 2026-10-26 (merged, not tagged)

### Changed

- Licensed the site's source under Apache-2.0 OR MIT.
- Deployed GitHub Pages with GitHub Actions instead of from a branch.
