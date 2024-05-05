-- defining a seperate formatter for autopep8 of python => conform
require("conform").formatters.autopep8 = {
  -- E402 表示允许在 import 之前写一些 statements
  prepend_args = { "--max-line-length", "158", "--ignore", "E402" },
}
