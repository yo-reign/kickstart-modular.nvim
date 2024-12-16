return {
  'https://github.com/fresh2dev/zellij.vim.git',
  lazy = false,
  --event = 'VeryLazy',
  -- keys = {
  --   { '<M-h>', '<cmd>ZellijNavigateLeft<cr>', { silent = true, desc = 'navigate left' } },
  --   { '<M-j>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'navigate down' } },
  --   { '<M-k>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'navigate up' } },
  --   { '<M-l>', '<cmd>ZellijNavigateRight<cr>', { silent = true, desc = 'navigate right' } },
  -- },
  opts = {},
  config = function()
    --  require('zellij').setup {}

    vim.api.nvim_set_keymap('n', '<M-h>', ':ZellijNavigateLeft!<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<M-j>', ':ZellijNavigateDown<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<M-k>', ':ZellijNavigateUp<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<M-l>', ':ZellijNavigateRight!<CR>', { noremap = true, silent = true })
  end,
}
