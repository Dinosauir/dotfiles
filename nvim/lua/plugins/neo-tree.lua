-- File tree sidebar

return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    { '<leader>ee', ':Neotree reveal toggle<CR>', desc = 'Toggle' },
    { '<leader>eeb', ':Neotree buffers toggle<CR>', desc = 'Buffers' },
    { '<leader>eeg', ':Neotree git_status toggle<CR>', desc = 'Git Status' },
    { '<leader>een', ':Neotree focus<CR>', desc = 'Focus Neo-tree', noremap = true, silent = true },
    { '<leader>eb', '<C-w>p', desc = 'Focus buffer' }, -- Focus buffer
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      opts = {
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          bo = {
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
            buftype = { 'terminal', "quickfix" },
          },
        },
        highlights = {
          statusline = {
            focused = {
              bg = '#9d7cd8',
            },
            unfocused = {
              bg = '#9d7cd8',
            },
          },
        },
      },
    },
  },
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    source_selector = {
      winbar = true,
      statusline = false,
      separator = { left = "", right= "" },
      show_separator_on_edge = true,
      highlight_tab = "SidebarTabInactive",
      highlight_tab_active = "SidebarTabActive",
      highlight_background = "StatusLine",
      highlight_separator = "SidebarTabInactiveSeparator",
      highlight_separator_active = "SidebarTabActiveSeparator",
    },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      name = {
        use_git_status_colors = false,
        highlight_opened_files = true,
      },
    },
    window = {
      position = "right",
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
      },
      -- follow_current_file = {
      --   enabled = true,
      -- },
      group_empty_dirs = false
    },
  },
  config = function()
      require('neo-tree').setup({
        follow_current_file = {
            enabled = false,
        },
        filesystem = {
            bind_to_cwd = false,
        },
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        -- other configurations can be added here
      })
    end
}