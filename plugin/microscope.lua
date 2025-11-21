-- todos:
--  - make window resizeable
--  - docs
vim.keymap.set("n", "<leader>r", function()
  require("microscope").preview_definition()
end)
