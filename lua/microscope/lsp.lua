local M = {}

function M.get_definition(callback)
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
		if err or not result or vim.tbl_isempty(result) then
			callback(nil)
			return
		end

		local def = result[1]
		local uri = def.uri or def.targetUri
		local range = def.range or def.targetSelectionRange
		local filepath = vim.uri_to_fname(uri)
		local line = range.start.line

		callback({ filepath = filepath, line = line })
	end)
end

return M
