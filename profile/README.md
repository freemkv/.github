<p align="center">
  <img src="https://img.shields.io/github/v/release/freemkv/freemkv?label=latest&color=brightgreen" alt="Latest release">
  <img src="https://img.shields.io/crates/v/libfreemkv" alt="crates.io">
  <img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="AGPL-3.0">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey" alt="Linux | macOS">
</p>

# freemkv

Open source 4K UHD / Blu-ray backup. One binary, no dependencies. Plug in your drive, rip to MKV.

AACS decryption is built in and transparent. Stream labels are extracted automatically — audio purpose, codec detail, forced subtitles, language variants — metadata that other tools can't see. 206 drive profiles bundled. 17+ MB/s sustained.

---

## Why freemkv

- **It just works** — single binary, no Java, no external files, no setup
- **It sees more** — 5 BD-J parsers extract stream labels other tools miss
- **It's fast** — firmware upload removes riplock, adaptive batch sizing, 17+ MB/s
- **It decrypts** — AACS 1.0 + 2.0, transparent, automatic
- **It streams** — disc, file, ISO, network, stdin/stdout — any source to any destination
- **It's open** — pure Rust, AGPL-3.0, library on [crates.io](https://crates.io/crates/libfreemkv)

---

## Install

**Linux:**
```bash
curl -sL https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-unknown-linux-musl.tar.gz | tar xz
```

**macOS (Apple Silicon):**
```bash
curl -sL https://github.com/freemkv/freemkv/releases/latest/download/freemkv-aarch64-apple-darwin.tar.gz | tar xz
```

**macOS (Intel):**
```bash
curl -sL https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-apple-darwin.tar.gz | tar xz
```

**Windows:**

Download [freemkv-x86_64-pc-windows-msvc.zip](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-pc-windows-msvc.zip), extract, and run from Command Prompt as administrator.

**From source:**
```bash
cargo install freemkv
```

[All downloads](https://github.com/freemkv/freemkv/releases) (Linux x86/ARM, macOS Intel/Apple Silicon)

---

## Use

Two arguments — source and destination:

```bash
freemkv disc:// mkv://Dune.mkv
```

That's it. Scans the disc, decrypts, muxes to MKV with all streams and labels.

### Streams

| Stream | Input | Output | URL |
|--------|-------|--------|-----|
| Disc | Yes | -- | `disc://` or `disc:///dev/sg4` |
| ISO | Yes | -- | `iso://image.iso` |
| MKV | Yes | Yes | `mkv://path` |
| M2TS | Yes | Yes | `m2ts://path` |
| Network | Yes (listen) | Yes (connect) | `network://host:port` |
| Stdio | Yes (stdin) | Yes (stdout) | `stdio://` |
| Null | -- | Yes | `null://` |

### Examples

```bash
freemkv disc:// mkv://Dune.mkv                     # Rip to MKV
freemkv disc:// m2ts://Dune.m2ts                    # Rip to transport stream
freemkv iso://Dune.iso mkv://Dune.mkv               # ISO to MKV
freemkv m2ts://Dune.m2ts mkv://Dune.mkv             # Remux
freemkv disc:// network://10.1.7.11:9000            # Stream over network
freemkv network://0.0.0.0:9000 mkv://Dune.mkv      # Receive from network
freemkv disc:// stdio:// | ffmpeg -i pipe:0 ...     # Pipe to ffmpeg
freemkv info disc://                                 # Show disc info
```

### What it sees

```
Disc: Dune: Part Two
Format: 4K UHD (2L, 78.8 GB)
AACS: Encrypted

   1. 00800.mpls      2h 45m   72.0 GB

      Video:     HEVC 2160p HDR10 BT.2020
                 HEVC 1080p Dolby Vision EL

      Audio:     English TrueHD 5.1 (TrueHD)
                 English DD 5.1 (Descriptive Audio (US))
                 English DD 5.1 (Descriptive Audio (UK))
                 French DD 5.1

      Subtitle:  English (forced)
                 French (forced)
```

---

## Details

| | |
|-|-|
| [**freemkv**](https://github.com/freemkv/freemkv) | CLI tool — all commands, flags, streaming examples |
| [**libfreemkv**](https://github.com/freemkv/libfreemkv) | Rust library — API, 7 stream types, architecture, error codes. [crates.io](https://crates.io/crates/libfreemkv) |
| [**bdemu**](https://github.com/freemkv/bdemu) | Drive emulator — develop and test without real hardware |

Supports LG, ASUS, HP, and other MediaTek-based BD-RE drives. Linux, macOS, and Windows. Pioneer planned.

### Help expand drive support

freemkv ships with 206 drive profiles. If your drive isn't supported yet, one command captures everything we need:

```bash
freemkv info disc:// --share
```

This reads your drive's SCSI identity, firmware version, and hardware capabilities — then submits them as a GitHub issue. No disc data, no personal info, no keys. Just the hardware profile. One submission can unlock support for every drive with the same chipset.

Use `--mask` to anonymize serial numbers before sharing.

---

<p align="center">
  <a href="https://github.com/freemkv/freemkv">CLI</a> ·
  <a href="https://github.com/freemkv/libfreemkv">Library</a> ·
  <a href="https://github.com/freemkv/bdemu">Emulator</a> ·
  <a href="https://www.gnu.org/licenses/agpl-3.0.txt">AGPL-3.0</a>
</p>
