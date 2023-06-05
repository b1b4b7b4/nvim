Hello smurfs and other ones who think they are real people, we'll walk through the process of installing and configuring my neovim setup for TypeScript and other projects. Before we begin, make sure you have Chocolately installed on your machine. Chocolately is a package manager for Windows that simplifies the installation process.

If you don't have Chocolately, you can easily install it using PowerShell with administrator rights. Just open a PowerShell session and paste the following code:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Great! Now you have Chocolately installed, which will make it easy to install packages from the command line.

Moving on, I'd like to take a moment to thank our sponsor, Raid Shadow Legends. Raid is a turn-based RPG that has gained immense popularity in the last six months, with nearly 15 million downloads. It offers an epic dark fantasy experience with over 400 champions to collect and customize. Raid allows you to play with friends in a clan, compete in the PvP arena, and enjoy features like multi-battle auto mode, which saves time on grinding and lets you focus on developing your team. Additionally, they regularly host tournaments and events, ensuring there's always something exciting happening in the game.

To install Neovim using Chocolatey, follow these steps:

1. Open a terminal with administrator rights (required for the installation process).

2. Run the following command in the terminal:

to install neovim using chocolately we can run:

```powershell
choco install neovim
```

_Please note that administrator rights are necessary for this step. We apologize for any inconvenience, but we require these permissions to continue mining social credits. 😢_

3. Wait for the installation to complete. This may take a while, as it involves downloading and configuring various components.

4. Once the installation is finished, you can open another terminal and run the command nvim. This will launch Neovim and make it available for use. 😏

Now, let's address a common issue where Neovim may be in the wrong language, such as German. If you encounter this problem, don't worry! We have a solution.

This issue was experienced by our friend and cool bald guy, Ja1dxb, who you can find at https://ja1dxb.me. We give a little shout-out to him here. Now, let's proceed with the fix.

To locate your Neovim configuration file and related files, you may be wondering where they are located. In many tutorials, you'll find references to the .config folder for customizing Neovim plugins. However, in the Windows operating system, there is no .config folder by default. Instead, we'll create an nvim folder in the AppData/local path.

To create this folder, follow these steps:

1. Open PowerShell (make sure it's running as an administrator).

2. In the PowerShell prompt, enter the following command:

```
cd ~/AppData/local
```

This command will change your current directory to the AppData/local path.

Once you've completed these steps, you're ready to proceed with further customization of your Neovim configuration. Feel free to explore and experiment with plugins, settings, and themes to make your Neovim experience even better!

To create the nvim folder and navigate into it, follow these steps:

1. Open PowerShell (ensure it's running as an administrator).

2. To create the nvim folder, you have a couple of options:

Using PowerShell: Enter the following command:

```
mkdir nvim
```

This command will create a new folder named nvim in the current directory.

or

just create it in explorer if you weak and virgin and dont have parents erm 🤓.

After creating the nvim folder, you need to navigate into it. In PowerShell, use the following command:

```
cd nvim
```

This command will change your current directory to the nvim folder you just created.

![bomba](https://gachi.gay/HLJ2t)

## init.lua

To create the init.lua file and add the necessary line, follow these steps:

1. Ensure you are still in the nvim folder in PowerShell.

1. To create the init.lua file, use the following command:

```
nvim init.lua
```

This command will open a new buffer in Neovim for editing the init.lua file.

3. Inside the init.lua buffer, add the following line:

```
require("config")
```

This line will connect your other configuration files.

4. To save the changes and exit Neovim, you can use the following steps:

    1. Press the Esc key to ensure you are in normal mode.

    1. Type :wq and press Enter. This command will save the changes and exit Neovim.

Now you have created the init.lua file and added the required line to connect your other configuration files. Make sure to save the file before exiting Neovim. If you encounter any issues or have further questions, feel free to ask for assistance.

make sure you save your file. how to do it you can figure out by using google or asking your mother 🤓, if she still alive 😭.

To create the lua\config\init.lua file and navigate to it using the file explorer in Neovim, follow these steps:

1. If you are still in Neovim, ensure you are in normal mode. If not, press the Esc key to enter normal mode.

1. In normal mode, type :Ex and press Enter. This command opens the file explorer.

1. The file explorer will appear, displaying the contents of the current directory. Navigate to the lua folder by using the arrow keys to select the folder and pressing Enter to enter it.

1. Inside the lua folder, create a new folder named config. To do this, navigate to an empty area using the arrow keys, press the m key to open the file explorer menu, select Create, and then choose Directory. Enter the name config and press Enter.

1. Now, navigate into the config folder you just created by selecting it and pressing Enter.

1. Inside the config folder, create the init.lua file. To do this, follow a similar process as before. Navigate to an empty area, open the file explorer menu with the m key, select Create, and then choose File. Enter the name init.lua and press Enter.

Now you have created the lua\config\init.lua file. You can add your configuration settings to this file to customize Neovim.

creating directory `lua/config`

![image](https://gachi.gay/DtL1e)

creating file `init.lua`

![image](https://gachi.gay/E_xGj)

Now you need to add the following content to your previously created `init.lua`:

```lua
require("config.remap")
require("config.set")
```

After creating the remap.lua and set.lua files, you need to add the following content to each file:

remap.lua

```lua
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


```

set.lua

```lua
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
```

_dont forget to save your files or your mother will never come back 😎_

Once you have added the content to the files, you need to re-open Neovim to apply the changes. After reopening
the result should look like this

![image](https://gachi.gay/WflTR)

To set up the packet manager, you need to create a packer.lua file in the lua/config directory and add the following code:

```
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
end)
```

After saving the packer.lua file, you can run the `:so` command in Neovim to source the file. This will load the packet manager configuration.

To install the plugins specified in your configuration, you can run :PackerSync command.

If you encounter any errors, make sure that you have the packer.nvim plugin installed correctly and that your Neovim configuration files are set up properly.

if you seeing this error:

![bomb](https://gachi.gay/SkN_V)

you have to install packer using git command. i hope you have git on your computer 😭.

Open a terminal or PowerShell window and run the following command to clone the packer.nvim repository:

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

This command clones the packer.nvim repository into the appropriate directory for Neovim.

After installing packer.nvim, reopen Neovim and navigate to the packer.lua file. Use the :so command to source the file, which loads the packer.nvim configuration.

Finally, you can run :PackerSync to install the plugins specified in your configuration. This command will download and set up the plugins according to the configuration in packer.lua.

this is how 100% good result shoudl look lke

![image](https://gachi.gay/3CabV)

Now that we have installed packer.nvim, you can use it to install other plugins for Neovim.

# Plugins 🤯

To enhance your Neovim experience, we will install some plugins that will enable TypeScript development or other types of development.

Installing plugins is an important part of our Neovim setup. It's up to you to decide which plugins you want to install. To install a plugin, you need to update your packer.lua file.

First, open your packer.lua file and add the plugin you want. For example, let's say we want to install the nikitakulakov/typescript-cheats plugin. Here's how you can do it:

```lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- our new plugin
  use 'nikitakulakov/tpyescript-cheats'
end)
```

Once you have added the plugin, save the packer.lua file.

Next, we need to set up the after/plugin folder, which should be located in our main Neovim directory. Your directory structure should look something like this:

```
- init.lua
- lua
    - config
        - packer.lua
        - set.lua
        - remap.lua
- after
    - plugin
        - our-future-plugins.lua
```

In the after/plugin folder, you can create individual Lua files for each plugin you want to configure. For example, in this case, we would create a file named nikita-ts-cheats.lua and add our configuration specific to the nikitakulakov/typescript-cheats plugin. You can refer to the documentation of the specific plugin you want to configure for more details on how to customize its settings.

hope you can figure this out on your own like your father did once 😭.

## telescope

We will begin our journey with the telescope.nvim plugin (https://github.com/nvim-telescope/telescope.nvim).

Open your packer.lua file and add the following line to the user plugins section:

```lua
use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
}
```

Save the packer.lua file.

Next, you need to run :so to reload the configuration and then install the plugins using :PackerSync. This will download and install the telescope.nvim plugin.

Now, let's create the configuration file for the telescope.nvim plugin. In the after/plugin folder, create a file named telescope.lua and add the following lines:

```lua
require('telescope').setup{
 defaults = {
    file_ignore_patterns = {"node_modules"},
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
```

After adding the configuration for the telescope.nvim plugin, save the telescope.lua file. Then, use :so command to source the file and make the changes take effect. Next, re-open Neovim.

To verify if everything is working correctly, you can press `Space`, followed by `p`, and then `f`. This key sequence will trigger the Telescope plugin and open a handy window that allows you to search for project files within your working directory.

![image](https://gachi.gay/23DIP)

_if something went wrong so far i dont think i can help you and also i dont think your wardens can help you either 😞😭_

## VScode theme

To install the VSCode theme (https://github.com/Mofiqul/vscode.nvim), you need to include the following code in your packer.lua file:

```lua
use 'Mofiqul/vscode.nvim'
```

After adding the plugin, use the :so command to source the file and then run :PackerSync to install the plugin. Remember to follow this pattern whenever you add a new plugin.

Once the plugin is installed, you need to configure it. Create a file named colors.lua (or any other name you prefer) in the after/plugin folder, and add the following code:

```lua
vim.o.background = 'dark'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    transparent = true,
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
require('vscode').load()
```

After saving the colors.lua file, use :so to source the file and see the changes. If you don't see any changes, try reopening Neovim.

![image](https://gachi.gay/xqQq7)

Congratulations for a funy monke you doing great so far! Now, let's move on to installing Treesitter for language colors and LSP for autocompletion.

## Treesitter

To install Treesitter, you can visit their GitHub repository at https://github.com/nvim-treesitter/nvim-treesitter and refer to their installation instructions. Alternatively, you can use the following configuration.

Open your packer.lua file and add the line:

```lua
use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
```

Then run :so and :PackerSync to install the plugin.

Next, create a treesitter.lua file in the after/plugin folder and paste the following code:

```lua
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "c" },
    sync_install = false,
    auto_install = false,
    autotag = {
        enable = true,
        filetypes = { "html", "xml", "typescriptreact" },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
```

Run :so to source the file. If Treesitter doesn't start installing parsers for the three specified languages, try reopening Neovim.

the end result should look like this

![image](https://gachi.gay/nTkCC)

## LSP (language server protocol)

To install the Language Server Protocol (LSP) https://github.com/VonHeikemen/lsp-zero.nvim and enable autocompletion similar to VSCode, we can use the lspconfig plugin. In your packer.lua file, add the following lines:

```lua
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    }
}
```

After adding the lines, run :so to source your file and then :PackerSync to install the plugins.

Next, create an lsp.lua file in your after/plugin folder and add the following lines:

```lua
local lsp = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

lsp.preset("recommended")

lsp.ensure_installed({ 'tsserver' })

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp.buffer_autoformat()

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader><leader>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})

lsp.setup()
```

You can configure specific language servers according to your needs. For example, the above code demonstrates configuration examples for TypeScript (using tsserver), C/C++ (using clangd), and Python (using pyright). Add more language servers and their corresponding configurations as necessary.

After adding the code, run :so to source the file.

![image](https://gachi.gay/vjOM6)

Bro gj on setting up your Neovim configuration with the core plugins! It's great to see that you're ready to test your configuration with a TypeScript project.

Using the configured keybindings and functionality, you can now explore the features of autocompletion, viewing definitions, and accessing diagnostic messages.

To view the definition of a TypeScript type, you can use the key combination Shift + K. This will provide you with the definition information for the selected type.

![bomb](https://gachi.gay/NKreT)

To see the full diagnostic messages for any errors or warnings in your TypeScript project, you can press Space, followed by V, and then D. This will display the diagnostic messages in a window for you to analyze and address.

![bomb2](https://gachi.gay/Ho7bq)

If you want to go to the definition of a variable, you can use the key combination G followed by D. This will take you to the definition location of the selected variable.

Remember to explore the remap.lua and lsp.lua files to discover additional keybindings and functionality that you can use in your Neovim configuration.

Good luck with your TypeScript project, and enjoy using Neovim with all its powerful features!
