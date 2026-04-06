<p align="center">
  <strong>freemkv</strong> — Open source 4K UHD / Blu-ray tools
</p>

---

### Projects

| Project | Description | Status |
|---------|-------------|--------|
| **[freemkv](https://github.com/freemkv/freemkv)** | 4K UHD / Blu-ray / DVD backup CLI | v0.1.0 |
| **[libfreemkv](https://github.com/freemkv/libfreemkv)** | 4K UHD / Blu-ray drive library | In development |
| **[bdemu](https://github.com/freemkv/bdemu)** | Drive emulator with hardware profiles | v0.1.0 |
| **autorip** | Web UI automation | Planned |

### What is this?

A collection of tools for working with 4K UHD, Blu-ray, DVD, and CD optical drives on Linux. Built in Rust.

- **freemkv** — CLI tool for backing up your personal disc collection. Includes `freemkv info` for drive identification and community profile sharing.
- **libfreemkv** — Low-level drive library. Handles SCSI commands, drive identification, and raw disc access.
- **bdemu** — Emulates a drive from captured hardware profiles. Useful for development and testing without real hardware.
- **autorip** — Web interface for automated disc processing.

### Contributing

Run `freemkv info --share` to submit your drive's profile and help expand hardware support. Profiles are automatically processed via GitHub Actions.

### License

All projects are [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.txt).
