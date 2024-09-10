return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    -- save_path = "~/Pictures/codesnap",
    save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures"),
    has_breadcrumbs = true,
    -- bg_theme = "bamboo",
    bg_theme = "default",
    code_font_family = "Ubuntu Mono",
    watermark = "",
  },
  config = function()
    require("codesnap").setup(_, opts)
  end,
}
