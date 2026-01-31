return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = { "zbirenbaum/copilot.lua" },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      keymap = {
        preset = "super-tab",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },
}
