-- claudecode.nvim: makes Neovim look like an IDE to Claude Code (`/ide`).
-- It runs a local WebSocket MCP server and writes a lock file to ~/.claude/ide/,
-- so Claude Code can see your selection and diagnostics and propose diffs here.
-- See https://github.com/coder/claudecode.nvim

vim.pack.add { 'https://github.com/coder/claudecode.nvim' }

require('claudecode').setup {
  terminal = {
    -- Use Neovim's built-in terminal, so snacks.nvim isn't needed.
    provider = 'native',
    split_side = 'right',
    split_width_percentage = 0.35,
  },
}

local map = function(lhs, rhs, desc, mode) vim.keymap.set(mode or 'n', lhs, rhs, { desc = desc }) end

map('<leader>ac', '<cmd>ClaudeCode<cr>', '[C]laude: toggle')
map('<leader>af', '<cmd>ClaudeCodeFocus<cr>', 'Claude: [F]ocus')
map('<leader>ar', '<cmd>ClaudeCode --resume<cr>', 'Claude: [R]esume session')
map('<leader>aC', '<cmd>ClaudeCode --continue<cr>', 'Claude: [C]ontinue last session')
map('<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', 'Claude: select [M]odel')
map('<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', 'Claude: add current [B]uffer')
map('<leader>as', '<cmd>ClaudeCodeSend<cr>', 'Claude: [S]end selection', 'v')
map('<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', 'Claude: [A]ccept diff')
map('<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', 'Claude: [D]eny diff')

-- In Neo-tree, <leader>as adds the file under the cursor as context.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'neo-tree',
  group = vim.api.nvim_create_augroup('custom-claudecode-tree', { clear = true }),
  callback = function(ev)
    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', { buffer = ev.buf, desc = 'Claude: add file' })
  end,
})
