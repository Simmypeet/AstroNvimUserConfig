-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find project" },
    ["<leader>s"] = { function()
      local current_window = vim.fn.win_getid()
      require('leap').leap { target_windows = { current_window } }
    end,
      desc = "Leap find"
    },
  },
  i = {
    ['<C-s>'] = {
      function()
        vim.cmd('w')
      end
    },
    ['<C-h>'] = {
      -- move cursor to the left
      '<left>'
    },
    ['<C-j>'] = {
      -- move cursor to the down
      '<down>'
    },
    ['<C-k>'] = {
      -- move cursor to the up
      '<up>'
    },
    ['<C-l>'] = {
      -- move cursor to the right
      '<right>'
    },
  },
  -- mappings in visual mode
  v = {
    ['<C-r>'] = { "y<esc>:%s/<C-r>\"//g<left><left>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
