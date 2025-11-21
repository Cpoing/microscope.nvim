local float = require("microscope.float")
local lsp = require("microscope.lsp")

local M = {}

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
