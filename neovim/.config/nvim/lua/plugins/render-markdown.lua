-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ render-markdown ┃
-- ┗━━━━━━━━━━━━━━━━━┛

local M = {}

M[1] = 'MeanderingProgrammer/render-markdown.nvim'

M.opts = {
  anti_conceal = {
    enabled = false,
  },
  file_types = {
    'markdown',
  },
}

M.ft = {
  'markdown',
}

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader>tm', '<Cmd>RenderMarkdown buf_toggle<CR>' },
    { 'n', '<Leader>tM', '<Cmd>RenderMarkdown toggle<CR>' }
  )
end

return M
