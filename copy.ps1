& "$PSScriptRoot/build.ps1"

adb shell am force-stop com.beatgames.beatsaber

adb push libs/arm64-v8a/libconditional-dependencies-test-1.so /sdcard/ModData/com.beatgames.beatsaber/Modloader/mods/libconditional-dependencies-test-1.so
adb push libs/arm64-v8a/libconditional-dependencies-test-2.so /sdcard/ModData/com.beatgames.beatsaber/Modloader/mods/libconditional-dependencies-test-2.so
