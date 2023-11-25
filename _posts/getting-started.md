---

# Front Matter (YAML)

author: "Sebastien Rousseau"
banner_alt: "A white building with black windows"
banner_height: "100vh"
banner_width: "100vw"
banner: "https://kura.pro/stock/images/banners/daniele-franchi-Vl6YuVBLEys.webp"
cdn: "https://kura.pro"
changefreq: "weekly"
charset: "utf-8"
cname: ""
copyright: "© 2023 KyberLib. All rights reserved."
date: "Nov 26, 2023"
description: "Welcome to KyberLib User Guide. Get started with our Robust Rust library designed for CRYSTALS-Kyber Post-Quantum Cryptography (PQC) and compatible with no_std."
download: ""
format-detection: "telephone=no"
hreflang: "en"
icon: "https://kura.pro/shokunin/images/favicon.ico"
id: "https://kyberlib.com/getting-started/index.html"
image_alt: "Logo of KyberLib: A Rust-Powered Shield Against Quantum Threats"
image_height: "100vh"
image_width: "100vw"
image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
keywords: "KyberLib, Rust, CRYSTALS-Kyber, Post-Quantum Cryptography, no_std, secure, cryptography, encryption, decryption, PQC"
language: "en-GB"
layout: "start"
locale: "en_GB"
logo_alt: "Logo of KyberLib: A Rust-Powered Shield Against Quantum Threats"
logo_height: "44"
logo_width: "44"
logo: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
menu: "active"
measurementID: "G-BJ9GKKGGE7"
name: "Getting Started"
permalink: "https://kyberlib.com/getting-started/index.html"
rating: "general"
referrer: "no-referrer"
revisit-after: "7 days"
robots: "index, follow"
short_name: "kyberlib"
subtitle: "Start Building Secure Applications with KyberLib"
tags: "KyberLib, Rust, CRYSTALS-Kyber, PQC, no_std, security, cryptography, encryption, decryption, Rust library"
theme_color: "rgb(40, 151, 255)"
title: "KyberLib: Uncover Essential Installation Prerequisites"
url: "https://kyberlib.com"
viewport: "width=device-width, initial-scale=1, shrink-to-fit=no"

# RSS - The RSS feed front matter (YAML).

atom_link: "https://kyberlib.com/getting-started/rss.xml"
category: "Software, Static Site Generator, Rust"
docs: "https://validator.w3.org/feed/docs/rss2.html"
generator: "Shokunin 🦀 (version 0.0.20)"
item_description: "Welcome to KyberLib User Guide. Get started with our Robust Rust library designed for CRYSTALS-Kyber Post-Quantum Cryptography (PQC) and compatible with no_std."
item_guid: "https://kyberlib.com/getting-started/rss.xml"
item_link: "https://kyberlib.com/getting-started/rss.xml"
item_pub_date: "2023-11-26T02:23:11+00:00"
item_title: "KyberLib: Uncover Essential Installation Prerequisites"
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
apple-mobile-web-app-title: "KyberLib: Uncover Essential Installation Prerequisites"
apple-touch-fullscreen: "yes"

# MS Application - The MS Application front matter (YAML).

msapplication-config: "https://kyberlib.com/browserconfig.xml"
msapplication-tap-highlight: "no"
msapplication-TileColor: "rgb(40, 151, 255)"
msapplication_tile_image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"

# Twitter Card - The Twitter Card front matter (YAML).

twitter_card: "summary"
twitter_creator: "@wwdseb"
twitter_description: "Welcome to KyberLib User Guide. Get started with our Robust Rust library designed for CRYSTALS-Kyber Post-Quantum Cryptography (PQC) and compatible with no_std."
twitter_image: "https://kura.pro/kyberlib/images/logos/kyberlib.webp"
twitter_image_alt: "Logo of KyberLib: A Rust-Powered Shield Against Quantum Threats"
twitter_site: "@wwdseb"
twitter_title: "KyberLib: Uncover Essential Installation Prerequisites"
twitter_url: "https://kyberlib.com/getting-started/index.html"

# Humans.txt - The Humans.txt front matter (YAML).

author_website: "https://kyberlib.com"
author_twitter: "@wwdseb"
author_location: "London, UK"
thanks: "Thanks for reading!"
site_last_updated: "2023-10-25"
site_standards: "HTML5, CSS3, RSS, Atom, JSON, XML, YAML, Markdown, TOML"
site_components: "Shokunin SSG, Shokunin CLI, Shokunin Templates, Shokunin Themes, Kaishi SSG, Kaishi CLI, Kaishi Templates, Kaishi Themes"
site_software: "Shokunin, Rust"

---

![KyberLib:  Setup and Usage Guide](https://kura.pro/stock/images/banners/christoph-duschl-CE_TvPHF3lA.webp).class=\"img-fluid fade-in p-3\"

## Overview

KyberLib is a robust Rust library designed for CRYSTALS-Kyber Post-Quantum Cryptography, offering strong security guarantees. This library is compatible with `no_std`, making it suitable for embedded devices and avoids memory allocations. Additionally, it contains reference implementations with no unsafe code and provides an optimized AVX2 version by default on x86_64 platforms. You can also compile it to WebAssembly (WASM) using wasm-bindgen.

## Features

### Core Features

- **`no_std` compatible**: No dependence on the Rust standard library
- **Avoid allocations**: Uses stack-based data structures only
- **Configurable**: Features to enable different parameter sets
- **Optimised x86_64**: Uses assembly for performance-critical code, including an optimised AVX2 version by default.
- **Safe code**: Reference implementations have no `unsafe` blocks
- **WebAssembly Support**: Can be compiled to WASM using wasm-bindgen.

### Advanced Features

- **Allocation-free Guarantee**: KyberLib guarantees all its core cryptography operations are free of heap allocations.
- **Assembly Optimizations**: The x86_64 assembly implementations use AVX2 instructions for high performance.
- **Security**: KyberLib contains no unsafe code in its public API surface.

## Functionality

- **Key Generation**: Create public/private key pairs
- **Encapsulation**: Encapsulate a shared secret with a public key
- **Decapsulation**: Decapsulate a shared secret with a private key
- **Key Exchange**: Perform authenticated key exchanges

See [Documentation ⧉][02] for full API details.

![Divider][00]

## Getting Started

It takes just a few minutes to get up and running with `kyberlib`.

### Requirements

The minimum supported Rust toolchain version is currently Rust
**1.56.0** or later (stable).

### Installation

To install `kyberlib`, you need to have the Rust toolchain installed on
your machine. You can install the Rust toolchain by following the
instructions on the [Rust website ⧉][04].

Once you have the Rust toolchain installed, you can install `kyberlib`
using the following command:

```shell
cargo install kyberlib
```

![Divider][00]

## Usage

To use the `kyberlib` library in your project, add the following to your
`Cargo.toml` file:

```toml
[dependencies]
kyberlib = "0.0.2"
```

Add the following to your `main.rs` file:

```rust
extern crate kyberlib;
use kyberlib::*;
```

then you can use the functions in your application code.

For optimisations on x86 platforms enable the `avx2` feature and the following RUSTFLAGS:

```shell
export RUSTFLAGS="-C target-feature=+aes,+avx2,+sse2,+sse4.1,+bmi2,+popcnt"
```

### Key Encapsulation

```rust
// Generate Keypair
let keys_bob = keypair(&mut rng)?;

// Alice encapsulates a shared secret using Bob's public key
let (ciphertext, shared_secret_alice) = encapsulate(&keys_bob.public, &mut rng)?;

// Bob decapsulates a shared secret using the ciphertext sent by Alice
let shared_secret_bob = decapsulate(&ciphertext, &keys_bob.secret)?;

assert_eq!(shared_secret_alice, shared_secret_bob);
```

### Unilaterally Authenticated Key Exchange

```rust
let mut rng = rand::thread_rng();

// Initialize the key exchange structs
let mut alice = Uake::new();
let mut bob = Uake::new();

// Generate Bob's Keypair
let bob_keys = keypair(&mut rng)?;

// Alice initiates key exchange
let client_init = alice.client_init(&bob_keys.public, &mut rng)?;

// Bob authenticates and responds
let server_response = bob.server_receive(
  client_init, &bob_keys.secret, &mut rng
)?;

// Alice decapsulates the shared secret
alice.client_confirm(server_response)?;

// Both key exchange structs now have the same shared secret
assert_eq!(alice.shared_secret, bob.shared_secret);
```

### Mutually Authenticated Key Exchange

Follows the same workflow except Bob requires Alice's public keys:

```rust
let mut alice = Ake::new();
let mut bob = Ake::new();

let alice_keys = keypair(&mut rng)?;
let bob_keys = keypair(&mut rng)?;

let client_init = alice.client_init(&bob_keys.public, &mut rng)?;

let server_response = bob.server_receive(
  client_init, &alice_keys.public, &bob_keys.secret, &mut rng
)?;

alice.client_confirm(server_response, &alice_keys.secret)?;

assert_eq!(alice.shared_secret, bob.shared_secret);
```

## Errors

The KyberLibError enum has two variants:

- **InvalidInput** - One or more inputs to a function are incorrectly sized. A possible cause of this is two parties using different security levels while trying to negotiate a key exchange.
- **Decapsulation** - The ciphertext was unable to be authenticated. The shared secret was not decapsulated.
- **RandomBytesGeneration** - Error trying to fill random bytes (i.e external (hardware) RNG modules can fail).

![Divider][00]

## Examples

To get started with `kyberlib`, you can use the examples provided in the
`examples` directory of the project.

To run the examples, clone the repository and run the following command
in your terminal from the project root directory.

### Example 1: Implements an authenticated key exchange protocol

Alice and Bob exchange public keys to derive a shared secret in a way that authenticates each party.

Run the following command in your terminal from the project root directory.

```shell
cargo run --example ake
```

### Example 2: Demonstrates key encapsulation and decapsulation

Alice generates a keypair. Bob encapsulates a secret using Alice's public key. Alice decapsulates the secret using her private key. This allows secure communication.

Run the following command in your terminal from the project root directory.

```shell
cargo run --example kem
```

### Example 3: Implements an unauthenticated key exchange protocol

Alice and Bob exchange public information to derive a shared secret without authenticating each other. Provides confidentiality but not authentication.

Run the following command in your terminal from the project root directory.

```shell
cargo run --example uake
```

![Divider][00]

### Documentation

For comprehensive information and resources related to `KyberLib`, we invite you
to explore our extensive documentation.

Detailed guides, API references, and examples are available on [docs.rs ⧉][02],
where you'll find in-depth material to support your development needs.

For library-specific details and to access our collection of Rust libraries, 
visit [lib.rs ⧉][03].

Additionally, you can explore [crates.io ⧉][01] to find a wide range of Rust
crates, which include the necessary tools and libraries to enhance your
projects.

These resources are designed to provide you with the most up-to-date
and thorough information to assist in your development endeavours.

![Divider][00]

[00]: https://kura.pro/common/images/elements/divider.svg "Divider"
[01]: https://crates.io/crates/kyberlib "KyberLib on Crates.io"
[02]: https://docs.rs/kyberlib "KyberLib on Docs.rs"
[03]: https://lib.rs/crates/kyberlib "KyberLib on Lib.rs"
[04]: https://www.rust-lang.org/learn/get-started "Rust"
