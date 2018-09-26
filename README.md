# KitKat_prebuilt_webview
Prebuilt Webview for SlimKAT (SlimROMS, branch kk4.4, based on Android 4.4)

In Android 4.4 (KitKat), Webview is built from source within the build tree and part of the OS.
Building webview takes a very long time, so doing a clean build takes a huge amount of time, as webview alone requires about the same time like the android OS.

Therefore, this prebuilt repo has been created. It contains the built Webview from https://github.com/SlimRomsSecurity 

How to use:
Synch this repo into your build tree (proposal: external/chromium-webview - location does not matter)

Do your build with a shell script as follows:
```
export PRODUCT_PREBUILT_WEBVIEWCHROMIUM=yes
source build/envsetup.sh
brunch <your device>
```
