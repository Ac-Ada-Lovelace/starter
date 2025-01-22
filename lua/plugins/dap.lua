if true then
    return {}
end

return {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
        local dap = require("dap")
        -- 确保 dap.configurations 被正确初始化
        dap.configurations = dap.configurations or {}

        -- 确保已有配置不被覆盖，且只在未定义的语言配置中进行添加
        for _, lang in ipairs({ "c", "cpp" }) do
            -- 为每个语言添加“编译并调试”配置
            table.insert(opts.configurations[lang], {
                type = "codelldb",
                request = "launch",
                name = "Build and Debug",
                program = function()
                    -- 获取当前文件的路径
                    local filename = vim.fn.expand("%:p")
                    local output = vim.fn.expand("%:p:r")

                    -- 根据语言选择适当的编译器
                    local compile_cmd
                    if lang == "c" then
                        compile_cmd = string.format("gcc -g -o %s %s", output, filename)
                    elseif lang == "cpp" then
                        compile_cmd = string.format("g++ -g -o %s %s", output, filename)
                    end

                    -- 执行编译命令
                    vim.fn.system(compile_cmd)

                    -- 返回编译后的可执行文件路径
                    return output
                end,
                args = function()
                    return vim.split(vim.fn.input("Enter arguments: "), " ")
                end,
                cwd = "${workspaceFolder}",
            })
        end
    end,
}
