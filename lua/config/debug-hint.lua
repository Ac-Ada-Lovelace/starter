local function set_keymap(mode, key, cmd, desc)
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true, desc = desc })
end

local function show_keymap_hints()
    local buf = vim.api.nvim_create_buf(false, true)
    local keymap_hints = {
        "Keymap Hints:",
        "<F3>   - Toggle Breakpoint",
        "<S-F3>   - Breakpoint Condition",
        "<F4>   - Run/Continue",
        "<F5>   - Run with Args",
        "<F6> - Go to Line (No Execute)",
        "<S-F6>   - Run to Cursor",
        "<F7>   - Step Into",
        "<F8> - Step Over",
        "<S-F8>   - Step Out",
        "<F9>   - Run Last",
        "<F10>  - Pause",
    }
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, keymap_hints)
    local width = 40
    local height = #keymap_hints
    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = (vim.o.lines - height) / 2,
        col = (vim.o.columns - width) / 2,
        border = "rounded", -- Add a rounded border
        noautocmd = true, -- Prevent triggering autocmds
    }
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Autocmd to close the window when it loses focus
    vim.api.nvim_create_autocmd("WinLeave", {
        buffer = buf,
        callback = function()
            vim.api.nvim_win_close(win, true)
        end,
    })
end

-- Command to show keymap hints
vim.api.nvim_create_user_command("Dbh", show_keymap_hints, {})
-- Keymap to trigger the command
set_keymap("n", "<leader>dh", ":Dbh<CR>", "Show DAP Keymap Hints")
