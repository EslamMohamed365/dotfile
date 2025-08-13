return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      python = { "ruff", "pylint","dmypy" ,"mypy"},
      rust = { "clippy" },
      go = { "golangcilint" },
      sql = { "sqlfluff","sqruff"},
      bash={"bash"}
    },
  },
}
