setupLinks () {
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.DS_Store' ) ; do
        ln -sv "$PWD/$file" "$HOME"
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setupLinks;
else
    echo "About to symlink the following files to the home directory:"

    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.DS_Store' ) ; do
        # ln -sv "$PWD/$file" "$HOME"
        echo $file
    done

    read -p "Continue with links? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setupLinks;
    else
        echo "Cancelling symlinks"
    fi;
fi;
unset setupLinks;

