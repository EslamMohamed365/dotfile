-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F6>", "<cmd>CompetiTest run<cr>", { desc = "Run CompetiTest" })

local function run_current_file()
  local ft = vim.bo.filetype
  local filename = vim.fn.expand("%:p")
  local filename_no_ext = vim.fn.expand("%:r")
  local file_dir = vim.fn.expand("%:p:h")

  -- Check if file exists and save it
  if vim.bo.modified then
    vim.cmd("write")
    vim.notify("File saved before execution", vim.log.levels.INFO)
  end

  -- Commands configuration for each language
  local commands = {
    python = {
      cmd = 'python3 "' .. filename .. '" || python "' .. filename .. '"',
      name = "Python Runner",
    },
    lua = {
      cmd = 'lua "' .. filename .. '"',
      name = "Lua Runner",
    },
    cpp = {
      cmd = 'cd "'
        .. file_dir
        .. '" && g++ -std=c++17 -O2 -Wall "'
        .. filename
        .. '" -o "'
        .. filename_no_ext
        .. '" && "'
        .. filename_no_ext
        .. '"',
      name = "C++ Runner",
    },
    c = {
      cmd = 'cd "'
        .. file_dir
        .. '" && gcc -std=c11 -O2 -Wall "'
        .. filename
        .. '" -o "'
        .. filename_no_ext
        .. '" && "'
        .. filename_no_ext
        .. '"',
      name = "C Runner",
    },
    javascript = {
      cmd = 'node "' .. filename .. '"',
      name = "Node.js Runner",
    },
    typescript = {
      cmd = 'npx ts-node "'
        .. filename
        .. '" || tsc "'
        .. filename
        .. '" && node "'
        .. filename_no_ext
        .. '.js"',
      name = "TypeScript Runner",
    },
    java = {
      cmd = 'cd "' .. file_dir .. '" && javac "' .. filename .. '" && java "' .. vim.fn.expand("%:t:r") .. '"',
      name = "Java Runner",
    },
    rust = {
      cmd = function()
        -- Check for Cargo.toml existence
        if vim.fn.filereadable(file_dir .. "/Cargo.toml") == 1 then
          return 'cd "' .. file_dir .. '" && cargo run'
        else
          return 'cd "'
            .. file_dir
            .. '" && rustc "'
            .. filename
            .. '" -o "'
            .. filename_no_ext
            .. '" && "'
            .. filename_no_ext
            .. '"'
        end
      end,
      name = "Rust Runner",
    },
    go = {
      cmd = 'cd "' .. file_dir .. '" && go run "' .. filename .. '"',
      name = "Go Runner",
    },
    sh = {
      cmd = 'bash "' .. filename .. '"',
      name = "Bash Runner",
    },
    php = {
      cmd = 'php "' .. filename .. '"',
      name = "PHP Runner",
    },
    ruby = {
      cmd = 'ruby "' .. filename .. '"',
      name = "Ruby Runner",
    },
    perl = {
      cmd = 'perl "' .. filename .. '"',
      name = "Perl Runner",
    },
    r = {
      cmd = 'Rscript "' .. filename .. '"',
      name = "R Runner",
    },
    dart = {
      cmd = 'dart "' .. filename .. '"',
      name = "Dart Runner",
    },
    kotlin = {
      cmd = 'cd "'
        .. file_dir
        .. '" && kotlinc "'
        .. filename
        .. '" -include-runtime -d "'
        .. filename_no_ext
        .. '.jar" && java -jar "'
        .. filename_no_ext
        .. '.jar"',
      name = "Kotlin Runner",
    },
  }

  local lang_config = commands[ft]
  if not lang_config then
    vim.notify("No run command for this language: " .. ft, vim.log.levels.WARN)
    return
  end

  -- Get the command (might be a function or string)
  local run_cmd = type(lang_config.cmd) == "function" and lang_config.cmd() or lang_config.cmd

  -- Create new terminal
  local Terminal = require("toggleterm.terminal").Terminal
  local runner = Terminal:new({
    cmd = run_cmd,
    dir = file_dir,
    direction = "float",
    float_opts = {
      border = "double",
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
    },
    close_on_exit = false,
    auto_scroll = true,
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    on_close = function()
      vim.cmd("startinsert!")
    end,
  })

  runner:toggle()
  vim.notify("Running " .. lang_config.name .. "...", vim.log.levels.INFO)
end

vim.keymap.set("n", "<F5>", run_current_file, { desc = "Run current file" })