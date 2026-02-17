.PHONY: format lint test build clean

format:
	swiftformat .

lint:
	swiftlint --strict

test:
	xcodebuild test -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16'

build:
	xcodebuild build -scheme Aperture -configuration Debug -sdk iphonesimulator

clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	xcodebuild clean -scheme Aperture
