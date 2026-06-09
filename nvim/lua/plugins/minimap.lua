return {
  {
    "nvim.mini/mini.map",
    version = false,
    config = function()
      local map = require("mini.map")

      map.setup()

      -- Open minimap automatically
      vim.schedule(function()
        MiniMap.open()
      end)
    end,
  },
}
