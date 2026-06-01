local palette = require("nightfox.palette").load("carbonfox")

-- slokaCitation   → bright gold/yellow — the śruti reference header
vim.api.nvim_set_hl(0, "slokaCitation", {
  fg = palette.yellow.base,
  bold = true,
})

-- slokaLineMarker → magenta — pāda boundary marker
vim.api.nvim_set_hl(0, "slokaLineMarker", {
  fg = palette.magenta.base,
})

-- slokaTransGloss → cyan — [translation glosses], prominent but readable
vim.api.nvim_set_hl(0, "slokaTransGloss", {
  fg = palette.cyan.base,
})

-- slokaEtymGloss  → dimmed comment grey — {etymology, intentionally receding}
vim.api.nvim_set_hl(0, "slokaEtymGloss", {
  fg = palette.black.bright,
  italic = true,
})

-- slokaSandhi     → pink/magenta — + = operators, visually distinct
vim.api.nvim_set_hl(0, "slokaSandhi", {
  fg = palette.pink.base,
  bold = true,
})

-- slokaParen      → magenta — ( ) grouping
vim.api.nvim_set_hl(0, "slokaParen", {
  fg = palette.magenta.base,
})

-- slokaEnglish    → green — "quoted English translation", warm and legible
vim.api.nvim_set_hl(0, "slokaEnglish", {
  fg = palette.green.base,
})

-- slokaPunct      → magenta dim — .  ..  ;  punctuation tokens
vim.api.nvim_set_hl(0, "slokaPunct", {
  fg = palette.magenta.dim,
})

-- slokaSwara      → red bright — \' \_ accent marks, need to pop against tokens
vim.api.nvim_set_hl(0, "slokaSwara", {
  fg = palette.red.bright,
  bold = true,
})
