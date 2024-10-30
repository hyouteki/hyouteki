#!/bin/bash
source ~/AndroidStudioProjects/android.bashrc
set -xe

avd=$(emulator -list-avds 2>/dev/null | grep -E '^[A-Za-z0-9_]+$')
if [[ -z "$avd" ]]; then
    echo "No AVD found"
    exit 1
fi

emulator -avd $avd &
avd_pid=$!

function cleanup() {
	kill -9 $avd_pid
}

wait
trap cleanup EXIT
