#!/bin/bash

# Flutter path
FLUTTER="$HOME/development/flutter/bin/flutter"

# Check if flutter exists
if [ ! -f "$FLUTTER" ]; then
    echo "Flutter not found at: $FLUTTER"
    echo "Please install Flutter first or update the FLUTTER path in install.sh"
    exit 1
fi

# Check if adb is available
if ! command -v adb &> /dev/null; then
    echo "Error: adb not found. Please install Android Platform Tools."
    exit 1
fi

# Check for connected device
DEVICE=$(adb devices | grep -v "List" | grep "device" | head -1 | awk '{print $1}')
if [ -z "$DEVICE" ]; then
    echo "Error: No Android device connected via adb."
    echo "Make sure USB debugging is enabled and device is connected."
    exit 1
fi

echo "✓ Device found: $DEVICE"

# Build debug APK (avoids Kotlin version mismatch in release builds)
echo "Building EnglishHub APK..."
$FLUTTER build apk --debug

APK="build/app/outputs/flutter-apk/app-debug.apk"

if [ ! -f "$APK" ]; then
    echo "Error: APK not found. Build failed."
    exit 1
fi

echo "✓ Build successful"

# Push APK to device then install (more reliable than adb install for large APKs)
echo "Pushing APK to device..."
adb push "$APK" /data/local/tmp/app-debug.apk

echo "Installing APK..."
adb shell pm install -r /data/local/tmp/app-debug.apk

# Clean up temp file on device
adb shell rm /data/local/tmp/app-debug.apk 2>/dev/null

echo "✓ Installation complete!"