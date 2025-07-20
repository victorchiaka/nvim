local M = {}

M.ui = {
  hl_override = {
    -- Statusline highlights
    St_NormalMode = { bg = "#7E9CD8", fg = "#1F1F28", bold = true },
    St_InsertMode = { bg = "#98BB6C", fg = "#1F1F28", bold = true },
    St_VisualMode = { bg = "#E6C384", fg = "#1F1F28", bold = true },
    St_ReplaceMode = { bg = "#E82424", fg = "#DCD7BA", bold = true },
    St_CommandMode = { bg = "#D27E99", fg = "#1F1F28", bold = true },
    St_ConfirmMode = { bg = "#FF9E3B", fg = "#1F1F28", bold = true },
    St_SelectMode = { bg = "#957FB8", fg = "#1F1F28", bold = true },

    -- Statusline sections
    St_gitIcons = { bg = "#363646", fg = "#7E9CD8" },
    St_LspStatus = { bg = "#363646", fg = "#98BB6C" },
    St_LspProgress = { bg = "#363646", fg = "#E6C384" },
    St_file_info = { bg = "#363646", fg = "#DCD7BA" },
    St_cwd = { bg = "#2A2A37", fg = "#7E9CD8" },
  }
}

M.colorify = {
  enabled = false -- Disables nvchad color highlights
}

-- Make sure the theme you choose here matches the one in plugins_spec.lua
-- This is so the statusline adapts to the theme and there'll be no coloroverlaps between base46 and vim api's colorscheme
M.base46 = {
  theme = "kanagawa" -- Default theme from onedark
  -- theme = "gruvbox" -- Default theme from onedark
  -- theme = "kanagawa" -- Default theme from onedark
  -- theme = "solarized-osaka"
  -- theme = "vscode"
}

M.tabufline = {
  enabled = true,
  -- lazyload = true,
  lazyload = false,
  order = { "treeOffset", "buffers", "tabs", "btns" },
  modules = nil,
  -- bufwidth = 21,
}

return M
