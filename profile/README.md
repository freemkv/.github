<p align="center">
  <img src="https://img.shields.io/github/v/release/freemkv/freemkv?label=latest&color=brightgreen" alt="Latest release">
  <img src="https://img.shields.io/badge/rust-stable-orange" alt="Rust">
  <img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="AGPL-3.0">
  <img src="https://img.shields.io/badge/platform-Linux-lightgrey" alt="Linux">
</p>

# freemkv

Open source tools for backing up 4K UHD and Blu-ray discs. Built in Rust.

Drive profiles are bundled. AACS decryption is built-in and transparent. Plug in your drive and go.

---

## Download

**Latest: v0.1.8 (2026-04-06)**

| Platform | | |
|----------|-|---|
| Linux (Intel/AMD) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.1.8/freemkv-v0.1.8-x86_64-unknown-linux-musl.tar.gz) | Most desktops and servers |
| Linux (ARM) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.1.8/freemkv-v0.1.8-aarch64-unknown-linux-musl.tar.gz) | Raspberry Pi, ARM servers |
| macOS | Coming soon | |
| Windows | Coming soon | |

[All releases](https://github.com/freemkv/freemkv/releases) · Build from source: `cargo install freemkv`

---

## Quick Start

```bash
./freemkv drive-info
```

```
freemkv 0.2.0

Drive Information
  Device:              /dev/sg4
  Manufacturer:        HL-DT-ST
  Product:             BD-RE BU40N
  Revision:            1.03
  Firmware date:       2018-10-24

Platform Information
  Drive platform:      MTK MT1959
  Firmware version:    1.03/NM00000

Run 'freemkv drive-info --share' to help expand drive support.
```

```bash
# Show disc contents
./freemkv disc-info

# Back up a disc
./freemkv rip --output ~/backups/

# Share your drive profile
./freemkv drive-info --share
```

---

## Repositories

| Repository | What it does |
|------------|--------------|
| [**freemkv**](https://github.com/freemkv/freemkv) | CLI tool — drive info, disc scanning, disc backup |
| [**libfreemkv**](https://github.com/freemkv/libfreemkv) | Rust library — SCSI, UDF, MPLS, CLPI, AACS. [crates.io](https://crates.io/crates/libfreemkv) · [docs](https://github.com/freemkv/libfreemkv/tree/main/docs) |
| [**bdemu**](https://github.com/freemkv/bdemu) | Drive emulator — develop and test without hardware |

---

## How It Works

Identify drive → match profile → unlock → scan disc → decrypt AACS → read content.

See the [full technical documentation](https://github.com/freemkv/libfreemkv/tree/main/docs), starting with the [end-to-end flow](https://github.com/freemkv/libfreemkv/blob/main/docs/disc-to-rip.md).

---

## Hardware

Supports MediaTek MT1959 drives (LG, ASUS, HP). Pioneer/Renesas planned.

Run `freemkv drive-info --share` to submit your drive's profile and help expand support.

---

## Platform

Linux today. macOS and Windows planned. The SCSI transport is behind a trait — adding platforms is straightforward.

---

## Contributing

Run `freemkv drive-info --share` to submit your drive profile. Code contributions welcome.

---

<p align="center">
  <a href="https://github.com/freemkv/freemkv">CLI</a> ·
  <a href="https://github.com/freemkv/libfreemkv">Library</a> ·
  <a href="https://github.com/freemkv/bdemu">Emulator</a> ·
  <a href="https://www.gnu.org/licenses/agpl-3.0.txt">AGPL-3.0</a>
</p>
