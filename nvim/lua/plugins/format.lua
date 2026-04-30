return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      formatters = {
        clang_format = {
          args = {
            "--style={BasedOnStyle: LLVM, BreakBeforeBraces: Custom, BraceWrapping: { AfterFunction: true, AfterControlStatement: false }, IndentWidth: 4, ColumnLimit: 0 }",
          },
        },
      },
    },
  },
}
