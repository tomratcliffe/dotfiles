setupLinks () {
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.DS_Store' ) ; do
        ln -sv "$PWD/$file" "$HOME"
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setupLinks;
else
    echo "${MESSAGE_PREFIX} About to symlink the following files to the home directory:\n"

    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.DS_Store' ) ; do
        echo "\t$file"
    done

    echo "\n${MESSAGE_PREFIX} Setup symlinks to home directory?";
    read -p "(y/n): " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setupLinks;
    else
        echo "${MESSAGE_PREFIX_WARNING} Skipping symlinks"
    fi;
fi;
unset setupLinks;
