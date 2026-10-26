---
name: "kyberlib"
short_name: "kyberlib"
title: "Frequently asked questions about kyberlib | kyberlib"
description: "Answers about kyberlib: what it is, ML-KEM against CRYSTALS-Kyber, choosing a parameter set, FIPS 140-3, the audit, no_std, JavaScript, hybrid TLS and the licence."
keywords: "kyberlib faq, ML-KEM vs Kyber, kyberlib FIPS 140-3, kyberlib audit, kyberlib wasm"
author: "Sebastien Rousseau"
date: "2026-10-26"
news_publication_date: "2026-10-26"
layout: "page"
language: "en-GB"
schema: "page"
changefreq: "monthly"
eyebrow: "FAQ"
headline: "Frequently asked questions"
lead: "Short answers first; each links to the page with the detail where there is one."
nav_faqs: "true"
---
## What is kyberlib?

kyberlib is a free, open-source Rust library implementing FIPS 203 ML-KEM, the post-quantum key-encapsulation mechanism standardised from CRYSTALS-Kyber, with the ML-KEM-512, ML-KEM-768 and ML-KEM-1024 parameter sets. See the [features](/features/).

## Is kyberlib the same as CRYSTALS-Kyber?

Not byte for byte. Versions up to 0.0.6 implemented CRYSTALS-Kyber Round 3; since 0.0.7 kyberlib implements FIPS 203 ML-KEM, and keys and ciphertexts from the two are not compatible. The [migration guide](/migration/) explains the upgrade.

## Which parameter set should I use?

ML-KEM-768, NIST security category 3, is the default and the one the X25519MLKEM768 hybrid uses. ML-KEM-512 has smaller keys at category 1, and ML-KEM-1024 reaches category 5. All three share one API; their sizes are in the [API guide](/documentation/#parameter-sets).

## Is kyberlib FIPS 140-3 validated?

No. A pure-Rust crate cannot be validated on its own. kyberlib passes the NIST ACVP test vectors for FIPS 203, which is not a CMVP certificate. A feature that delegates to a validated module is planned but not implemented; see [FIPS 140-3](/security/#fips-140-3).

## Has kyberlib been audited?

Not yet. Version 1.0 will not be tagged until a third-party audit is complete and its findings are fixed. The audit materials are listed on the [security page](/security/#has-it-been-audited).

## Does it work without the standard library?

Yes. With default features turned off and the `kyber768` feature on, the core builds for `no_std` targets that provide `alloc`. You pass in your own random-number generator.

## Can I use it from JavaScript?

Yes, through the [kyberlib-wasm](/features/#webassembly) crate, which wraps ML-KEM-768 with wasm-bindgen. It is published on crates.io and built with `wasm-pack`; there is no npm package.

## Does it support hybrid key exchange for TLS?

The `kyberlib-hybrid` crate in the repository implements X25519MLKEM768 from `draft-ietf-tls-ecdhe-mlkem-04`. It is not published on crates.io yet, and the P-256 and P-384 hybrids are not implemented.

## Is there a command-line tool?

No. kyberlib is a library only, and a command-line companion is not on the plan for version 1.0.

## What does it cost, and under which licence?

Nothing. kyberlib is free software under the Apache License 2.0 or the MIT licence, at your option.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is kyberlib?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "kyberlib is a free, open-source Rust library implementing FIPS 203 ML-KEM, the post-quantum key-encapsulation mechanism standardised from CRYSTALS-Kyber, with the ML-KEM-512, ML-KEM-768 and ML-KEM-1024 parameter sets."
      }
    },
    {
      "@type": "Question",
      "name": "Is kyberlib the same as CRYSTALS-Kyber?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Not byte for byte. Versions up to 0.0.6 implemented CRYSTALS-Kyber Round 3; since 0.0.7 kyberlib implements FIPS 203 ML-KEM, and keys and ciphertexts from the two are not compatible."
      }
    },
    {
      "@type": "Question",
      "name": "Which parameter set should I use?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "ML-KEM-768, NIST security category 3, is the default and the one the X25519MLKEM768 hybrid uses. ML-KEM-512 has smaller keys at category 1, and ML-KEM-1024 reaches category 5. All three share one API."
      }
    },
    {
      "@type": "Question",
      "name": "Is kyberlib FIPS 140-3 validated?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. A pure-Rust crate cannot be validated on its own. kyberlib passes the NIST ACVP test vectors for FIPS 203, which is not a CMVP certificate. A feature that delegates to a validated module is planned but not implemented."
      }
    },
    {
      "@type": "Question",
      "name": "Has kyberlib been audited?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Not yet. Version 1.0 will not be tagged until a third-party audit is complete and its findings are fixed."
      }
    },
    {
      "@type": "Question",
      "name": "Does it work without the standard library?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. With default features turned off and the kyber768 feature on, the core builds for no_std targets that provide alloc. You pass in your own random-number generator."
      }
    },
    {
      "@type": "Question",
      "name": "Can I use it from JavaScript?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes, through the kyberlib-wasm crate, which wraps ML-KEM-768 with wasm-bindgen. It is published on crates.io and built with wasm-pack; there is no npm package."
      }
    },
    {
      "@type": "Question",
      "name": "Does it support hybrid key exchange for TLS?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The kyberlib-hybrid crate in the repository implements X25519MLKEM768 from draft-ietf-tls-ecdhe-mlkem-04. It is not published on crates.io yet, and the P-256 and P-384 hybrids are not implemented."
      }
    },
    {
      "@type": "Question",
      "name": "Is there a command-line tool?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. kyberlib is a library only, and a command-line companion is not on the plan for version 1.0."
      }
    },
    {
      "@type": "Question",
      "name": "What does it cost, and under which licence?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Nothing. kyberlib is free software under the Apache License 2.0 or the MIT licence, at your option."
      }
    }
  ]
}
</script>
