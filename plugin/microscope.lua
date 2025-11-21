vim.keymap.set("n", "<leader>j", function()
  require("microscope").preview_definition()
end)
