local M = { }

M.config = function()
-- This is your opts table
    require("telescope").setup({

        extensions = {
            ["ui-select"] = {

                require("telescope.themes").get_cursor({ 
                    windblend = 10,
                    previewer = false,
                    shorten_path = false,
                    border = true,
                })
            },
            -- ["docker-decompose"] = {},
            ["coauthor"] = {},
        }
    })
    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("ui-select")
    -- require("telescope").load_extension("docker-decompose")

    vim.keymap.set('n', '<space>f', function() vim.cmd(':Telescope') end, { desc = "Telescope" })

end



return M
