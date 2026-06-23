#!/bin/bash

# Flutter path - update this to match your Flutter installation
FLUTTER="$HOME/development/flutter/bin/flutter"

# Check if flutter exists
if [ ! -f "$FLUTTER" ]; then
    echo "Flutter not found at: $FLUTTER"
    echo "Please install Flutter first:"
    echo "  ./install-flutter.sh"
    echo ""
    echo "Or update the FLUTTER path in install.sh"
    exit 1
fi

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
