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
  local scratch = vim.api.nvim_create_buf(false, true)

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

  local win = vim.api.nvim_open_win(scratch, true, opts)

  local bufnr
  local existing = vim.fn.bufnr(filepath, false)

  if existing ~= -1 then
    vim.api.nvim_win_set_buf(win, existing)
    bufnr = existing
  else
    vim.cmd("silent noautocmd edit " .. vim.fn.fnameescape(filepath))
    bufnr = vim.api.nvim_get_current_buf()

		vim.bo[bufnr].filetype = vim.filetype.match({ filename = filepath }) or ""
  end

  vim.api.nvim_win_set_cursor(win, { line + 1, 0 })

	vim.keymap.set("n", "<Esc>", function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end

		if vim.api.nvim_buf_is_valid(bufnr) then
			pcall(vim.keymap.del, "n", "<Esc>", { buffer = bufnr })
		end
	end, { buffer = bufnr, nowait = true })

  if vim.startswith(filepath, "/Library") then
    vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  else
    vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
  end
end

return M
