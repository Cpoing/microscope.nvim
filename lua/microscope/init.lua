local lsp = require("microscope.lsp")

local M = {}

function M.preview_definition(opts)
	lsp.get_definition(function(def)
		if not def then
			print("No definition found.")
			return
		end
		print(def.filepath)
		print(def.line)
	end)
end

return M
