# Microscope.nvim

Quickly look into or edit declarations of functions, variables, and more through a floating window


<img width="3758" height="2172" alt="image" src="https://github.com/user-attachments/assets/2baadc01-9046-42b9-8abc-55fe667d1259" />

# Install
```lua
{
    "Cpoing/microscope.nvim",
    cmd = "MicroscopePeek",
    keys = {
        { "<leader>r", ":MicroscopePeek<CR>", desc = "Peek definition" },
    },
    config = function()
        require("microscope")
    end,
},

```

# Usage
```<leader>r``` - opens a floating window of the declaration of what your cursor is on
