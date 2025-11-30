# Microscope.nvim

Quickly look into or edit declarations of functions, variables, and more through a floating window

<img width="1920" height="1103" alt="Screenshot 2025-11-22 at 8 25 37 PM" src="https://github.com/user-attachments/assets/4ff37122-81f0-4fdc-9041-3b67379bd0c9" />

# Install
```lua
{
  "Cpoing/microscope.nvim",
  config = function()
    require("microscope").setup({
      keymaps = {
        preview_definition = "<leader>r",
      },
    })
  end,
}

```

# Usage
```<leader>r``` - opens a floating window of the declaration of what your cursor is on
