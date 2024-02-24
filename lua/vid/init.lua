require("vid.remap")
require("vid.set")

-- Lazy Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        priority = 999,
        config = function()
            vim.cmd('colorscheme kanagawa-dragon')
        end
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    
    "mbbill/undotree",

    "tpope/vim-fugitive",
    
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",

    "andweeb/presence.nvim",
    "norcalli/nvim-colorizer.lua",
    "m4xshen/autoclose.nvim",
    "github/copilot.vim",

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    },

    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            "stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true
    },

    {
        "akinsho/toggleterm.nvim", version = "*", opts = {

        }
    },

    {
        "aurum77/live-server.nvim",
        run = function()
            require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    },
})

-- Load Plugins
require("autoclose").setup()
require("colorizer").setup()
require("toggleterm").setup()
