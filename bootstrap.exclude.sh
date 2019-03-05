mkdir -p ~/Projects

echo "Symlinking files..."

sh ./link-files.sh

echo "Installing tools..."

sh ./install-tools.sh

echo "Making macOS changes..."

sh ./macos.sh

source ~/.zshrc
