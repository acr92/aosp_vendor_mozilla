# Mozilla Firefox for AOSP

This repository contains the build file necessary for including Mozilla Firefox into
an Android Open Source (AOSP) build, on the system image.

I created it after struggling to get Firefox.apk bundled on the system image. I would
get weird linker errors, which I eventually figured out was caused by Firefox expecting
the native code shared libraries to be located in /system/app/Firefox/lib/arm64.

## Where to find AMD64 builds for Android

You can find AMD64 builds for Android at:

http://archive.mozilla.org/pub/mobile/releases/

## How to include in your build

Add this repository to the manifest file (check inside `${ANDROID_BUILD_TOP}/.repo/manifests/`):
```
<remote name="github-blystad" fetch="https://github.com/Blystad/"  />
<project path="vendor/mozilla" name="aosp_vendor_mozilla" revision="master" remote="github-blystad">
```

Then add:
```
PRODUCT_PACKAGES += Firefox
```

To your device.mk file.
