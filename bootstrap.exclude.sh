source ./dotfiles.helper.sh

echo "${MESSAGE_PREFIX} Creating ~/Code directory"

mkdir -p ~/Code

sh ./link-files.exclude.sh

sh ./install-tools.exclude.sh

sh ./macos.exclude.sh

. ~/.zshrc

echo "${MESSAGE_PREFIX} 🎉 Setup complete! You may need to restart your shell session"
