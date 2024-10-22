return {
	'vyfor/cord.nvim',
	build = './build || .\\build',
	event = 'VeryLazy',
	opts = {
		usercmds = true,        -- Enable user commands
		log_level = 'error',    -- One of 'trace', 'debug', 'info', 'warn', 'error', 'off'
		timer = {
			interval = 1500,      -- Interval between presence updates in milliseconds (min 500)
			reset_on_idle = false, -- Reset start timestamp on idle
			reset_on_change = false, -- Reset start timestamp on presence change
		},
		editor = {
			image = nil,                       -- Image ID or URL in case a custom client id is provided
			client = 'neovim',                 -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
			tooltip = 'The Superior Text Editor', -- Text to display when hovering over the editor's image
		},
		display = {
			show_time = true,         -- Display start timestamp
			show_repository = true,   -- Display 'View repository' button linked to repository url, if any
			show_cursor_position = false, -- Display line and column number of cursor's position
			swap_fields = false,      -- If enabled, workspace is displayed first
			swap_icons = false,       -- If enabled, editor is displayed on the main image
			workspace_blacklist = {}, -- List of workspace names that will hide rich presence
		},
		lsp = {
			show_problem_count = false, -- Display number of diagnostics problems
			severity = 1,            -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
			scope = 'workspace',     -- buffer or workspace
		},
		idle = {
			enable = true, -- Enable idle status
			show_status = true, -- Display idle status, disable to hide the rich presence on idle
			timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
			disable_on_focus = false, -- Do not display idle status when neovim is focused
			text = 'Idle', -- Text to display when idle
			tooltip = '💤', -- Text to display when hovering over the idle image
		},
		text = {
			viewing = 'Viewing {}',                 -- Text to display when viewing a readonly file
			editing = 'Editing {}',                 -- Text to display when editing a file
			file_browser = 'Browsing files in {}',  -- Text to display when browsing files (Empty string to disable)
			plugin_manager = 'Managing plugins in {}', -- Text to display when managing plugins (Empty string to disable)
			lsp_manager = 'Configuring LSP in {}',  -- Text to display when managing LSP servers (Empty string to disable)
			vcs = 'Committing changes in {}',       -- Text to display when using Git or Git-related plugin (Empty string to disable)
			workspace = 'In {}',                    -- Text to display when in a workspace (Empty string to disable)
		},
	},
}
