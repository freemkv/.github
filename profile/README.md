<p align="center">
  <strong>freemkv</strong> — Open source 4K UHD / Blu-ray / DVD tools
</p>

---

### Projects

| Project | Description | Status |
|---------|-------------|--------|
| **[freemkv](https://github.com/freemkv/freemkv)** | Disc backup CLI | v0.1.0 |
| **[libfreemkv](https://github.com/freemkv/libfreemkv)** | Drive library (206 drive profiles) | v0.1.2 |
| **[bdemu](https://github.com/freemkv/bdemu)** | Drive emulator | v0.1.0 |
| **autorip** | Web automation | Planned |

### What is this?

Open source tools for working with 4K UHD, Blu-ray, DVD, and CD optical drives on Linux. Built in Rust.

- **freemkv** — Back up your disc collection. `freemkv info` for drive info, `--share` to contribute drive profiles.
- **libfreemkv** — Drive library. SCSI commands, identification, raw disc access. 206 drive profiles bundled. [crates.io](https://crates.io/crates/libfreemkv)
- **bdemu** — Drive emulator for development and testing without real hardware.
- **autorip** — Web interface for automated disc processing.

### Contributing

Run `freemkv info --share` to submit your drive's profile and help expand hardware support.

### License

All projects are [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.txt).
