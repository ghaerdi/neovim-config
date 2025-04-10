local website = "https://ghaerdi.mod.land"
local blacklist = {
	"nectar",
	"server",
	"web",
}

local is_blacklisted = function(opts)
	return vim.tbl_contains(blacklist, opts.workspace)
end

return {
	'vyfor/cord.nvim',
	build = ':Cord update',
	event = 'VeryLazy',
	opts = function()
		return {
			display = {
				theme = 'default',
				flavor = 'dark',
			},
			idle = {
				details = function(opts)
					return string.format('Taking a break from %s', opts.workspace)
				end
			},
			lazy = {
				icon = require('cord.api.icon').get('keyboard'),
			},
			text = {
				viewing = function(opts)
					return is_blacklisted(opts) and 'Viewing a file' or ('Viewing ' .. opts.filename)
				end,
				editing = function(opts)
					return is_blacklisted(opts) and 'Editing a file' or ('Editing ' .. opts.filename)
				end,
				workspace = function(opts)
					local hour = tonumber(os.date('%H'))
					local status =
							hour >= 22 and 'Late night coding' or
							hour >= 18 and 'Evening session' or
							hour >= 12 and 'Afternoon coding' or
							hour >= 5 and 'Morning productivity' or
							'Midnight hacking'

					return is_blacklisted(opts) and status or opts.workspace
				end
			},
			buttons = {
				{
					label = function(opts)
						return opts.repo_url and 'View Repository' or 'My Website'
					end,
					url = function(opts)
						if opts.is_idle then return end
						if is_blacklisted(opts) then
							return website
						end
						return opts.repo_url or website
					end
				}
			}
		}
	end
}
