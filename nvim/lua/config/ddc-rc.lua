local fn = vim.fn

local patch_global = fn["ddc#custom#patch_global"]

patch_global('ui', 'native')

patch_global("sources", {
        "vsnip",
        "lsp",
        "file",
        "around",
      })

patch_global("sourceOptions", {
    _ = {
      matchers = { "matcher_head", "matcher_length" },
      sorters = { "sorter_rank" },
      converters = { "converter_remove_overlap" },
      ignoreCase = true,
    },
    around = { mark = "[A]" },
    ["lsp"] = {
      mark = "[LSP]",
      forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
    },
    vsnip = { dup = "keep" },
    file = {
      mark = "[F]",
      isVolatile = true,
      forceCompletionPattern = [[\S/\S*]],
    },
    skkeleton = {
      mark = "[SKK]",
      matchers = { "skkeleton" },
      sorters = {},
      isVolatile = true,
      minAutoCompleteLength = 2,
    },
})


fn["ddc#enable"]()

-- matsui54/denops-popup-preview.vim
vim.g.popup_preview_config = {
    border = false,
    supportVsnip = true,
    supportUltisnips = false,
    supportInfo = true,
    delay = 60,
}

fn['popup_preview#enable']()

-- matsui54/denops-signature_help

vim.g.signature_help_config = {
    contentsStyle = 'currentLabel',
    viewStyle = 'virtual',
}
fn["signature_help#enable"]()




