return {
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                enabled = true, -- 启动时自动开启 auto-save
                execution_message = {
                    message = function()
                        return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                    end,
                    dim = 0.18,
                    cleaning_interval = 1250,
                },
                trigger_events = { "InsertLeave" }, -- 触发保存的事件
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")

                    -- 确保 buffer 可修改并且 filetype 不在排除列表中
                    if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                        return true
                    end
                    return false
                end,
                write_all_buffers = false, -- 仅保存当前 buffer
                debounce_delay = 1500, -- 防抖延迟
                callbacks = {
                    enabling = nil,
                    disabling = nil,
                    before_asserting_save = nil,
                    before_saving = nil,
                    after_saving = nil,
                },
            })
        end,
    },
}
