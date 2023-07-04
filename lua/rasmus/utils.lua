local M = {}

M.highlight = function(group, color)
  vim.api.nvim_set_hl(0, group, color)
end

return M
