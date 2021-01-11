#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Brew Tap (Third-Party Repositories)
brew tap homebrew/bundle
brew tap homebrew/core
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Install font
brew install --cask font-fira-code

# Install useful packages/binaries
brew install exa
brew install fd
brew install fzf
brew install ripgrep
brew install gnu-sed
brew install gpatch
brew install mas
brew install pandoc
brew install the_silver_searcher
brew install stow
brew install tldr
brew install tmux
brew install tree
brew install neovim
brew install yarn
brew install z
brew install bitwarden-cli
brew install python
brew install scrcpy
brew install tmuxinator

# Install cask packages
brew install --cask alacritty
brew install --cask figma
brew install --cask imageoptim
brew install --cask slack
brew install --cask spotify
brew install --cask bitwarden
brew install --cask 1password
brew install --cask telegram
brew install --cask alfred
brew install --cask kap
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask vivaldi
brew install --cask oracle-jdk
brew install --cask android-studio
brew install --cask flutter
brew install --cask sizeup
brew install --cask notion
brew install --cask cleanmymac
brew install --cask screenfocus
brew install --cask itsycal
brew install --cask spotmenu
brew install --cask discord
brew install --cask folx

# Remove outdated versions from the cellar.
brew cleanup
