local status, bufferline = pcall(require, 'bufferline')
if(not status) then return end

bufferline.setup({
  options = {
    mode = 'tabs',
    diagnostics =  "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
        or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
    return s
    end,
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
  },
  highlights = {
    separator = {
--      fg = '#073642',
--      bg = '#002b36',
      fg = '#252636',
      bg = '#111626'
    },
    separator_selected = {
--      fg = '#073642',
      fg = '#252636'
    },
    background = {
      fg = '#556b83',
--      bg = '#002b36'
      bg = '#111626'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
--      bg = '#073642'
      bg = '#252636'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
