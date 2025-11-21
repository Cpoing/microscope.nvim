local M = {}

function M.open_float(filepath, line)
  local bufnr = vim.api.nvim_create_buf(true, false)

  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.5)
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(bufnr, true, opts)
  vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  vim.api.nvim_win_set_cursor(win, { line + 1, 0 })

  if vim.startswith(filepath, "/Library") then
    vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  else
    vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
  end
end

return M
