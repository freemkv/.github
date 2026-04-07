<p align="center">
  <img src="https://img.shields.io/github/v/release/freemkv/freemkv?label=latest&color=brightgreen" alt="Latest release">
  <img src="https://img.shields.io/badge/rust-stable-orange" alt="Rust">
  <img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="AGPL-3.0">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey" alt="Linux | macOS">
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
| macOS (Apple Silicon) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.1.8/freemkv-v0.1.8-aarch64-apple-darwin.tar.gz) | M1/M2/M3/M4 Macs |
| macOS (Intel) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.1.8/freemkv-v0.1.8-x86_64-apple-darwin.tar.gz) | Older Intel Macs |
| Windows | Coming soon | |

[All releases](https://github.com/freemkv/freemkv/releases) · Build from source: `cargo install freemkv`

---

## Quick Start

```bash
# Download and extract (Linux x86_64)
wget -qO- https://github.com/freemkv/freemkv/releases/latest/download/freemkv-v0.1.8-x86_64-unknown-linux-musl.tar.gz | tar xz
```

```bash
# See what drive you have
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
# See what's on the disc — titles, audio tracks, subtitles, HDR format
./freemkv disc-info
```

```
freemkv 0.2.0

Disc Information
  Volume ID:           DUNE_PART_TWO_4KUHD
  AACS:                Encrypted (keys found)
  Playlists:           18

Titles
  #0   2:46:29   48.2 GB   Main feature
       Video:    HEVC 3840x2160 HDR10 23.976fps
       Audio:    TrueHD Atmos 7.1 (English)
       Audio:    AC-3 5.1 (French)
       Audio:    AC-3 5.1 (Spanish)
       Subtitle: PGS (English)
       Subtitle: PGS (French)
       Subtitle: PGS (Spanish)
  #1   0:05:12   1.8 GB    Behind the scenes
  #2   0:02:44   0.9 GB    Trailer
```

```bash
# Back up the main title
./freemkv rip --output ~/Movies/

# Share your drive profile to help expand support
./freemkv drive-info --share --mask
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

1. **Identify** — reads your drive's INQUIRY and GET_CONFIG responses
2. **Match** — finds the right profile from the bundled database
3. **Unlock** — sends the vendor-specific SCSI command to enable raw reads
4. **Scan** — parses UDF filesystem, playlists (MPLS), clip info (CLPI), BD-J labels
5. **Decrypt** — resolves AACS keys from KEYDB and decrypts content transparently
6. **Read** — streams decrypted sectors to output files

See the [full technical documentation](https://github.com/freemkv/libfreemkv/tree/main/docs), starting with the [end-to-end flow](https://github.com/freemkv/libfreemkv/blob/main/docs/disc-to-rip.md).

---

## Hardware

Supports MediaTek MT1959 drives (LG, ASUS, HP). Pioneer/Renesas planned.

Run `freemkv drive-info --share` to submit your drive's profile and help expand support.

---

## Platform

| Platform | Status | Backend |
|----------|--------|---------|
| Linux | Supported | SG_IO ioctl |
| macOS | Supported | IOKit SCSITask |
| Windows | Planned | SPTI |

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
