return {

    "2nthony/vitesse.nvim",
    dependencies = {
        "tjdevries/colorbuddy.nvim",
    },
    config = function()
        require("vitesse").setup({
            comment_italics = true,
            transparent_background = true,
            transparent_float_background = true, -- aka pum(popup menu) background
            reverse_visual = false,
            dim_nc = false,
            cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
            -- if `transparent_float_background` false, make telescope border color same as float background
            telescope_border_follow_float_background = false,
            -- similar to above, but for lspsaga
            lspsaga_border_follow_float_background = false,
            -- diagnostic virtual text background, like error lens
            diagnostic_virtual_text_background = false,

            -- override the `lua/vitesse/palette.lua`, go to file see fields
            colors = {},
            themes = {},
        })
        vim.cmd("colorscheme vitesse")
    end,
}
