vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- shift blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- shift line up and down in normal mode
vim.keymap.set("n", "<A-∆>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-˚>", ":m .-2<CR>==")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy pasta
vim.keymap.set({ "n", "v" }, "<leader>p", [["*p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["*P]])
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/awood/packer.lua<CR>");

-- copilot fix
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-s>", "copilot#Accept('<CR>')", {expr=true,silent=true})

-- folding
vim.keymap.set("n", "<leader>f", "zfa}")
vim.keymap.set("n", "<leader>F", "zfa{")
vim.keymap.set("n", "<leader>o", "zo")
