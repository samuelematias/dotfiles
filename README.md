# ⚙️ Samuel's Dotfiles

My base settings for when I start in a new environment.

## Requirements

Set zsh as your default shell:

```bash
sudo chsh -s $(which zsh)
```

## Setting up your Mac

- Update macOS to the latest version with the App Store;
- Install Xcode from the App Store, open it and accept the license agreement;

## Install

- Clone onto your machine:

```bash
git clone git://github.com/samuelematias/dotfiles.git ~/.dotfiles
```

- Install the dotfiles:

```bash
sh ~/.dotfiles/install.sh
```
## Oh My Zsh

At the end (after you have run the entire script), if you wanna install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), follow this steps below:

- Delete de zsh folder:
```bash
 rm -r /usr/local/share/zsh
```

- Clone Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- If you use [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh) theme (I use!), execute this:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

- Remove the `.zshrc` backup file created by clone the [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh):

```bash
rm ~/.zshrc.pre-oh-my-zsh
```

- Remove the default `.zshrc` created by clone the [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh):

```bash
rm ~/.zshrc
```

- Get you `.zshrc` from zsh folder:

```bash
sh ~/.dotfiles/osx/tasks/zsh_symlink.sh
```

- Refresh you `.zshrc`:

```bash
source ~/.zshrc
```

## Doom Emacs

With [Emacs](https://www.gnu.org/software/emacs/) installed, we cannot forget install the [Doom Emacs](https://github.com/hlissner/doom-emacs) interface, as it gives a nice upgrade to [Emacs](https://www.gnu.org/software/emacs/)! 
<br>
To install [Doom Emacs](https://github.com/hlissner/doom-emacs), just follow the [Installation instructions](https://github.com/hlissner/doom-emacs#install).
## fzf

To enable the FZF in command line you need to follow [this guide](https://github.com/junegunn/fzf#installation).

_Note: It's already added to the .bashrc just need to install the package_

After that, restart your computer and enjoy your new configuration.! ✌🏻

## Generate the SSH Keys

It's required to generate in every machine you start.

- Go to your $HOME with `cd ~`;
- Generate the new key `ssh-keygen`;

## Troubleshoot

### Homebrew
If you get any permissions problems when trying to run `brew` scripts, try to give the following permissions to your current user:
```bash
$ sudo chown -R $(whoami):admin /usr/local && sudo chmod -R g+rwx /usr/local
```

## Inspiration

- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles);
- [Cătălin Mariș dotfiles](https://github.com/alrra/dotfiles);
- [Paul's dotfiles](https://github.com/paulirish/dotfiles);
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles);
- [Dries's Dotfiles](https://github.com/driesvints/dotfiles);
- [Helder's Dotfiles](https://github.com/helderburato/dotfiles);

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
