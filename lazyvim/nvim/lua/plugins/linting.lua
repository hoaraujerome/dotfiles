-- https://github.com/LazyVim/LazyVim/discussions/4094
local HOME = os.getenv("HOME")
return {
  -- change linting config
  "mfussenegger/nvim-lint",
  optional = true,
  -- opts will be merged with the parent spec
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
    linters_by_ft = {
      hcl = { "terraform_validate" },
    },
  },
}
