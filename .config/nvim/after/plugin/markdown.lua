require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
	heading = {
		-- Useful context to have when evaluating values.
		-- | level    | the number of '#' in the heading marker         |
		-- | sections | for each level how deeply nested the heading is |

		-- Turn on / off heading icon & background rendering.
		enabled = true,
		-- Additional modes to render headings.
		render_modes = false,
		-- Turn on / off atx heading rendering.
		atx = true,
		-- Turn on / off setext heading rendering.
		setext = true,
		-- Turn on / off sign column related rendering.
		sign = true,
		-- Replaces '#+' of 'atx_h._marker'.
		-- Output is evaluated depending on the type.
		-- | function | `value(context)`              |
		-- | string[] | `cycle(value, context.level)` |
		icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
		-- Determines how icons fill the available space.
		-- | eol     | '#'s are concealed and icon is placed at right most column   |
		-- | right   | '#'s are concealed and icon is appended to right side        |
		-- | inline  | '#'s are concealed and icon is inlined on left side          |
		-- | overlay | icon is left padded with spaces and overlayed hiding all '#' |
		position = "overlay",
		-- Added to the sign column if enabled.
		-- Output is evaluated by `cycle(value, context.level)`.
		signs = { "󰫎 " },
		-- Width of the heading background.
		-- | block | width of the heading text |
		-- | full  | full width of the window  |
		-- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
		width = "full",
		-- Amount of margin to add to the left of headings.
		-- Margin available space is computed after accounting for padding.
		-- If a float < 1 is provided it is treated as a percentage of available window space.
		-- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
		left_margin = 0,
		-- Amount of padding to add to the left of headings.
		-- Output is evaluated using the same logic as 'left_margin'.
		left_pad = 0,
		-- Amount of padding to add to the right of headings when width is 'block'.
		-- Output is evaluated using the same logic as 'left_margin'.
		right_pad = 0,
		-- Minimum width to use for headings when width is 'block'.
		-- Can also be a list of integers evaluated by `clamp(value, context.level)`.
		min_width = 0,
		-- Determines if a border is added above and below headings.
		-- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
		border = false,
		-- Always use virtual lines for heading borders instead of attempting to use empty lines.
		border_virtual = false,
		-- Highlight the start of the border using the foreground highlight.
		border_prefix = false,
		-- Used above heading for border.
		above = "▄",
		-- Used below heading for border.
		below = "▀",
		-- Highlight for the heading icon and extends through the entire line.
		-- Output is evaluated by `clamp(value, context.level)`.
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
		-- Highlight for the heading and sign icons.
		-- Output is evaluated using the same logic as 'backgrounds'.
		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
		-- Define custom heading patterns which allow you to override various properties based on
		-- the contents of a heading.
		-- The key is for healthcheck and to allow users to change its values, value type below.
		-- | pattern    | matched against the heading text @see :h lua-patterns |
		-- | icon       | optional override for the icon                        |
		-- | background | optional override for the background                  |
		-- | foreground | optional override for the foreground                  |
		custom = {},
	},
	code = {
		-- Turn on / off code block & inline code rendering.
		enabled = false,
		-- Additional modes to render code blocks.
		render_modes = false,
		-- Turn on / off sign column related rendering.
		sign = true,
		-- Whether to conceal nodes at the top and bottom of code blocks.
		conceal_delimiters = false,
		-- Turn on / off language heading related rendering.
		language = true,
		-- Determines where language icon is rendered.
		-- | center | center of code block |
		-- | right  | right of code block  |
		-- | left   | left of code block   |
		position = "left",
		-- Whether to include the language icon above code blocks.
		language_icon = true,
		-- Whether to include the language name above code blocks.
		language_name = true,
		-- Whether to include the language info above code blocks.
		language_info = true,
		-- Amount of padding to add around the language.
		-- If a float < 1 is provided it is treated as a percentage of available window space.
		language_pad = 0,
		-- A list of language names for which rendering will be disabled.
		disable = {},
		-- A list of language names for which background highlighting will be disabled.
		-- Likely because that language has background highlights itself.
		-- Use a boolean to make behavior apply to all languages.
		-- Borders above & below blocks will continue to be rendered.
		disable_background = { "diff" },
		-- Number of lines from start/end to skip rendering background.
		background_inset = 1,
		-- Width of the code block background.
		-- | block | width of the code block  |
		-- | full  | full width of the window |
		width = "full",
		-- Amount of margin to add to the left of code blocks.
		-- If a float < 1 is provided it is treated as a percentage of available window space.
		-- Margin available space is computed after accounting for padding.
		left_margin = 0,
		-- Amount of padding to add to the left of code blocks.
		-- If a float < 1 is provided it is treated as a percentage of available window space.
		left_pad = 0,
		-- Amount of padding to add to the right of code blocks when width is 'block'.
		-- If a float < 1 is provided it is treated as a percentage of available window space.
		right_pad = 0,
		-- Minimum width to use for code blocks when width is 'block'.
		min_width = 0,
		-- Determines how the top / bottom of code block are rendered.
		-- | none  | do not render a border                               |
		-- | thick | use the same highlight as the code body              |
		-- | thin  | when lines are empty overlay the above & below icons |
		-- | hide  | conceal lines unless language name or icon is added  |
		border = "hide",
		-- Used above code blocks to fill remaining space around language.
		language_border = "█",
		-- Added to the left of language.
		language_left = "",
		-- Added to the right of language.
		language_right = "",
		-- Used above code blocks for thin border.
		above = "▄",
		-- Used below code blocks for thin border.
		below = "▀",
		-- Turn on / off inline code related rendering.
		inline = true,
		-- Icon to add to the left of inline code.
		inline_left = "",
		-- Icon to add to the right of inline code.
		inline_right = "",
		-- Padding to add to the left & right of inline code.
		inline_pad = 0,
		-- Priority to assign to code background highlight.
		priority = 140,
		-- Highlight for code blocks.
		highlight = "RenderMarkdownCode",
		-- Highlight for code info section, after the language.
		highlight_info = "RenderMarkdownCodeInfo",
		-- Highlight for language, overrides icon provider value.
		highlight_language = nil,
		-- Highlight for border, use false to add no highlight.
		highlight_border = "RenderMarkdownCodeBorder",
		-- Highlight for language, used if icon provider does not have a value.
		highlight_fallback = "RenderMarkdownCodeFallback",
		-- Highlight for inline code.
		highlight_inline = "RenderMarkdownCodeInline",
		-- Highlight for inline code left icon, default to reverse of highlight_inline.
		highlight_inline_left = nil,
		-- Highlight for inline code right icon, default to reverse of highlight_inline.
		highlight_inline_right = nil,
		-- Determines how code blocks & inline code are rendered.
		-- | none     | { enabled = false }                           |
		-- | normal   | { language = false }                          |
		-- | language | { disable_background = true, inline = false } |
		-- | full     | uses all default values                       |
		style = "full",
	},
})
