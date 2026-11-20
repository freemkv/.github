<p align="center">
  <img src="https://img.shields.io/github/v/release/freemkv/freemkv?label=latest&color=brightgreen" alt="Latest release">
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-lightgrey" alt="Linux | macOS | Windows">
</p>

# freemkv

Open source 4K UHD, Blu-ray, HD DVD and DVD backup. Plug in your drive and rip to MKV. It ships as a command-line tool, a native desktop app and a server with a web UI, all built on the same engine.

Stream labels are extracted automatically (audio purpose, codec detail, forced subtitles, language variants), which other tools often miss.

---

## Quick Start

### 1. Install

Two builds are available, and both install the `freemkv` command. Install one or the other.

- **App**: the desktop window plus the full command line.
- **CLI**: command line only, no UI libraries.

| | freemkv (app) | freemkv CLI |
|---|---|---|
| **Windows** | [Installer](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-windows-setup.exe), [portable zip](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-windows.zip) or `scoop install freemkv` | [freemkv-cli-x86_64-windows.exe](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-cli-x86_64-windows.exe) or `scoop install freemkv-cli` |
| **macOS** | `brew install --cask freemkv/tap/freemkv` | `brew install freemkv/tap/freemkv-cli` |
| **Linux** | [freemkv-amd64.deb](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-amd64.deb), [AppImage](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-linux.AppImage) or [Flatpak](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-x86_64-linux.flatpak) | [freemkv-cli-amd64.deb](https://github.com/freemkv/freemkv/releases/latest/download/freemkv-cli-amd64.deb) or the static `freemkv-cli-x86_64-linux` / `freemkv-cli-aarch64-linux` binary |

For Scoop, first run `scoop bucket add freemkv https://github.com/freemkv/scoop-bucket`. See the [install guide](https://github.com/freemkv/freemkv/blob/main/INSTALL.md) for every asset, checksums and the other package formats, or [all downloads](https://freemkv.org/download).

### 2. Set up decryption keys (one time)

**DVD:** no setup needed. CSS decryption works out of the box.

**Blu-ray and 4K UHD:** you need a `keydb.cfg`, a community-maintained AACS key database. freemkv cannot ship keys for legal reasons.

```bash
freemkv update-keys --url <your-keydb-url>
```

It is saved to `~/.config/freemkv/keydb.cfg` and used automatically from then on.

### 3. Rip

```bash
freemkv disc:// mkv://Movie.mkv
```

This scans the disc, decrypts it and muxes to MKV with all streams and labels.

freemkv rips the main title by default. Add `-t all` to rip every title as a separate file, or `-t N` to pick one. Run `freemkv info disc://` to list the titles with their durations.

---

## Server (Docker)

Insert a disc and walk away. `freemkv-library` is the freemkv server: unattended ripping, a web UI, and library tools for the MKVs and ISOs you already have.

```bash
docker pull ghcr.io/freemkv/freemkv-library:latest
```

Start from the [Docker Compose example](https://github.com/freemkv/freemkv/blob/main/docker/docker-compose.example.yml), open `http://localhost:8080` and configure keys and destinations in Settings. On Unraid, use the [template](https://github.com/freemkv/unraid-templates). See the [library docs](https://freemkv.org/docs/library/).

---

## Streams

Every operation is `freemkv <source> <destination>`.

| Stream | Input | Output | URL |
|--------|-------|--------|-----|
| Disc | Yes | -- | `disc://` or `disc:///dev/sg4` |
| ISO | Yes | Yes | `iso://image.iso` |
| MKV | Yes | Yes | `mkv://path` |
| M2TS | Yes | Yes | `m2ts://path` |
| Network | Yes (listen) | Yes (connect) | `network://host:port` |
| Stdio | Yes (stdin) | Yes (stdout) | `stdio://` |
| Null | -- | Yes | `null://` |

More stream types are listed in the [freemkv README](https://github.com/freemkv/freemkv#streams).

```bash
freemkv disc:// mkv://Dune.mkv                     # Rip to MKV, main title
freemkv disc:// mkv://out/ -t all                  # Rip every title, one file each
freemkv iso://Dune.iso mkv://Dune.mkv              # ISO to MKV
freemkv m2ts://Dune.m2ts mkv://Dune.mkv            # Remux
freemkv disc:// stdio:// | ffmpeg -i pipe:0 ...    # Pipe to ffmpeg
freemkv info disc://                               # Show disc info
```

---

## Repos

| | |
|-|-|
| [**freemkv**](https://github.com/freemkv/freemkv) | The app, CLI and server: commands, flags and streaming examples |
| [**libfreemkv**](https://github.com/freemkv/libfreemkv) | Rust library for raw disc access: API, streams, error codes |
| [**freemkv-engine**](https://github.com/freemkv/freemkv-engine) | Shared rip orchestration between libfreemkv and the front ends |
| [**freemkv-firmware**](https://github.com/freemkv/freemkv-firmware) | `freemkv-flash` and `freemkv-fw`: back up, flash and modify optical-drive firmware |
| [**bdemu**](https://github.com/freemkv/bdemu) | Drive emulator for development and testing without real hardware |
| [**homebrew-tap**](https://github.com/freemkv/homebrew-tap), [**scoop-bucket**](https://github.com/freemkv/scoop-bucket) | Homebrew and Scoop packages |
| [**unraid-templates**](https://github.com/freemkv/unraid-templates) | Unraid Docker template for freemkv-library |
| [**marketing**](https://github.com/freemkv/marketing) | Source of [freemkv.org](https://freemkv.org) |

### Help expand drive support

```bash
freemkv info disc:// --share
```

This captures your drive's hardware profile and submits it as a GitHub issue. No disc data, no personal info, no keys. Use `--mask` to anonymize serial numbers.

---

<p align="center">
  <a href="https://freemkv.org">Website</a> ·
  <a href="https://github.com/freemkv/freemkv">freemkv</a> ·
  <a href="https://github.com/freemkv/libfreemkv">Library</a> ·
  <a href="https://github.com/freemkv/bdemu">Emulator</a> ·
  <a href="https://github.com/freemkv/freemkv/blob/main/LICENSE">MIT</a>
</p>
