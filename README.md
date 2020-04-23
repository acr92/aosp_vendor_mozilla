# Mozilla Firefox for AOSP

This repository contains the build file necessary for including Mozilla Firefox into
an Android Open Source (AOSP) build, on the system image.

I created it after struggling to get Firefox.apk bundled on the system image. I would
get weird linker errors, which I eventually figured out was caused by Firefox expecting
the native code shared libraries to be located in /system/app/Firefox/lib/arm64.

## Where to find AMD64 builds for Android

You can find AMD64 builds for Android at:

http://archive.mozilla.org/pub/mobile/releases/
