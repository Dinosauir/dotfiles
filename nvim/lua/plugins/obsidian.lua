return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    cmd = { "ObsidianSearch", "ObsidianOpen" },
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/JSObsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/JSObsidian/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "preservim/vim-markdown",
    },
    opts = {
        dir = "~/JSObsidian",
        completion = {
            nvim_cmp = true,
        },
        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            }
        }
    },
}
