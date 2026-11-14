-- ┏━━━━━┓
-- ┃ oil ┃
-- ┗━━━━━┛

local M = {}

M[1] = 'stevearc/oil.nvim'

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.lazy = false

M.init = function()
  require('utils').set_keymaps(
    { 'n', '-', require('oil').open },
    { 'n', '_', function() require('oil').open(vim.fn.getcwd()) end },
    {
      'n',
      '<Leader>ow',
      function()
        local path = vim.fn.expand('~/.workbench')
        if vim.fn.isdirectory(path) == 1 then require('oil').toggle_float(path) end
      end,
    }
  )
end

M.opts = function()
  return {
    delete_to_trash = true,
    experimental_watch_for_changes = true,
    cleanup_delay_ms = 0,
    keymaps = {
      ['<C-s>'] = false,
      ['<C-h>'] = false,
      ['<C-t>'] = false,
      ['<C-c>'] = function()
        if vim.w.is_oil_win then require('oil').close() end
      end,
      ['<C-l>'] = false,
      ['q'] = function()
        if vim.w.is_oil_win then return require('oil').close() end
        vim.api.nvim_feedkeys('q', 'n', false)
      end,
      ['<Esc>'] = function()
        if vim.w.is_oil_win then require('oil').close() end
      end,
      ['~'] = { 'actions.cd', opts = { scope = 'win' } },
      ['<Leader>y'] = function()
        require('oil.actions').yank_entry.callback({ modify = ':t:r' })
        vim.notify('Filename copied to clipboard.')
      end,
      ['<Leader>Y'] = function()
        require('oil.actions').yank_entry.callback({ modify = ':.' })
        vim.notify('Filepath copied to clipboard.')
      end,
      ['gx'] = function()
        local cursor_entry = require('oil').get_cursor_entry()

        if not cursor_entry then return end

        local current_directory = require('oil').get_current_dir()

        if not current_directory then return end

        local filepath = string.format('%s%s', current_directory, cursor_entry.name)

        if not filepath then return end

        if require('utils').is_matching_any_pattern(require('constants').PATTERNS.IMAGE, filepath) then
          require('utils').execute(
            string.format('%s %s', require('constants').APPLICATION.IMAGE_VIEWER, vim.fn.shellescape(filepath))
          )
          return
        end

        if require('utils').is_matching_any_pattern(require('constants').PATTERNS.VIDEO, filepath) then
          require('utils').execute(
            string.format('%s %s', require('constants').APPLICATION.VIDEO_PLAYER, vim.fn.shellescape(filepath))
          )
          return
        end

        require('oil.actions').open_external.callback()
      end,
      ['<Leader>|'] = {
        'actions.select',
        opts = {
          vertical = true,
        },
      },
      ['<Leader>_'] = {
        'actions.select',
        opts = {
          horizontal = true,
        },
      },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        if name == '..' then return true end

        return false
      end,
    },
    float = {
      padding = 0,
      max_width = 80,
      max_height = 12,
      border = 'single',
    },
    ssh = {
      border = 'single',
    },
    keymaps_help = {
      border = 'single',
    },
  }
end

return M
