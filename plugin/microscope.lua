-- todos:
--  - make window resizeable
--  - make "Definition not found." red
vim.keymap.set("n", "<leader>j", function()
  require("microscope").preview_definition()
end)
