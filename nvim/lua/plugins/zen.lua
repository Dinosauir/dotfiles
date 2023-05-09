return {
    "folke/zen-mode.nvim",
    dependencies = "folke/twilight.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("twilight").setup {
                context = 10,
                treesitter = true,
            }
            require("zen-mode").setup {
                window = {
                    backdrop = 1,
                    height = 0.9,
                    width = 140,
                    options = {
                        number = false,
                        relativenumber = false,
                        signcolumn = "no",
                        colorcolumn = "",
                        list = false,
                        cursorline = false,
                    }
                },
                plugins = {
                    twilight = { enabled = true },
                    tmux = { enabled = true },
                    alacritty = {
                        enabled = true,
                        font = "20"
                    }
                }
            }
            require("zen-mode").toggle()
        end)
    end
}
