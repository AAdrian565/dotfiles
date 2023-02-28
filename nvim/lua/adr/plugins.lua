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

-- require('lazy').setup({})
require('lazy').setup({
    "tpope/vim-fugitive",
    -- Color theme
    "navarasu/onedark.nvim",
    "nvim-lualine/lualine.nvim",
    -- "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",

    "lambdalisue/suda.vim",
    "nvim-lua/completion-nvim",
    "kylechui/nvim-surround",

    --runner
    "CRAG666/code_runner.nvim",
    "nvim-lua/plenary.nvim",

    --tree
    "preservim/nerdtree",
    "ThePrimeagen/harpoon",

    -- Auto comment
    "terrortylor/nvim-comment",
    "mhartington/formatter.nvim",

    -- Tree sitter
    { "nvim-treesitter/nvim-treesitter", build = "TSUpdate" },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- Undo Tree
    "mbbill/undotree",
    -- LANGUAGE SPECIFIC
    -- WEB DEV
    "windwp/nvim-ts-autotag",
    "mattn/emmet-vim",
    "manzeloth/live-server",
    -- GO LANGUAGE
    "fatih/vim-go",
    "rstacruz/vim-closer",
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.1",
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' } -- Optional
        }
    },
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup()
        end
    }
})
