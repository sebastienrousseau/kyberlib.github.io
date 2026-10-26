<!-- SPDX-License-Identifier: Apache-2.0 OR MIT -->

# Changelog

All notable changes to kyberlib.com are documented here.

## [0.0.2] - Unreleased

### Changed

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
