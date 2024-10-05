Neovim comes with a set of different [color schemes](https://neovim.io/doc/user/usr_06.html).
They can be changed via `:colorscheme <tab>` command that lets you select color schemes. This command
lets you toggle between your predefined set of neovim colorschemes.

Usage via lazy is as follows:

```lua
require("lazy").setup({
    "sumanchapai/nvim-toggle-theme",
    config = function()
        toggle.config({
            -- Prove the list of themes to toggle between
            themes = {
                "koehler", -- first theme is set as the default theme
                "peachpuff",
                "evening",
            },
            -- if a different theme is loads on startup even when setting this to true,
            -- it must be because some other plugin that loads after this defines that theme
            set_first_as_default=true,
        })
        -- Define the keymap to toggle theme change
        vim.keymap.set("n", "<leader>t", toggle.Toggle, { desc = "Toggle theme" })
        end
})
```
