<p align="center">
  <img src="https://img.shields.io/badge/drives-206-brightgreen" alt="206 supported drives">
  <img src="https://img.shields.io/badge/rust-stable-orange" alt="Rust">
  <img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="AGPL-3.0">
  <img src="https://img.shields.io/badge/platform-Linux-lightgrey" alt="Linux">
</p>

# freemkv

Open source tools for backing up 4K UHD, Blu-ray, and DVD discs. Built in Rust.

No proprietary fingerprints. No encrypted lookups. Drive identification uses standard SCSI commands (SPC-4 INQUIRY + MMC-6 GET CONFIGURATION) and all 206 drive profiles are bundled into the binary. Plug in your drive and go.

---

## Quick Start

**Download prebuilt binaries** from [Releases](https://github.com/freemkv/libfreemkv/releases/latest) — or build from source:

```bash
cargo install freemkv

sudo freemkv info
```

```
Drive Information
  Device:              /dev/sr0
  Vendor:              HL-DT-ST
  Product:             BD-RE BU40N
  Revision:            1.03
  Firmware type:       NM00000
  Firmware date:       2018-10-24

Profile Match
  Chipset:             MediaTek MT1959
  Status:              Matched (ready to unlock)
```

```bash
# Share your drive profile (helps expand hardware support)
sudo freemkv info --share

# Back up a disc (coming soon)
sudo freemkv rip --output ~/backups/
```

---

## Repositories

| | Repository | What it does |
|-|------------|--------------|
| | [**freemkv**](https://github.com/freemkv/freemkv) | CLI tool — identify drives, share profiles, back up discs |
| | [**libfreemkv**](https://github.com/freemkv/libfreemkv) | Rust library — SCSI transport, drive identification, raw sector reads. [crates.io](https://crates.io/crates/libfreemkv) |
| | [**bdemu**](https://github.com/freemkv/bdemu) | Drive emulator — test without hardware using `LD_PRELOAD` SCSI interception |

---

## Supported Hardware

**206 optical drives** across the MediaTek MT1959 chipset. Covers most LG, ASUS, and HP Blu-ray drives from the last decade.

| Chipset | Status | Drives | Brands |
|---------|--------|--------|--------|
| MediaTek MT1959 | Supported | 206 | LG, ASUS, HP |
| Renesas | Planned | -- | Pioneer |

Don't see your drive? Run `freemkv info --share` to submit your profile. Expanding hardware support is our top priority.

---

## How It Works

1. **Identify** — SCSI INQUIRY reads the drive's vendor, product, revision, and firmware type. GET CONFIGURATION 010C reads the firmware date. These five fields uniquely identify a drive.

2. **Match** — The identity is matched against 206 bundled profiles. Each profile contains the exact SCSI READ BUFFER parameters for that drive's chipset (mode byte, buffer ID, expected response signature).

3. **Unlock** — A single READ BUFFER command activates raw read mode. The drive confirms with a 4-byte signature. No flashing, no persistent changes to the drive.

4. **Read** — Standard READ(10) with the raw flag reads unprocessed sectors directly from disc. Speed calibration optimizes throughput per disc region.

---

## Platform Support

| Platform | freemkv CLI | libfreemkv | bdemu |
|----------|-------------|------------|-------|
| Linux | Supported | Supported (SG_IO) | Supported (LD_PRELOAD) |
| macOS | Planned | Planned (IOKit) | Planned |
| Windows | Planned | Planned (SPTI) | N/A |

The SCSI transport layer is behind a trait — adding macOS and Windows backends is straightforward. Linux is fully working today.

---

## For Developers

bdemu lets you develop and test without a physical drive. It intercepts SCSI commands via `LD_PRELOAD` and emulates a complete optical drive from captured hardware profiles.

```bash
# Build the emulator
cd bdemu && cargo build --release

# Emulate a BU40N with a disc loaded
BDEMU_PROFILE=profiles/bu40n BDEMU_DISC=test_disc \
  LD_PRELOAD=target/release/libbdemu.so \
  freemkv info
```

Create your own disc profiles from real hardware:

```bash
bdemu capture-disc /dev/sr0 profiles/my-drive/discs/my-disc/
```

---

## Contributing

The fastest way to help: run `freemkv info --share` and submit your drive's profile. Every new profile expands hardware support for everyone.

Code contributions welcome. See individual repo CONTRIBUTING.md files.

---

<p align="center">
  <a href="https://github.com/freemkv/freemkv">CLI</a> ·
  <a href="https://github.com/freemkv/libfreemkv">Library</a> ·
  <a href="https://github.com/freemkv/bdemu">Emulator</a> ·
  <a href="https://www.gnu.org/licenses/agpl-3.0.txt">AGPL-3.0</a>
</p>
