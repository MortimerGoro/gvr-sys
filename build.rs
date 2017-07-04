use std::env;

fn main() {
    let target = env::var("TARGET").unwrap();
    let android = target.contains("android");

    // Export shared libraries search path.
    if android {
        let abi = if target.contains("aarch64") {
            "arm64-v8a"
        } else if target.contains("x86") {
            "x86"
        } else if target.contains("arm") {
            "armeabi-v7a"
        } else {
            panic!("Invalid Android target architecture {}", target);
        };
        
        println!("cargo:rustc-link-search={}/gvr/libs/{}", env!("CARGO_MANIFEST_DIR"), abi);
        println!("cargo:rustc-link-lib=gvr");
        println!("cargo:rustc-link-lib=gvr_audio");
    }
}
