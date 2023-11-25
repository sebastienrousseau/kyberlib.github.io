---

# Front Matter (YAML)

author: "Sebastien Rousseau"
banner_alt: "Privacy and Security in a Quantum World"
banner_height: "100vh"
banner_width: "100vw"
banner: "https://kura.pro/kyberlib/images/github/github-kyberlib.webp"
cdn: "https://kura.pro"
changefreq: "weekly"
charset: "utf-8"
cname: "kyberlib.com"
copyright: "© 2023 KyberLib. All rights reserved."
date: "Nov 26, 2023"
description: "KyberLib: a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
download_url: "https://github.com/sebastienrousseau/kyberlib/archive/refs/tags/v0.0.2.zip"
download_title: "Download KyberLib ↓"
format-detection: "telephone=no"
hero_description: "KyberLib: a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
hreflang: "en"
icon: "https://kura.pro/kyberlib/images/favicon.ico"
id: "https://kyberlib.com"
image_alt: "Logo of KyberLib, a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
image_height: "100vh"
image_width: "100vw"
image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
keywords: "KyberLib, Rust library, post-quantum cryptography, PQC, secure communication, cryptography, Rust, security, performance, embedded devices, WebAssembly, WASM"
language: "en-GB"
layout: "index"
locale: "en_GB"
logo_alt: "Logo of KyberLib, a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
logo_height: "44"
logo_width: "44"
logo: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
menu: "active"
measurementID: "G-BJ9GKKGGE7"
name: "KyberLib"
permalink: "https://kyberlib.com"
rating: "general"
referrer: "no-referrer"
revisit-after: "7 days"
robots: "index, follow"
short_name: "kyberlib"
subtitle: "KyberLib: A Modern Approach to Post-Quantum Cryptography"
tags: "kyberlib, rust, post-quantum cryptography, pqc, secure communication, cryptography, performance, embedded devices, webassembly, wasm"
theme_color: "rgb(40, 151, 255)"
title: "KyberLib: Secure Post-Quantum Cryptography with Rust"
url: "https://kyberlib.com"
viewport: "width=device-width, initial-scale=1, shrink-to-fit=no"

# RSS - The RSS feed front matter (YAML).

atom_link: "https://kyberlib.com/rss.xml"
category: "Cryptography, Security, Post-quantum cryptography, Rust, Programming Languages, Libraries, Embedded Devices, WebAssembly, Performance, Open Source"
docs: "https://validator.w3.org/feed/docs/rss2.html"
generator: "Shokunin 🦀 (version 0.0.20)"
item_description: "KyberLib: a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
item_guid: "https://kyberlib.com/rss.xml"
item_link: "https://kyberlib.com/rss.xml"
item_pub_date: "2023-11-26T02:23:11+00:00"
item_title: "Shokunin - RSS Feed"
last_build_date: "2023-11-26T02:23:11+00:00"
managing_editor: "contact@kyberlib.com"
pub_date: "2023-11-26T02:23:11+00:00"
ttl: "60"
type: "website"
webmaster: "contact@kyberlib.com"

# Apple - The Apple front matter (YAML).

apple_mobile_web_app_orientations: "portrait"
apple_touch_icon_sizes: "192x192"
apple-mobile-web-app-capable: "yes"
apple-mobile-web-app-status-bar-inset: "black"
apple-mobile-web-app-status-bar-style: "black-translucent"
apple-mobile-web-app-title: "KyberLib: Secure Post-Quantum Cryptography with Rust"
apple-touch-fullscreen: "yes"

# MS Application - The MS Application front matter (YAML).

msapplication-config: "https://kyberlib.com/browserconfig.xml"
msapplication-tap-highlight: "no"
msapplication-TileColor: "rgb(40, 151, 255)"
msapplication_tile_image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"

# Twitter Card - The Twitter Card front matter (YAML).

twitter_card: "summary"
twitter_creator: "@wwdseb"
twitter_description: "KyberLib: a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
twitter_image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
twitter_image_alt: "Logo of KyberLib, a robust Rust library for CRYSTALS-Kyber post-quantum cryptography, offering strong security guarantees and compatibility with no_std environments."
twitter_site: "@wwdseb"
twitter_title: "KyberLib: Secure Post-Quantum Cryptography with Rust"
twitter_url: "https://kyberlib.com/"

# Humans.txt - The Humans.txt front matter (YAML).

author_website: "https://kyberlib.com"
author_twitter: "@wwdseb"
author_location: "London, UK"
thanks: "Thanks for reading!"
site_last_updated: "2023-10-22"
site_standards: "HTML5, CSS3, RSS, Atom, JSON, XML, YAML, Markdown, TOML"
site_components: "Shokunin SSG, Shokunin CLI, Shokunin Templates, Kaishi Templates, Kaishi Themes"
site_software: "Shokunin, Rust"

---

## Overview

KyberLib is a robust Rust library designed specifically for CRYSTALS-Kyber Post-Quantum Cryptography (PQC), offering strong security guarantees. This lightweight and efficient library is compatible with `no_std`, making it suitable for embedded devices and resource-constrained environments. KyberLib avoids memory allocations, ensuring minimal overhead and optimized performance. Additionally, it contains reference implementations with no unsafe code, adhering to strict security standards. For enhanced performance on x86_64 platforms, KyberLib provides an optimized AVX2 version by default. The library also supports compilation to WebAssembly (WASM) using wasm-bindgen, enabling its deployment in web applications and secure communication protocols.

## Key Features

### Core Features

- **no_std compatible**: No dependence on the Rust standard library, ensuring portability across platforms.
- **Allocation-free design**: Utilizes stack-based data structures, eliminating memory allocations and minimizing overhead.
- **Configurable parameter sets**: Provides flexibility to select different parameter sets based on specific security and performance requirements.
- **Optimized x86_64 assembly**: Leverages AVX2 instructions for exceptional performance on x86_64 platforms.
- **Safe code**: Reference implementations adhere to strict safety standards, eliminating unsafe code blocks to enhance security.
- **WebAssembly (WASM) support**: Can be compiled to WASM for deployment in web applications and secure communication protocols.

### Advanced Features

- **Allocation-free Guarantee**: KyberLib guarantees all its core cryptography operations are free of heap allocations.
- **Assembly optimisations**: The x86_64 assembly implementations use AVX2 instructions for high performance.
- **Security**: KyberLib contains no unsafe code in its public API surface.

## Functionality

KyberLib provides a comprehensive suite of cryptographic functionalities, including:

- **Key generation**: Generate secure public/private key pairs for secure communication.
- **Encapsulation**: Encrypt a shared secret using a public key, enabling secure data exchange.
- **Decapsulation**: Decrypt a shared secret using a private key, allowing for secure data retrieval.
- **Key exchange**: Perform authenticated key exchanges to establish secure communication channels.

Ready to streamline your financial data management? KyberLib is here to make your job easier.

[Embrace the future of secure communication with KyberLib][01], the robust and secure Rust library for CRYSTALS-Kyber post-quantum cryptography.

[01]: /about/index.html "Learn more about the benefits of KyberLib"
