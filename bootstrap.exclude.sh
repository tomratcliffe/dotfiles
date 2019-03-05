mkdir -p ~/Projects

echo "Symlinking files..."

sh ./link-files.exclude.sh

echo "Installing tools..."

sh ./install-tools.exclude.sh

echo "Making macOS changes..."

sh ./macos.exclude.sh

source ~/.zshrc
