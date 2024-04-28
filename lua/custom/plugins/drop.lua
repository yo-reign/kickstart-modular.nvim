return {
  'folke/drop.nvim',
  opts = {
    -- currently, the following themes are available: "leaves", "snow", "stars", "xmas", "spring", "summer"
    theme = 'leaves', -- can be one of rhe default themes, or a custom theme
    max = 45, -- maximum number of drops on the screen
    interval = 150, -- every 150ms we update the drops
    screensaver = 1000 * 60 * 5, -- show after 1 minutes. Set to false, to disable
    filetypes = { 'dashboard', 'alpha', 'starter' }, -- will enable/disable automatically for the following filetypes
  },
}
