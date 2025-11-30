# Microscope.nvim

Quickly look into or edit declarations of functions, variables, and more through a floating window


<img width="3758" height="2172" alt="image" src="https://github.com/user-attachments/assets/2baadc01-9046-42b9-8abc-55fe667d1259" />

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
