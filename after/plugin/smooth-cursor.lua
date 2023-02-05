require('smoothcursor').setup({
    cursor = "",              -- cursor shape (need nerd font)
    texthl = "SCCursorHead",   -- highlight group, default is { bg = nil, fg = "#FFD400" }
    linehl = "cursorline",     -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
    type = "exp",							 -- define cursor movement calculate function, "default" or "exp" (exponential).
	  fancy = {
      enable = false,
      head = { cursor = '', texthl = 'SCCursorHead' },
      body = {
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
      },
    },
    speed = 20,                -- max is 100 to stick to your current position
    intervals = 15,            -- tick interval
    threshold = 1,             -- animate if threshold lines jump
    disable_float_win = true,  -- disable on float window
})
