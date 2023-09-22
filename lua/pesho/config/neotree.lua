
local M = {}

M.config = function()
	vim.keymap.set('n', '<space>t', function()
		require('neo-tree').reveal_current_file('filesystem', true, false)
	end, {desc = 'Neotree'})
end

return M
