local status, ts = pcall(require, 'nvim-treesitter.configs')
if(not status) then return end

ts.setup{

  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "c",
    "cpp",
    "c_sharp",
    "java",
    "html",
    "tsx",
    "typescript",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "vim"
  },
  autotag = {
    enable = true,
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

