#!/bin/bash

# Use flutter from PATH or specify custom path
FLUTTER="${FLUTTER_HOME:-flutter}"

echo "Building EnglishHub APK..."
$FLUTTER clean
$FLUTTER pub get
$FLUTTER build apk --release

if [ -f "build/app/outputs/flutter-apk/app-release.apk" ]; then
    echo "Installing APK..."
    adb install build/app/outputs/flutter-apk/app-release.apk
    echo "Installation complete!"
else
    echo "Error: APK not found. Build failed."
    exit 1
fi
