vim.loader.enable()

require('options')
require('base')
require('maps')
if not vim.g.vscode then
  require('highlights')
  require('lazy_nvim')
end


local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end
if is_linux then
    require('windows')
end
