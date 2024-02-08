# Worthant's AstroNvim configuration

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone this repo

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone git@github.com:worthant/neovim.git ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

## TODOs:

- [ ] fix `Themery` plugin for changing themes
- [ ] add configuration for null_ls and prettier formatters
- [x] add lsp servers for js, ts, html, css, twcss
- [x] add config for clangd lsp server (need for `cpp`)