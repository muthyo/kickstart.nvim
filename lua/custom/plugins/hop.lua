return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    -- Ensure hop.nvim is initialized
    require('hop').setup {
      keys = 'etovxqpdygfblzhckisuran',
    }

    -- Function to set custom highlights
    local function set_hop_highlights()
      vim.api.nvim_set_hl(0, 'HopNextKey', { fg = '#ff9900', bold = true, ctermfg = 198, cterm = { bold = true } })
      vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = '#ff9900', bold = true, ctermfg = 198, cterm = { bold = true } })
      vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = '#ff9900', bold = true, ctermfg = 198, cterm = { bold = true } })
    end

    -- Set highlights now (in case colorscheme is already loaded)
    set_hop_highlights()

    -- Ensure highlights persist when changing colorscheme
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = set_hop_highlights,
    })

    -- Remap 'f' to HopWordMW
    vim.keymap.set('n', 'f', function()
      require('hop').hint_words { multi_windows = true }
    end, { noremap = true, silent = true, desc = 'Hop to word (multi-window)' })
  end,
}
