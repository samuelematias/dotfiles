echo "🐍 pip Python 3..."
python3 -m pip install --upgrade pynvim
echo "✅ Successful pip Python 3"
echo "📲 Installing Neovim Plugins..."
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa" -V
echo "\n✅ Successful installed Neovim Plugins"
echo "📲 Set Neovim as main editor ..."
export EDITOR='nvim'
echo $EDITOR
echo "\n✅ Successful set Neovim as main editor"
