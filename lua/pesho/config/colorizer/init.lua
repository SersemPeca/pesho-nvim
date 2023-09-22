local function config()
	local opt = {
		filetypes = {
			"javascript",
			css = {
				RGB = true,
				RRGGBB = true,
				names = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
				virtualtext = "\226\150\160",
			},
			html = { mode = "foreground" },
		},
		user_default_options = { mode = "background" },
	}
	return (require("colorizer")).setup(opt)
end
return { config = config }
