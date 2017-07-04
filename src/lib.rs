#![allow(dead_code)]
#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

#[cfg(not(target_os = "android"))]
include!("bindings.rs");

#[cfg(target_os = "android")]
include!("bindings_android.rs");