vim.api.nvim_create_user_command("MicroscopePeek", function()
  require("microscope").preview_definition()
end, {})
