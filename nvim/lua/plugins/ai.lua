return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      panel = { enabled = true },
      filetypes = {
        markdown = false,
        text = false,
      },
    })
  end,
}
