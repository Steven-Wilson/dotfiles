--
-- Bootstrap Pckr
--

local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
end
vim.opt.rtp:prepend(pckr_path)

--
-- Plugins
--

require('pckr').add{
	'vimwiki/vimwiki';
	'romgrk/doom-one.vim';
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'junegunn/fzf';
	'junegunn/fzf.vim';
    "folke/zen-mode.nvim";
    { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    };
}

local async = require('plenary.async')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "__pycache__" }
    }
}

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

--
-- Settings
--

vim.opt.backspace = "indent,eol,start"
vim.opt.wildmode = "list:longest"
vim.opt.wildmenu = true
vim.opt.wildignore = "*.so,*.app,*.lib,"

-- Search
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Don't bell at me bro
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Command history
vim.opt.history = 100

-- Format options
vim.cmd [[colorscheme doom-one]]
vim.opt.ff = "unix"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.formatoptions = "l"
vim.opt.lbr = true
vim.opt.scrolloff = 8
vim.opt.showbreak = "|"
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 10
vim.opt.textwidth = 0
vim.opt.wrap = false
vim.opt.wrapmargin = 0

-- Indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.opt.autoread = true

-- Command timeouts
vim.opt.timeout = false
vim.opt.ttimeout = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prevent losing unsaved changes on hidden files
vim.opt.hidden = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.showcmd = true
vim.opt.showmode = true

vim.opt.ruler = true
vim.opt.title = true

vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:~"
vim.opt.nf = "octal,hex,alpha"

--
-- Keymaps
--

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader><space>", "<cmd>nohl<CR>")

-- Work on config
vim.keymap.set("n", "<Leader>r", "<cmd>source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Leader>c", "<cmd>edit ~/.config/nvim/init.lua<CR>")

-- Save/Close/Select buffers
vim.keymap.set("n", "<Leader>s", "<cmd>w<CR>")
vim.keymap.set("n", "<Leader>a", "ggVG")
vim.keymap.set("n", "<Leader>d", "<cmd>bp|bd #<CR>")
vim.keymap.set("n", "<Leader>o", "<cmd>on<CR>")
vim.keymap.set("n", "<Leader>q", "ZZ<CR>")

-- Navigate Through buffers
vim.keymap.set("n", "<Leader>[", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>]", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Leader>t", "<cmd>enew<CR>")

-- Work with Splits
vim.keymap.set("n", "<Leader>-", "<cmd>sp<CR>")
vim.keymap.set("n", "<Leader>|", "<cmd>vs<CR>")
vim.keymap.set("n", "<A-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<A-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>wincmd l<CR>")

-- Fuzzy Find
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
