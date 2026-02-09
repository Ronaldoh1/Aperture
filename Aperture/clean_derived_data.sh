#!/bin/bash

# Clean Derived Data for Aperture
# Run from project root: ./clean_derived_data.sh

echo "🧹 Cleaning Derived Data..."

# Remove Xcode derived data for this project
rm -rf ~/Library/Developer/Xcode/DerivedData/Aperture-*

# Remove build folder if exists
rm -rf .build
rm -rf Build

# Remove SPM cache for this project
rm -rf .swiftpm

# Remove xcuserdata
find . -name "xcuserdata" -type d -exec rm -rf {} + 2>/dev/null

echo "✅ Derived data cleaned!"
echo ""
echo "📱 To build and run:"
echo "   xcodebuild -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16 Pro Max' clean build"
echo ""
echo "🚀 Or open in Xcode:"
echo "   open Aperture.xcodeproj"
