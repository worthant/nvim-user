-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- My custom mappings
    ["<leader>bf"] = { ":exe ':silent !firefox %'<cr>", desc = "Preview in Firefox" },
    ["<leader>md"] = { ":MarkdownPreview<cr>", desc = "Preview Markdown" },
    ["<leader>gw"] = { ":Glow!<cr>", desc = "Glow Markdown" },
    ["<leader>mp"] = {
      function()
        local file = vim.fn.expand "%"
        local command = "cmp " .. file
        local term = require("toggleterm.terminal").Terminal:new {
          cmd = command,
          direction = "float",
          close_on_exit = false,
          on_open = function(term)
            vim.cmd "startinsert!"
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<CR>", { noremap = true, silent = true })
          end,
          on_close = function(term) vim.cmd "stopinsert!" end,
        }
        term:open()
      end,
      desc = "Compile and Run cpp files",
    },
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
