<p align="center">
  <strong>freemkv</strong> — Open source 4K UHD / Blu-ray / DVD tools
</p>

---

### Projects

| Project | Description | Status |
|---------|-------------|--------|
| **[freemkv](https://github.com/freemkv/freemkv)** | 4K UHD / Blu-ray / DVD backup tool | v0.1.0 |
| **[libfreemkv](https://github.com/freemkv/libfreemkv)** | 4K UHD / Blu-ray / DVD drive library | In development |
| **[bdemu](https://github.com/freemkv/bdemu)** | 4K UHD / Blu-ray / DVD drive emulator | v0.1.0 |
| **autorip** | 4K UHD / Blu-ray / DVD web automation | Planned |

### What is this?

Open source tools for working with 4K UHD, Blu-ray, DVD, and CD optical drives on Linux. Built in Rust.

- **freemkv** — CLI tool for backing up your 4K UHD / Blu-ray / DVD disc collection. Includes `freemkv info` for drive identification and community profile sharing.
- **libfreemkv** — Low-level 4K UHD / Blu-ray / DVD drive library. Handles SCSI commands, drive identification, and raw disc access.
- **bdemu** — 4K UHD / Blu-ray / DVD drive emulator. Emulates drives from captured hardware profiles for development and testing without real hardware.
- **autorip** — Web interface for automated 4K UHD / Blu-ray / DVD disc processing.

### Contributing

Run `freemkv info --share` to submit your drive's profile and help expand hardware support. Profiles are automatically processed via GitHub Actions.

### License

All projects are [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.txt).
