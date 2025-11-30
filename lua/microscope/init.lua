local float = require("microscope.float")
local lsp = require("microscope.lsp")

local M = {}

M.options = {
  keymaps = {},
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})

  local key = M.options.keymaps.preview_definition
  if key then
    vim.keymap.set("n", key, function()
      M.preview_definition()
    end, { desc = "Microscope: Preview Definition" })
  end
end

function M.preview_definition(opts)
  lsp.get_definition(function(def)
    if not def then
      vim.cmd([[echohl ErrorMsg | echom "Definition not found" | echohl None]])
      return
    end
    float.open_float(def.filepath, def.line)
  end)
end

return M
