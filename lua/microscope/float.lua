local M = {}

local function git_relative(filepath)
  local root = vim.fn.systemlist(
    "git -C " ..
    vim.fn.fnameescape(vim.fn.fnamemodify(filepath, ":h")) ..
    " rev-parse --show-toplevel"
  )[1]

  if not root or root == "" then
    return filepath:match("([^/]+)$")
  end

  root = root:gsub("/+$", "")
  filepath = filepath:gsub("/+$", "")

  if filepath:sub(1, #root) == root then
    return filepath:sub(#root + 2)
  end

  return filepath:match("([^/]+)$")
end

function M.open_float(filepath, line)
  local bufnr = vim.api.nvim_create_buf(true, false)

  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.5)
  local opts = {
		title = git_relative(filepath),
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
