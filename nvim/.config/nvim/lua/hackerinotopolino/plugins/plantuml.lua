return {
  'yriveiro/plantuml.nvim',
  dependencies = {
    '3rd/image.nvim',
  },
  config = function()
    require('plantuml').setup({
      -- Optional configuration
    })
  end,
}
