return {
  "zk-org/zk-nvim",

  config = function()
     require("zk").setup()

    local opts = { noremap=true, silent=false }
    -- Create a new note after asking for its title.
    vim.keymap.set("n", "<leader>zN", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
    -- Open notes.
    vim.keymap.set("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
    -- Open notes associated with the selected tags.
    vim.keymap.set("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
    vim.keymap.set("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

    -- ///////////////////////////////////////////////////////////////////
    local function create_and_open_zk_note()
      -- Get the current line
      local line = vim.api.nvim_get_current_line()

      -- Extract the title from between double square brackets
      local title = line:match("%[%[(.-)%]%]")
      local dir = vim.fn.expand('%:p:h')

      if title then
        -- vim.cmd.ZkNew({ dir = vim.fn.expand('%:p:h'), title = title })
        local cmd = string.format("ZkNew { dir = '%s', title = '%s' }", dir, title)
        vim.cmd(cmd)
      else
        print("No title found between double square brackets")
      end
    end

    -- Create a Vim command to call this function
    vim.api.nvim_create_user_command("CreateAndOpenZkNote", create_and_open_zk_note, {})
    -- Optional: Add a key mapping
    vim.keymap.set("n", "<leader>zn", ":CreateAndOpenZkNote<CR>", { desc = "Create and open zk note" })
    -- ///////////////////////////////////////////////////////////////////

  end
}
