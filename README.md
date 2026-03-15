# My Nvim Configuration

This configuration works with Php (Laravel, Symfony), Javascript/Typescript (Vue, Angular, React)
and Flutter/dart.

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

11. Install [Flutter](https://docs.flutter.dev/install/manual) for lsp autocomplete in dart files

## Installing new LSP servers and other tools (formatters, linters, etc)

1. You need to add lsp servers to `lspconfig-mason.lua` file in `lspServers` variable, and if you want to install
   other tools adding in `otherTools` variable in the same file (You can see the options for each lsp
   file in the [documentation page](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md) ).

2. Restart Neovim.

## Important

This configuration uses Copilot and Avante for AI, but you can use other plugins
in [this page (ColinKennedy/neovim-ai-plugins)](https://github.com/ColinKennedy/neovim-ai-plugins)
