<p align="center">
  <strong>freemkv</strong> — Open source 4K UHD / Blu-ray / DVD tools
</p>

---

### Projects

| Project | Description | Status |
|---------|-------------|--------|
| **[freemkv](https://github.com/freemkv/freemkv)** | Disc backup CLI | v0.1.0 |
| **[libfreemkv](https://github.com/freemkv/libfreemkv)** | Drive library | In development |
| **[bdemu](https://github.com/freemkv/bdemu)** | Drive emulator | v0.1.0 |
| **autorip** | Web automation | Planned |

### What is this?

Open source tools for working with 4K UHD, Blu-ray, DVD, and CD optical drives on Linux. Built in Rust.

- **freemkv** — Back up your disc collection from the command line. Includes `freemkv info` for drive identification and community profile sharing.
- **libfreemkv** — Low-level drive library. SCSI commands, drive identification, raw disc access.
- **bdemu** — Drive emulator. Test and develop without real hardware using captured drive profiles.
- **autorip** — Web interface for automated disc processing.

### Contributing

Run `freemkv info --share` to submit your drive's profile and help expand hardware support.

### License

All projects are [AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.txt).
