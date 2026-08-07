require("render-markdown").setup({
    completions = { lsp = { enabled = true } },
    latex = { enabled = false },
    pipe_table = {
        enabled = true,
        preset = "full",
        cell = "padded",
        padding = 1,
    },
    win_options = {
        conceallevel = {
            default = 0,
            rendered = 3,
        },
    },
    heading = {
        enabled = false,
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
    checkbox = {
        enabled = true,
        -- Additional modes to render checkboxes.
        render_modes = false,
        -- Render the bullet point before the checkbox.
        bullet = false,
        -- Padding to add to the left of checkboxes.
        left_pad = 0,
        -- Padding to add to the right of checkboxes.
        right_pad = 1,
        unchecked = {
            -- Replaces '[ ]' of 'task_list_marker_unchecked'.
            icon = "󰄱 ",
            -- Highlight for the unchecked icon.
            highlight = "RenderMarkdownUnchecked",
            -- Highlight for item associated with unchecked checkbox.
            scope_highlight = nil,
        },
        checked = {
            -- Replaces '[x]' of 'task_list_marker_checked'.
            icon = "󰱒 ",
            -- Highlight for the checked icon.
            highlight = "RenderMarkdownChecked",
            -- Highlight for item associated with checked checkbox.
            scope_highlight = nil,
        },
        -- Define custom checkbox states, more involved, not part of the markdown grammar.
        -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks.
        -- The key is for healthcheck and to allow users to change its values, value type below.
        -- | raw             | matched against the raw text of a 'shortcut_link'           |
        -- | rendered        | replaces the 'raw' value when rendering                     |
        -- | highlight       | highlight for the 'rendered' icon                           |
        -- | scope_highlight | optional highlight for item associated with custom checkbox |
        -- stylua: ignore
        custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        },
        -- Priority to assign to scope highlight.
        scope_priority = nil,
    },
})

vim.keymap.set("n", "<leader>t", function()
    local line = vim.api.nvim_get_current_line()

    if line:match("%[ %]") then
        line = line:gsub("%[ %]", "[x]", 1)
    elseif line:match("%[x%]") then
        line = line:gsub("%[x%]", "[ ]", 1)
    end

    vim.api.nvim_set_current_line(line)
end, { desc = "Toggle markdown checkbox" })

-- Keep the normal window-navigation mappings everywhere except inside tables.
-- In a Markdown table, use Ctrl-h/j/k/l to move between cells.
local function is_escaped(line, index)
    local backslashes = 0
    index = index - 1
    while index > 0 and line:sub(index, index) == "\\" do
        backslashes = backslashes + 1
        index = index - 1
    end
    return backslashes % 2 == 1
end

local function table_cells(line)
    if not line:find("|", 1, true) then
        return {}
    end

    local cells = {}
    local start = 1
    for index = 1, #line do
        if line:sub(index, index) == "|" and not is_escaped(line, index) then
            cells[#cells + 1] = { start = start, finish = index - 1 }
            start = index + 1
        end
    end
    cells[#cells + 1] = { start = start, finish = #line }

    -- Ignore the optional leading/trailing pipe delimiters.
    if #cells > 1 and line:sub(cells[1].start, cells[1].finish):match("^%s*$") then
        table.remove(cells, 1)
    end
    if #cells > 1 and line:sub(cells[#cells].start, cells[#cells].finish):match("^%s*$") then
        table.remove(cells)
    end

    return cells
end

local function is_separator_row(line)
    local cells = table_cells(line)
    if #cells == 0 then
        return false
    end

    for _, cell in ipairs(cells) do
        local value = line:sub(cell.start, cell.finish):gsub("^%s*(.-)%s*$", "%1")
        if not value:match("^:?-+:?$") then
            return false
        end
    end
    return true
end

local function get_table_context(bufnr, current_line)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    if not lines[current_line]:find("|", 1, true) then
        return nil
    end

    local first = current_line
    while first > 1 and lines[first - 1]:find("|", 1, true) do
        first = first - 1
    end

    local last = current_line
    while last < #lines and lines[last + 1]:find("|", 1, true) do
        last = last + 1
    end

    local has_separator = false
    for line_number = first, last do
        has_separator = has_separator or is_separator_row(lines[line_number])
    end
    if not has_separator then
        return nil
    end

    local rows = {}
    local current
    for line_number = first, last do
        local separator = is_separator_row(lines[line_number])
        if not separator then
            local row = { line = line_number, cells = table_cells(lines[line_number]) }
            rows[#rows + 1] = row
            if line_number == current_line then
                current = #rows
            end
        end
    end

    return {
        lines = lines,
        rows = rows,
        current = current,
        separator = is_separator_row(lines[current_line]),
    }
end

local function cell_index(row, column)
    for index, cell in ipairs(row.cells) do
        if column >= cell.start and column <= cell.finish then
            return index
        end
        if column < cell.start then
            return index
        end
    end
    return #row.cells
end

local function move_to_cell(row, index, lines)
    local cell = row.cells[math.min(index, #row.cells)]
    if not cell then
        return
    end

    local content = lines[row.line]:sub(cell.start, cell.finish)
    local first_non_space = content:find("%S")
    local column = cell.start - 1 + (first_non_space and first_non_space - 1 or 0)
    vim.api.nvim_win_set_cursor(0, { row.line, column })
end

local function move_in_table(direction)
    local bufnr = vim.api.nvim_get_current_buf()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local context = get_table_context(bufnr, current_line)
    if not context or context.separator then
        return
    end

    local row = context.rows[context.current]
    local current_cell = cell_index(row, vim.fn.col("."))
    local target_row = context.current
    local target_cell = current_cell

    if direction == "h" then
        target_cell = current_cell - 1
    elseif direction == "l" then
        if current_cell < #row.cells then
            target_cell = current_cell + 1
        else
            target_row = context.current + 1
            target_cell = 1
        end
    elseif direction == "j" then
        target_row = context.current + 1
    elseif direction == "k" then
        target_row = context.current - 1
    end

    local destination = context.rows[target_row]
    if not destination then
        return
    end
    move_to_cell(destination, math.min(target_cell, #destination.cells), context.lines)
end

local table_navigation_directions = { "h", "j", "k", "l" }
local function update_table_navigation(bufnr)
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local context = get_table_context(bufnr, current_line)
    local enabled = context and not context.separator

    for _, direction in ipairs(table_navigation_directions) do
        local key = "<C-" .. direction .. ">"
        if enabled then
            vim.keymap.set({ "n", "i" }, key, function()
                move_in_table(direction)
            end, { buffer = bufnr, desc = "Markdown table: move " .. direction })
        else
            pcall(vim.keymap.del, "n", key, { buffer = bufnr })
            pcall(vim.keymap.del, "i", key, { buffer = bufnr })
        end
    end
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "CursorMoved", "CursorMovedI", "InsertEnter" }, {
    group = vim.api.nvim_create_augroup("markdown-table-navigation", { clear = true }),
    pattern = "*",
    callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
            update_table_navigation(event.buf)
            return
        end

        for _, direction in ipairs(table_navigation_directions) do
            local key = "<C-" .. direction .. ">"
            pcall(vim.keymap.del, "n", key, { buffer = event.buf })
            pcall(vim.keymap.del, "i", key, { buffer = event.buf })
        end
    end,
})
