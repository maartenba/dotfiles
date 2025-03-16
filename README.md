# Maarten Balliauw's dotfiles

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually.

## Fresh setup

1. Update macOS to the latest version through system preferences
2. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:maartenba/dotfiles.git ~/.dotfiles
    ```

   Alternatively just download the archive (and unzip it)

    ```zsh
    curl https://github.com/maartenba/dotfiles/archive/refs/heads/main.zip && unzip main.zip -d ~/.dotfiles/ && rm -rf main.zip
    ```

4. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```

5. Restart your computer to finalize the process