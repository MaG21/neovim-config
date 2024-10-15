local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
--
-- ------
-- Leader Maps
-- ----

-- Leader t (terminal)
--
local status_ok, term = pcall(require, "toggleterm.terminal")
if status_ok then
	local Terminal = term.Terminal

  local termcmd = function (cmd)
    return function ()
      Terminal:new({ cmd = cmd, hidden = true }):toggle()
    end
  end

  keymap("n", "<leader>te", "<cmd>ToggleTerm<cr>", opts)
  vim.keymap.set('n', "<leader>tr", termcmd('irb'))
  vim.keymap.set('n', "<leader>tp", termcmd('python'))
  vim.keymap.set('n', "<leader>th", termcmd('php artisan tinker'))
end

local status, telescope_builtin = pcall(require, "telescope.builtin")
if status then
  -- Get git params if possible, if not return empty table
  local function git_params()
		vim.fn.system("git rev-parse --is-inside-work-tree")

    local params = {}
    -- if shell error is 0 then it means git it present
		if vim.v.shell_error == 0 then
      params = {
        prompt_title = "Files in Git Root",
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      }
		end

    return params
	end

  -- if we're on a repository, only consider the files tracked by
  -- git. If not a git repo, then fallback to default behaviour.
  vim.keymap.set('n', "<leader>p", function ()
    telescope_builtin.find_files(git_params())
  end)

  vim.keymap.set("n", "<leader>s", function()
    telescope_builtin.live_grep(git_params())
  end)

end
keymap("n", "<space>", 'ci"', opts) -- Useful text object to use in normal mode
keymap("n", "<Leader>c", "<cmd>noh<CR>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts) -- open file explorer
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts) -- autoformat with detected fixer (ie phpcsfixer)
keymap("n", "<Leader>o", ":only<CR>", opts) -- Make the current buffer the only visible one if the screen is splitted
keymap("n", "<Leader>y", '"*yy', opts) -- copy to clipboard
keymap("v", "<Leader>y", '"*yy', opts)

--
-- NOTE: <space> keymaps are for debugging, take look at nvim-dap.lua
-- for more information about these mappings

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
-- NOTE: for this to work you may need to change the way alt is interpreted
-- by the terminal
-- keymap("n", "<A-k>", ":m .-2<CR>", opts)
-- keymap("n", "<A-j>", ":m .+1<CR>", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>=gv", opts)
-- keymap("v", "<A-j>", ":m .+1<CR>=gv", opts)

-- All the substitution I do from visual don't ruin my register
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
