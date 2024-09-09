-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- For spell checking
vim.opt.spelllang = 'en_us'
vim.opt.spell = false -- There is a keybinding to toggle this in keymappings.lua

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--  I have <leader>y mapped to copty to clipboard
--vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- For obsidian plugin
vim.opt.conceallevel = 1

-- Enable true color support
vim.opt.termguicolors = true

-- Set tab defaults
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces a tab counts for while performing editing operations, like inserting a tab or using <BS>
vim.opt.expandtab = true -- Converts tabs to spaces

-- Set gruvbox colors for markdown preview
vim.cmd [[
  highlight RenderMarkdownH1 guifg=#fb4934 gui=bold
  highlight RenderMarkdownH2 guifg=#fabd2f gui=bold
  highlight RenderMarkdownH3 guifg=#8ec07c gui=bold
  highlight RenderMarkdownH4 guifg=#d3869b gui=bold
  highlight RenderMarkdownH5 guifg=#b8bb26 gui=bold
  highlight RenderMarkdownH6 guifg=#83a598 gui=bold
  highlight RenderMarkdownH1Bg guibg=#3c3836
  highlight RenderMarkdownH2Bg guibg=#3c3836
  highlight RenderMarkdownH3Bg guibg=#3c3836
  highlight RenderMarkdownH4Bg guibg=#3c3836
  highlight RenderMarkdownH5Bg guibg=#3c3836
  highlight RenderMarkdownH6Bg guibg=#3c3836
  highlight RenderMarkdownCode guifg=#ebdbb2 guibg=#3c3836 gui=italic
  highlight RenderMarkdownCodeInline guifg=#ebdbb2 guibg=#3c3836 gui=italic
  highlight RenderMarkdownBullet guifg=#83a598
  highlight RenderMarkdownQuote guifg=#83a598 gui=italic
  highlight RenderMarkdownDash guifg=#928374
  highlight RenderMarkdownLink guifg=#b8bb26 gui=underline
  highlight RenderMarkdownSign guifg=#ebdbb2 guibg=#3c3836
  highlight RenderMarkdownMath guifg=#fe8019
  highlight RenderMarkdownUnchecked guifg=#fb4934
  highlight RenderMarkdownChecked guifg=#b8bb26
  highlight RenderMarkdownTodo guifg=#fabd2f
  highlight RenderMarkdownTableHead guifg=#ebdbb2 gui=bold
  highlight RenderMarkdownTableRow guifg=#ebdbb2
  highlight RenderMarkdownTableFill guifg=#ebdbb2
  highlight RenderMarkdownSuccess guifg=#b8bb26
  highlight RenderMarkdownInfo guifg=#83a598
  highlight RenderMarkdownHint guifg=#fe8019
  highlight RenderMarkdownWarn guifg=#fabd2f
  highlight RenderMarkdownError guifg=#fb4934
]]
