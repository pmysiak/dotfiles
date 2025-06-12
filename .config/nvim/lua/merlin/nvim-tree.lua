local M = {}

function M.get_current_directory()
    local nvim_tree_api = require("nvim-tree.api")
    local node = nvim_tree_api.tree.get_node_under_cursor()
    local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
    local basedir = is_folder and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")

    return basedir
end

return M

