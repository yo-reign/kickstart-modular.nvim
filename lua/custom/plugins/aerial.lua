return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      layout = {
        min_width = 30,
        max_width = 120,
        min_height = 10,
        max_height = 30,
      },
      filter_kind = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Module',
        'Method',
        'Struct',
      },
      keymaps = {
        ['?'] = 'actions.show_help',
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.jump', -- FIXME: I want it to also close out aswell
        ['<2-LeftMouse>'] = 'actions.jump',
        ['<C-v>'] = 'actions.jump_vsplit',
        ['<C-s>'] = 'actions.jump_split',
        ['p'] = 'actions.scroll',
        ['<C-j>'] = 'actions.down_and_scroll',
        ['<C-k>'] = 'actions.up_and_scroll',
        ['{'] = 'actions.prev',
        ['}'] = 'actions.next',
        ['[['] = 'actions.prev_up',
        [']]'] = 'actions.next_up',
        ['q'] = 'actions.close',
        ['o'] = 'actions.tree_toggle',
        ['za'] = 'actions.tree_toggle',
        ['O'] = 'actions.tree_toggle_recursive',
        ['zA'] = 'actions.tree_toggle_recursive',
        ['l'] = 'actions.tree_open',
        ['zo'] = 'actions.tree_open',
        ['L'] = 'actions.tree_open_recursive',
        ['zO'] = 'actions.tree_open_recursive',
        ['h'] = 'actions.tree_close',
        ['zc'] = 'actions.tree_close',
        ['H'] = 'actions.tree_close_recursive',
        ['zC'] = 'actions.tree_close_recursive',
        ['zr'] = 'actions.tree_increase_fold_level',
        ['zR'] = 'actions.tree_open_all',
        ['zm'] = 'actions.tree_decrease_fold_level',
        ['zM'] = 'actions.tree_close_all',
        ['zx'] = 'actions.tree_sync_folds',
        ['zX'] = 'actions.tree_sync_folds',
      },
      autojump = true,

      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    }
    -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set('n', '<leader>\\', '<cmd>AerialToggle<CR>')
  end,
}
