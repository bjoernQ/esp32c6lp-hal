Work will continue in https://github.com/esp-rs/esp-hal/tree/main/esp32c6-lp-hal

---

# ESP32-C6 LP HAL

After an experimental phase here this eventually will be moved to https://github.com/esp-rs/esp-hal once this becomes useful.

## Getting Started

Do what `build.bat` does (or use Windows and run it).

Change https://github.com/esp-rs/esp-hal/blob/main/esp32c6-hal/examples/lp_core_basic.rs like this
- `const CODE: &[u8] = include_bytes!("...local directory.../dump.bin");`
- add `core::slice::from_raw_parts_mut(lp_ram, 16*1024).fill(0);` before loading the code to LP RAM
- `let data = (0x50002000) as *mut u32;`

And run the `lp_core_basic` example.
