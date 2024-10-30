#!/bin/bash
source ~/AndroidStudioProjects/android.bashrc
set -xe

root=$(pwd)
cd $root

adb wait-for-device shell 'while [[ $(getprop sys.boot_completed) != "1" ]]; do sleep 1; done;'

apk_path="app/build/outputs/apk/debug/app-debug.apk"
package_name=$(aapt dump badging $apk_path | grep "package: name=" | awk -F"'" '{print $2}')
main_activity=$(aapt dump badging $apk_path | grep "launchable-activity: name=" | awk -F"'" '{print $2}')

# Build the app and install it on the running AVD
./gradlew assembleDebug
adb install -r $apk_path

# Launch the app
adb shell am start -n "${package_name}/${main_activity}"
