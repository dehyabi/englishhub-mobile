FLUTTER="/tmp/flutter/bin/flutter"

$FLUTTER clean
$FLUTTER pub get
$FLUTTER build apk --release
adb install build/app/outputs/flutter-apk/app-release.apk
