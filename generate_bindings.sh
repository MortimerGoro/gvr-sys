# Default bindings
bindgen --unstable-rust --opaque-type "std.*" --whitelist-type "gvr.*" --whitelist-function "gvr.*" --rustified-enum "gvr.*" -o src/bindings.rs gvr/wrapper.h -- -std=c99 -I/usr/include/clang/3.9/include
# Android bindings
ANDROID_INCLUDES="$ANDROID_NDK/platforms/android-18/arch-arm/usr/include"
bindgen --unstable-rust --opaque-type "std.*" --whitelist-type "gvr.*" --whitelist-function "gvr.*" --rustified-enum "gvr.*" -o src/bindings_android.rs gvr/wrapper.h -- -std=c99 -D__ANDROID__ -I$ANDROID_INCLUDES -I/usr/include/clang/3.9/include