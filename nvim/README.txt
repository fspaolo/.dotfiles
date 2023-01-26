# Fresh Install with config files

1. delete pre-existing configuration:

    rm -rf ~/.local/share/nvim/

2. [re]make sym link to config:

    ln -s ~/dev/.dotfiles/nvim .config/nvim

3. open nvim, wait for install, quit, open, quit

4. only then add other plugins and settings
