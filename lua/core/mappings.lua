local map = require("utils").map

-- buffer navigation
map("n", "<leader>kp", ":bprev<cr>", { desc = "Prev buffer" })
map("n", "<leader>kn", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>kd", ":bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>kc", ":new<cr>", { desc = "New buffer" })
map("n", "<leader>ko", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" }) -- https://stackoverflow.com/a/42071865/516188

-- tab navigation
map("n", "<leader>j[", ":tabprevious<cr>", { desc = "Prev tab" })
map("n", "<leader>j]", ":tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>jn", ":tabnew<cr>", { desc = "New tab" })
map("n", "<leader>jc", ":tabclose<cr>", { desc = "Close tab" })

-- plugin management
map("n", "<leader>pc", ":Lazy check<cr>", { desc = "Check plugins" })
map("n", "<leader>pu", ":Lazy update<cr>", { desc = "Update plugins" })
map("n", "<leader>ps", ":Lazy show<cr>", { desc = "Show plugins" })
map("n", "<leader>ph", ":Lazy help<cr>", { desc = "Help" })
map("n", "<leader>pp", ":Lazy profile<cr>", { desc = "Profile" })
map("n", "<leader>pl", ":Lazy logs<cr>", { desc = "Logs" })
map("n", "<leader>px", ":Lazy clear<cr>", { desc = "Clear uninstalled plugins" })
map("n", "<leader>pr", ":Lazy restore<cr>", { desc = "Restore plugins from lockfile" })

-- resize with arrows
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize +2" })
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize -2" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Vertical Resize -2" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Vertical Resize +2" })

map("n", "q:", ":q")
-- Disable arrow keys in normal mode
-- map("n", "<up>", "<nop>")
-- map("n", "<down>", "<nop>")
-- map("n", "<left>", "<nop>")
-- map("n", "<right>", "<nop>")
