echo "📲 Running Xcode at /Applications/Xcode.app/Contents/Developer..."
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer &&  sudo xcodebuild -runFirstLaunch
echo "✅ Successful runned Xcode at /Applications/Xcode.app/Contents/Developer"
echo "📲 Installing Cocoapods..."
sudo gem install cocoapods
echo "✅ Successful installed Cocoapods"