echo "⚖️ Cloning Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "✅ Successful cloned Oh My Zsh"
echo "⚖️ Cloning powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "✅ Successful cloned powerlevel10k"
echo "⚖️ Running source .zshrc..."
source ~/.zshrc
echo "✅ Successful Runned source .zshrc"