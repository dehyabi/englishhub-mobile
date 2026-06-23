#!/bin/bash

echo "Installing Flutter SDK..."

# Create flutter directory in home
mkdir -p $HOME/development
cd $HOME/development

# Download Flutter (stable channel)
if [ ! -d "flutter" ]; then
    echo "Downloading Flutter SDK..."
    wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz
    tar xf flutter_linux_3.24.0-stable.tar.xz
    rm flutter_linux_3.24.0-stable.tar.xz
fi

# Add flutter to PATH
export PATH="$HOME/development/flutter/bin:$PATH"

# Verify installation
flutter --version

echo ""
echo "Flutter installed successfully!"
echo "Add this to your ~/.bashrc to make it permanent:"
echo 'export PATH="$HOME/development/flutter/bin:$PATH"'
