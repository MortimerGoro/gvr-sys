# Default bindings
bindgen --unstable-rust --opaque-type "std.*" --whitelist-type "gvr.*" --whitelist-function "gvr.*" -o src/bindings.rs gvr/wrapper.h -- -std=c99
# Android bindings
ANDROID_INCLUDES="$ANDROID_NDK/platforms/android-18/arch-arm/usr/include"
bindgen --unstable-rust --opaque-type "std.*" --whitelist-type "gvr.*" --whitelist-function "gvr.*" -o src/bindings_android.rs gvr/wrapper.h -- -std=c99 -D__ANDROID__ -I$ANDROID_INCLUDES