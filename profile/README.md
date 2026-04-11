<p align="center">
  <img src="https://img.shields.io/github/v/release/freemkv/freemkv?label=latest&color=brightgreen" alt="Latest release">
  <img src="https://img.shields.io/badge/rust-stable-orange" alt="Rust">
  <img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="AGPL-3.0">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey" alt="Linux | macOS">
</p>

# freemkv

Open source tools for backing up 4K UHD and Blu-ray discs. Built in Rust.

Two arguments — source and destination. Stream URLs let you rip, remux, and transfer between any combination of disc, file, and network. Drive profiles are bundled. AACS decryption is transparent. Stream labels are extracted automatically.

---

## Features

- **4K UHD + Blu-ray + DVD** — one tool for all optical disc formats
- **Stream architecture** — `freemkv <source> <dest>` with 7 stream types
- **MKV output** — direct rip to MKV with all streams, or raw m2ts
- **AACS 1.0 + 2.0 decryption** — transparent key resolution, bus decryption, per-sector decrypt
- **Stream labels** — 5 BD-J parsers extract audio/subtitle metadata other tools can't see
- **Drive unlock + speed boost** — firmware upload removes riplock, 17+ MB/s sustained
- **Network streaming** — rip on one machine, remux on another
- **ISO image support** — read directly from Blu-ray ISO images
- **Profile sharing** — `--share` captures and submits your drive profile to expand support
- **Multi-lingual** — zero English in the library, all strings externalized in the CLI
- **Single binary** — no dependencies, no Java, no external files
- **Pure Rust** — library on [crates.io](https://crates.io/crates/libfreemkv), build any tool on top

---

## Download

**Latest: v0.7.0 (2026-04-11)**

| Platform | | |
|----------|-|---|
| Linux (Intel/AMD) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.7.0/freemkv-v0.7.0-x86_64-unknown-linux-musl.tar.gz) | Most desktops and servers |
| Linux (ARM) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.7.0/freemkv-v0.7.0-aarch64-unknown-linux-musl.tar.gz) | Raspberry Pi, ARM servers |
| macOS (Apple Silicon) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.7.0/freemkv-v0.7.0-aarch64-apple-darwin.tar.gz) | M1/M2/M3/M4 Macs |
| macOS (Intel) | [**Download**](https://github.com/freemkv/freemkv/releases/download/v0.7.0/freemkv-v0.7.0-x86_64-apple-darwin.tar.gz) | Older Intel Macs |
| Windows | Coming soon | |

[All releases](https://github.com/freemkv/freemkv/releases) · Build from source: `cargo install freemkv`

---

## Streams

Every operation is `freemkv <source> <dest>`. Sources and destinations are stream URLs.

| Stream | Input | Output | URL |
|--------|-------|--------|-----|
| Disc | Yes | -- | `disc://` or `disc:///dev/sg4` |
| ISO | Yes | -- | `iso://image.iso` |
| MKV | Yes | Yes | `mkv://path` |
| M2TS | Yes | Yes | `m2ts://path` |
| Network | Yes (listen) | Yes (connect) | `network://host:port` |
| Stdio | Yes (stdin) | Yes (stdout) | `stdio://` |
| Null | -- | Yes | `null://` |

```bash
# Rip disc to MKV
freemkv disc:// mkv://Dune.mkv

# Rip to raw transport stream
freemkv disc:// m2ts://Dune.m2ts

# Rip from ISO image
freemkv iso://Dune.iso mkv://Dune.mkv

# Remux between formats
freemkv m2ts://Dune.m2ts mkv://Dune.mkv

# Stream disc to network
freemkv disc:// network://10.1.7.11:9000

# Receive from network
freemkv network://0.0.0.0:9000 mkv://Dune.mkv

# Pipe to other tools
freemkv disc:// stdio:// | ffmpeg -i pipe:0 -c copy output.mkv

# Benchmark read speed
freemkv disc:// null://
```

---

## Quick Start

```bash
# Download and extract (Linux x86_64)
wget -qO- https://github.com/freemkv/freemkv/releases/latest/download/freemkv-v0.7.0-x86_64-unknown-linux-musl.tar.gz | tar xz
```

```bash
# See what's on the disc
./freemkv info disc://
```

```
Disc: Dune: Part Two
Format: 4K UHD (2L, 78.8 GB)
AACS: Encrypted

Titles

   1. 00800.mpls      2h 45m   72.0 GB  1 clip

      Video:     HEVC 2160p HDR10 BT.2020
                 HEVC 1080p Dolby Vision BT.2020 Dolby Vision EL

      Audio:     English TrueHD 5.1 (TrueHD)
                 English DD 5.1 (Dolby Digital)
                 English DD 5.1 (Descriptive Audio (US))
                 English DD 5.1 (Descriptive Audio (UK))
                 French DD 5.1
                 Spanish DD 5.1

      Subtitle:  English (forced)
                 French (forced)
                 Spanish
```

Labels like `TrueHD`, `Descriptive Audio`, and `forced` are extracted from BD-J disc files — data that standard tools can't see.

```bash
# Rip to MKV
./freemkv disc:// mkv://~/Movies/Dune.mkv
```

```
freemkv 0.7.0

Opening disc://... OK
  HL-DT-ST BD-RE BU40N
Waiting for disc... OK
Initializing drive... OK
Probing disc... OK
Scanning disc... OK

  Capacity: 90.7 GB
  AACS:     encrypted (keys found)

Ripping title 1 (2h 35m, 88.8 GB) -> Dune.mkv
  22.1 GB / 88.8 GB  (25%)  17.2 MB/s  ETA 65:23
```

---

## Stream Labels

freemkv reads BD-J authoring files to extract rich stream metadata beyond what MPLS provides:

- **Audio purpose** — Commentary, Descriptive Audio, Score
- **Codec detail** — TrueHD, Dolby Digital, Dolby Atmos
- **Forced subtitles** — which tracks are forced/narrative
- **Language variants** — US vs UK English, Castilian vs Latin Spanish
- **SDH** — subtitles for deaf/hard of hearing

Five format parsers built in (Paramount, Criterion, Pixelogic, Warner CTRM, Deluxe). Automatic detection.

---

## Repositories

| Repository | What it does |
|------------|--------------|
| [**freemkv**](https://github.com/freemkv/freemkv) | CLI tool — stream-based disc backup, remux, network streaming |
| [**libfreemkv**](https://github.com/freemkv/libfreemkv) | Rust library — SCSI, UDF, AACS, 7 stream types, MKV muxer, stream labels. [crates.io](https://crates.io/crates/libfreemkv) |
| [**bdemu**](https://github.com/freemkv/bdemu) | Drive emulator — develop and test without hardware |

---

## How It Works

1. **Identify** — reads drive INQUIRY and GET_CONFIG
2. **Match** — finds the right profile from 206 bundled drive profiles
3. **Init** — uploads firmware, removes riplock, probes disc for optimal speeds
4. **Scan** — UDF filesystem, playlists, clip info, BD-J stream labels
5. **Decrypt** — AACS 1.0/2.0 key resolution + transparent decryption
6. **Stream** — pipe through any combination of disc, file, network, or stdio

---

## Hardware

Supports MediaTek MT1959 drives (LG, ASUS, HP). Pioneer support planned.

Run `freemkv info disc:// --share` to submit your drive profile.

---

## Platform

| Platform | Status |
|----------|--------|
| Linux | Supported (SG_IO) |
| macOS | Supported (IOKit) |
| Windows | Planned (SPTI) |

---

<p align="center">
  <a href="https://github.com/freemkv/freemkv">CLI</a> ·
  <a href="https://github.com/freemkv/libfreemkv">Library</a> ·
  <a href="https://github.com/freemkv/bdemu">Emulator</a> ·
  <a href="https://www.gnu.org/licenses/agpl-3.0.txt">AGPL-3.0</a>
</p>
