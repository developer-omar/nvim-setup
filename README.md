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

9. Install lazygit

   ```bash
   sudo apt install lazygit
   ```

10. Install chafa (optional)

    ```bash
    sudo apt install chafa
    ```

## Installing new LSP servers and other tools (formatters, linters, etc)

1. You need to add lsp servers to `lspconfig-mason.lua` file in `lspServers` variable, and if you want to install
   other tools adding in `otherTools` variable in the same file (You can see the options for each lsp
   file in the [documentation page](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md) ).

2. Restart Neovim.
