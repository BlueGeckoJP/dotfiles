return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.keymap.set("i", "<Tab>", function()
        if vim.fn["coc#pum#visible"]() ~= 0 then
          return vim.fn["coc#pum#confirm"]()
        else
          return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
        end
      end, { expr = true, silent = true, replace_keycodes = false })
      vim.keymap.set("n", "<leader>f", function()
        vim.fn.CocAction("format")
        print("Format complete!")
      end, { silent = true, desc = "Format and notify" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "typescript", "tsx", "javascript", "lua", "html", "css", "c", "cpp" },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  { "windwp/nvim-ts-autotag", opts = {} },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").load("wave")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Next Change" })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous Change" })

          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Hunk" })
        end
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "kanagawa",
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end
  },
}
