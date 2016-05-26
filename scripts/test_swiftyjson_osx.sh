#!/usr/bin/env bash

set -e

# install xcpetty
gem install xcpretty

# install swift binaries
SWIFT_SNAPSHOT=swift-DEVELOPMENT-SNAPSHOT-2016-05-09-a

wget https://swift.org/builds/development/xcode/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-osx.pkg 
sudo installer -pkg $SWIFT_SNAPSHOT-osx.pkg -target / 
export TOOLCHAINS=swift

xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "SwiftyJSON OSX" -toolchain=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin/ test | xcpretty
# xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "SwiftyJSON iOS" -destination  "platform=iOS Simulator,name=iPhone 6" test | xcpretty
# xcodebuild -workspace SwiftyJSON.xcworkspace -scheme "SwiftyJSON tvOS" -destination "platform=tvOS Simulator,name=Apple TV 1080p" test | xcpretty
