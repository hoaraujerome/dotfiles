return {
  -- change formatting config
  {
    "stevearc/conform.nvim",
    -- opts will be merged with the parent spec
    opts = {
      formatters_by_ft = {
        yaml = { "yamlfmt" },
      },
      formatters = {
        shfmt = {
          -- use 2 spaces instead of tabs
          prepend_args = { "-i", "2" },
        },
      },
    },
  },
}
