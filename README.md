Neovim **(>=0.10)** comes with a set of different [color schemes](https://neovim.io/doc/user/usr_06.html#06.3). They can
be changed via `:colorscheme <tab>` command which lets you select color schemes. This plugin lets you toggle (cycle)
between your predefined set of neovim colorschemes.

Usage via the lazy plugin manager is as follows:

```lua
require("lazy").setup({
    "sumanchapai/nvim-toggle-theme",
    version = "v0.1.*",
    config = function()
        local toggle = require('ToggleTheme')
        toggle.config({
            -- Provide the list of themes to toggle between
            themes = {
                "koehler", -- first theme is set as the default theme
                "peachpuff",
                "evening",
            },
            -- If a different theme loads on startup even when setting this to true,
            -- it must be because some other plugin that loads after this defines that theme
            -- to be used
            set_first_as_default=true,
        })
        -- Define the keymap to toggle theme change.
        vim.keymap.set("n", "<leader>t", toggle.Toggle, { desc = "Toggle theme" })
        end
})
```

Explanation for the setup above code:

1. First we save the module (aka. library) in a local variable called `toggle`.

2. We call the module's config function providing the required options which is a table of themes and a boolean
   indicating whether we want the first colorscheme provided to be set as the default.
3. Then, outside of the module config, we are setting a keymap to call the module's Toggle function using our preferred
   key bindings. Note that this is done in the config function provided to lazy, not to the ToggleTheme module.

### Known Issues

1. If you're have another colorscheme installed like: tokyonight and you want to pass its theme as option to
   `nvim-toggle-theme`, you'll have to provided the full name like: `tokyonight-dark` or `tokyonight-day` instead of
   just `tokyonight`. The latter exhibits unknown behavior.
