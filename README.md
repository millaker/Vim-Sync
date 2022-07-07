# Vim Sync

This repo is for syncing my own Vim setup between different devices.

## Steps:

1. Remove the ~/.vim directory and .vimrc
2. Clone this repo to ~/.vim
3. Make a symlink to .vimrc under ~/.vim
4. Open Vim and enter command "PlugInstall"

## Color Themes available:

1. Papercolor-light
    colorscheme papercolor
    set background=light
2. codedark
    colorscheme codedark
    set t_ut=
    If current tab color is difficult to see, change TabLinSel to s:cdGray will solve the problem

## Coc Install guide
1. Install nodejs 
2. Run `sudo apt-get intsall npm`
3. Run `sudo npm i -g yarn`
4. Navigate to coc.nvim plugin folder
5. Run `yarn install --ignore-engines`
6. Open vim and run `:CocInstall coc-clangd`
7. Run `:CocCommand clangd.install`
8. Add additional settings to vimrc(tab completion, reaction time)
Useful server for coc: coc-clangd coc-rust-analyzer coc-pairs
**Vim must be at least v8.2**
