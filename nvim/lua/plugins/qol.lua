return {
    {
        "LunarVim/bigfile.nvim"
    },
    {
        "chrishrb/gx.nvim",
        event = { "BufEnter" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true
    },

    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },

    {
        "tommcdo/vim-lion",
        config = function()
            vim.g.lion_squeeze_spaces = 1
        end,
    },

    {
        "Wansmer/treesj",
        keys = { { "gS", "<cmd>TSJToggle<cr>", desc = "Join Toggle" } },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    {
        "whatyouhide/vim-textobj-xmlattr",
        lazy = false,
        dependencies = { "kana/vim-textobj-user" }
    },

    { "mbbill/undotree" },

    {
        "christoomey/vim-tmux-navigator",
        event = "VimEnter",
    },                       -- supposed to let you navigate tmux panes same as in nvim

    { "sickill/vim-pasta" }, -- smart formatting on paste

    {
        "airblade/vim-rooter",
    },

    {
        "glts/vim-textobj-comment",
        dependencies = { "kana/vim-textobj-user" }
    },

}
