require("bootstrap")
require("pesho.config.settings")

require("pesho.packages")
require("pesho.autocommands")

local neogit = require('neogit')

vim.keymap.set('n', '<space>c', function() vim.cmd(':lua require("docker-decompose.parse_file")()') end, { desc = "Parse docker-compose file" })
vim.keymap.set('n', '<space>p', function() vim.cmd(':lua require("docker-decompose.picker")()') end, { desc = "Container actions" })
vim.keymap.set('n', '<space>ng', function() neogit.open({ kind = "split" }) end, { desc = "Neogit" })
