-- Textobjects plugin (separate configuration)
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    --[[  
      Anything class represents types generally, maybe interface, structs, class and other types
      Anything function represents routines generally
    ]]    
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",  -- Select inside a function
            ["ac"] = "@class.outer",     -- Select outside class
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer", -- Select outside parameter
            ["ia"] = "@parameter.inner", -- Select inside parameter
            ["ab"] = "@block.outer",     -- Selects the block and the block name (eg - function name and everything and end of function, class name and everything to end of class)
            ["ib"] = "@block.inner",     -- Select inside a block
          },
          -- You can choose the select mode (default is charwise 'v')
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    })
  end,
}
