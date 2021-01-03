#!/bin/zsh

###########################
# Fork from https://github.com/helderburato/dotfiles/blob/main/install.sh
# This script installs the dotfiles and runs macOS configurations
# @author Helder Burato Berto
###########################

CONFIG_DIR=$(dirname "$0")

echo "🔧 Setting up your Mac..."

sudo chsh -s $(which zsh)

# Set macOS preferences
sh $CONFIG_DIR/osx/.default_config

# Install non-brew various tools (PRE-BREW Installs)
echo "Ensuring build/install tools are available"
if ! xcode-select --print-path &> /dev/null; then
    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? ' XCode Command Line Tools Installed'

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "📲 Installing Homebrew packages..."
sh $CONFIG_DIR/osx/tasks/brew.sh
echo "✅ Successful installed packages"

echo "📲 Installing apps from App Store..."
sh $CONFIG_DIR/osx/tasks/mas.sh
echo "✅ Successful installed apps"

echo "🔗 Creating and configuring NVM"
sh $CONFIG_DIR/osx/tasks/nvm.sh
echo "✅ Successful configured NVM"

echo "📁 Creating workspace directory..."
sh $CONFIG_DIR/osx/tasks/create_workspace.sh
echo "✅ Successful created workspace"

echo "🔗 Linking configuration files..."
sh $CONFIG_DIR/osx/tasks/symlink.sh
echo "✅ Successful linked configuration files"

echo "🔗 Setting Neovim..."
sh $CONFIG_DIR/osx/tasks/nvim.sh
echo "✅ Successful setting Neovim"

echo "📲 Running Xcode commands..."
sh $CONFIG_DIR/osx/tasks/xcode.sh
echo "✅ Successful runned Xcode commands"

# Add default apps to Dock
echo "🖥 Setting apps to Mac dock..."
sh $CONFIG_DIR/osx/tasks/dock.sh
echo "✅ Successful set apps to Mac dock"

echo "📲 Installing Oh My Zsh..."
sh $CONFIG_DIR/osx/tasks/ohmyzsh.sh
echo "✅ Successful installed Oh My Zsh"

echo "⚡️ All right! Now execute this command `source ~/.zshrc` and Restart your machine to complete the configuration."
