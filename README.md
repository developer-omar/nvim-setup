# My Nvim Configuration

This configuration works with Php (Laravel, Symfony) and Javascript/Typescript (Vue, Angular, React).

## Requirements

1. Install NodeJS and NPM, [I recommend use node version manager (nvm)](https://github.com/nvm-sh/nvm)

2. Install luarocks for compile some plugins

   ```bash
   sudo apt install luarocks
   ```

3. Install ripgrep

   ```bash
   sudo apt install ripgrep
   ```

4. Install fd-find

   ```bash
   sudo apt install fd-find
   ```

5. Install fzf

   ```bash
   sudo apt install fzf
   ```

6. Install Zoxide

   ```bash
   sudo apt install zoxide
   ```

7. Install python3-pip

   ```bash
   sudo apt install python3-pip
   ```

8. Install python3-venv

   ```bash
   sudo apt install python3-venv
   ```

9. Install chafa (optional)

   ```bash
   sudo apt install chafa
   ```

## Installing new LSP configs

1. You need to download LSP config files from [this page](https://github.com/neovim/nvim-lspconfig/tree/master/lsp)
   into `lsp` folder (You can see the options for each lsp file in the [documentation page](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md) ).

2. Once you have downloaded the LSP config files, you need to enable the language servers in Neovim
   by adding the file names to the `lspServers` variable in `code/lsp.lua`.

3. Finally you must install the LSP servers with Mason by adding the LSP server names to the `lspServers`
   variable in `lua/plugins/mason.lua`, this will make an automatic installation.

4. Restart Neovim.

## Installing new Formatters

1. You need to use Mason for automatic installation of formatters by adding formatter names
   to the `formatters` variable in `lua/plugins/mason.lua`.

2. Restart Neovim.
