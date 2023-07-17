//! The prelude
//!
//! Re-exports all traits required for interacting with the various peripheral
//! drivers implemented in this crate.

pub use embedded_hal::digital::v2::OutputPin;
pub use embedded_hal::prelude::*;

pub use crate::delay;
pub use riscv_rt_macros::entry;
