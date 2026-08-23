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

return M
