-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Helper function to set keymaps
local function set_keymap(mode, key, cmd, desc)
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true, desc = desc })
end

-- set dap keymaps
set_keymap("n", "<F3>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint")
set_keymap("n", "<S-F3>", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Breakpoint Condition")
set_keymap("n", "<F4>", "<cmd>lua require('dap').continue()<CR>", "Run/Continue")
set_keymap("n", "<F5>", "<cmd>lua require('dap').continue({ before = get_args })<CR>", "Run with Args")
set_keymap("n", "<F6>", "<cmd>lua require('dap').goto_()<CR>", "Go to Line (No Execute)")
set_keymap("n", "<S-F6>", "<cmd>lua require('dap').run_to_cursor()<CR>", "Run to Cursor")
set_keymap("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", "Step Into")
set_keymap("n", "<F8>", "<cmd>lua require('dap').step_over()<CR>", "Step Over")
set_keymap("n", "<S-F8>", "<cmd>lua require('dap').step_out()<CR>", "Step Out")
set_keymap("n", "<F9>", "<cmd>lua require('dap').run_last()<CR>", "Run Last")
set_keymap("n", "<F10>", "<cmd>lua require('dap').pause()<CR>", "Pause")
require("config.debug-hint")
