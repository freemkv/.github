<p align="center">
  <strong>freemkv</strong> — Open source Blu-ray tools
</p>

---

### Projects

| Project | Description | Status |
|---------|-------------|--------|
| **[libfreemkv](https://github.com/freemkv/libfreemkv)** | Rust BD drive library | In development |
| **[bdemu](https://github.com/freemkv/bdemu)** | Drive emulator with hardware profiles | v0.1.0 |
| **[freemkv-info](https://github.com/freemkv/freemkv-info)** | Drive info & profile capture | v0.1.0 |
| **freemkv** | CLI disc ripper | Planned |
| **autorip** | Web UI automation | Planned |

### What is this?

A collection of tools for working with Blu-ray, DVD, and CD optical drives on Linux. Built in Rust.

- **libfreemkv** — Low-level drive library. Handles SCSI commands, drive identification, and raw disc access.
- **bdemu** — Emulates a BD drive from captured hardware profiles. Useful for development and testing without real hardware.
- **freemkv-info** — Shows drive capabilities and captures profiles for bdemu.
- **freemkv** — CLI tool for backing up your personal disc collection.
- **autorip** — Web interface for automated disc processing.

### License

All projects are [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.txt).

### Contributing

Contributions welcome. Run `freemkv-info --share` to submit your drive's profile and help expand hardware support.
