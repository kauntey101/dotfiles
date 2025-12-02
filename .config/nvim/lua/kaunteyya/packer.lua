-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

    
    -- Color Schemes Section (just declare)
    -- Rose Pine 
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            -- require the separate setup file
            require("kaunteyya.colors.rosepine")
        end,
    })

    -- Tokyo Night 
    use({
        "folke/tokyonight.nvim",
        as = "tokyonight",
        config = function()
            require("kaunteyya.colors.tokyonight")
        end,
    })

end)
