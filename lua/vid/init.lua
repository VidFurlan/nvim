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
    -------------------------------------------------------------
    -- Style ----------------------------------------------------
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {style = "storm"},
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { 
                    disabled_filetypes = {"NvimTree", "packer"},
                },
            })
        end
    },

    -------------------------------------------------------------
    -- IDE ------------------------------------------------------
    { 
        "danymat/neogen", 
        config = true,
    },


    -------------------------------------------------------------
    -- Navigation -----------------------------------------------
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "stevearc/resession.nvim"
        },
        config = true
    },


    -------------------------------------------------------------
    -- Complition -----------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate"
    },
    
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-lint",
    "mhartington/formatter.nvim",
    "VonHeikemen/lsp-zero.nvim",
    "github/copilot.vim",


    -------------------------------------------------------------
    -- Writing --------------------------------------------------
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_compiler_method = "latexrun"
        end
    
    },
    
    "savq/paq-nvim",
    "frabjous/knap",

    -------------------------------------------------------------
    -- Other ----------------------------------------------------

    "tpope/vim-fugitive",
    "mbbill/undotree",
    "andweeb/presence.nvim",
    "m4xshen/autoclose.nvim",
    "norcalli/nvim-colorizer.lua",
    --"stevearc/vim-arduino",             -- Arduino IDE
})

-- Load Plugins
require("autoclose").setup()
require("colorizer").setup()
require("tokyonight").setup()
