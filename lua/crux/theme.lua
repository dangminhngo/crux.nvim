local color = require("crux.color")
local config = require("crux.config")
local palette = require("crux.palette")

local _theme = {}

function _theme.groups(p, opts)
  return {
    core = {
      --- VIM
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ColorColumn = { bg = p.bg0 }, -- used for the columns set with 'colorcolumn'
      Conceal = { fg = p.bg4 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
      Cursor = { fg = p.bg, bg = p.fg }, -- character under the cursor
      lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
      CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
      CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorLine = { bg = p.bg2 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
      Directory = { fg = p.syntax.func }, -- directory names (and other special names in listings)
      DiffAdd = { fg = p.diff.add, bg = p.bg0 }, -- diff mode: Added line |diff.txt|
      DiffChange = { fg = p.diff.change, bg = p.bg0 }, -- diff mode: Changed line |diff.txt|
      DiffDelete = { fg = p.diff.delete, bg = p.bg0 }, -- diff mode: Deleted line |diff.txt|
      DiffText = { fg = p.diff.text, bg = p.bg0 }, -- diff mode: Changed text within a changed line |diff.txt|
      EndOfBuffer = { fg = p.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
      -- TermCursor      = {}, -- cursor in a focused terminal
      -- TermCursorNC    = {}, -- cursor in an unfocused terminal
      ErrorMsg = { fg = p.diag.error }, -- error messages on the command line
      VertSplit = { fg = p.bg4 }, -- the column separating vertically split windows
      Folded = { fg = p.fg3, bg = p.bg2 }, -- line used for closed folds
      FoldColumn = { fg = p.fg3 }, -- 'foldcolumn'
      SignColumn = { fg = p.fg3 }, -- column where |signs| are displayed
      SignColumnSB = { link = "SignColumn" }, -- column where |signs| are displayed
      Substitute = { fg = p.bg, bg = p.diag.error }, -- |:substitute| replacement text highlighting
      LineNr = { fg = p.black }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      CursorLineNr = { fg = p.accent, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      MatchParen = { fg = p.diag.warn, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      ModeMsg = { fg = p.diag.warn, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
      MsgArea = { fg = p.fg2 }, -- Area for messages and cmdline
      -- MsgSeparator    = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
      MoreMsg = { fg = p.diag.info, bold = true }, -- |more-prompt|
      NonText = { fg = p.bg4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
      Normal = { fg = p.fg, bg = opts.transparent and p.none or p.bg }, -- normal text
      NormalNC = { fg = p.fg, bg = opts.transparent and p.none or p.bg }, -- normal text in non-current windows
      NormalFloat = { fg = p.fg, bg = p.bg0 }, -- Normal text in floating windows.
      FloatBorder = { fg = p.fg3 }, -- TODO
      Pmenu = { fg = p.fg2, bg = p.bg3 }, -- Popup menu: normal item.
      PmenuSel = { fg = p.bg, bg = p.accent }, -- Popup menu: selected item.
      PmenuSbar = { link = "Pmenu" }, -- Popup menu: scrollbar.
      PmenuThumb = { bg = p.accent }, -- Popup menu: Thumb of the scrollbar.
      Question = { link = "MoreMsg" }, -- |hit-enter| prompt and yes/no questions
      QuickFixLine = { link = "CursorLine" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      Search = { fg = p.bg2, bg = p.blue }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      IncSearch = { fg = p.fg, bg = p.diag.hint }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
      SpellBad = { sp = p.diag.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellCap = { sp = p.diag.warn, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellLocal = { sp = p.diag.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
      SpellRare = { sp = p.diag.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
      StatusLine = { fg = p.fg2, bg = p.bg0 }, -- status line of current window
      StatusLineNC = { fg = p.fg3, bg = p.bg0 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
      TabLine = { fg = p.fg3, bg = p.bg2 }, -- tab pages line, not active tab page label
      TabLineFill = { bg = p.bg0 }, -- tab pages line, where there are no labels
      TabLineSel = { fg = p.fg0, bg = p.bg }, -- tab pages line, active tab page label
      Title = { fg = p.syntax.func }, -- titles for output from ":set all", ":autocmd" etp.
      Visual = { bg = p.bg4 }, -- Visual mode selection
      VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
      WarningMsg = { fg = p.diag.warn }, -- warning messages
      Whitespace = { fg = p.bg2 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
      WildMenu = { link = "Pmenu" }, -- current match in 'wildmenu' completion

      --- NEOVIM
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      healthError = { fg = p.diag.error },
      healthSuccess = { fg = p.accent },
      healthWarning = { fg = p.diag.warn },

      --- SYNTAX
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      -- These groups are not listed as default vim groups,
      -- but they are defacto standard group names for syntax highlighting.
      -- commented out groups should chain up to their "preferred" group by
      -- default,
      -- Uncomment and edit if you want more specific syntax highlighting.
      Comment = { fg = p.syntax.comment, style = opts.styles.comments }, -- any comment
      Constant = { fg = p.syntax.constant }, -- (preferred) any constant
      String = { fg = p.syntax.string, style = opts.styles.strings }, -- a string constant: "this is a string"
      Character = { link = "String" }, -- a character constant: 'c', '\n'
      Number = { fg = p.syntax.number, style = opts.styles.numbers }, -- a number constant: 234, 0xff
      Float = { link = "Number" }, -- a floating point constant: 2.3e10
      Boolean = { fg = p.syntax.boolean, style = opts.styles.booleans }, -- a boolean constant: TRUE, false

      Identifier = { fg = p.syntax.identifier, style = opts.styles.variables }, -- (preferred) any variable name
      Function = { fg = p.syntax.func, style = opts.styles.functions }, -- function name (also: methods for classes)

      Statement = { fg = p.syntax.keyword, style = opts.styles.keywords }, -- (preferred) any statement
      Conditional = { fg = p.syntax.conditional }, -- if, then, else, endif, switch, etc.
      Repeat = { link = "Conditional" }, -- for, do, while, etc.
      Label = { link = "Conditional" }, -- case, default, etc.

      Operator = { fg = p.syntax.operator }, -- "sizeof", "+", "*", etc.
      Keyword = { fg = p.syntax.keyword, style = opts.styles.keywords }, -- any other keyword
      Exception = { link = "Keyword" }, -- try, catch, throw

      PreProc = { fg = p.syntax.preproc }, -- (preferred) generic Preprocessor
      Include = { link = "PreProc" }, -- preprocessor #include
      Define = { link = "PreProc" }, -- preprocessor #define
      Macro = { link = "PreProc" }, -- same as Define
      PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

      Type = { fg = p.syntax.type, style = opts.styles.types }, -- (preferred) int, long, char, etc.
      StorageClass = { link = "Type" }, -- static, register, volatile, etc.
      Structure = { link = "Type" }, -- struct, union, enum, etc.
      Typedef = { link = "Type" }, -- A typedef

      Special = { fg = p.syntax.func }, -- (preferred) any special symbol
      SpecialChar = { link = "Special" }, -- special character in a constant
      Tag = { link = "Special" }, -- you can use CTRL-] on this
      Delimiter = { fg = p.syntax.delimiter }, -- character that needs attention
      SpecialComment = { link = "Special" }, -- special things inside a comment
      Debug = { link = "Special" }, -- debugging statements

      Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
      Bold = { bold = true },
      Italic = { italic = true },

      -- ("Ignore", below, may be invisible...)
      -- Ignore         = {}, -- (preferred) left blank, hidden  |hl-Ignore|

      Error = { fg = p.diag.error }, -- (preferred) any erroneous construct
      Todo = { fg = p.bg, bg = p.diag.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

      qfLineNr = { link = "lineNr" },
      qfFileName = { link = "Directory" },

      htmlH1 = { fg = p.magenta, bold = true },
      htmlH2 = { fg = p.blue, bold = true },

      -- mkdHeading            = {},
      -- mkdCode               = {},
      mkdCodeDelimiter = { fg = p.fg, bg = p.black },
      mkdCodeStart = { fg = p.teal, bold = true },
      mkdCodeEnd = { fg = p.teal, bold = true },
      -- mkdLink               = {},

      markdownHeadingDelimiter = { fg = p.orange, bold = true },
      markdownCode = { fg = p.teal },
      markdownCodeBlock = { fg = p.teal },
      markdownH1 = { fg = p.magenta, bold = true },
      markdownH2 = { fg = p.blue, bold = true },
      markdownLinkText = { fg = p.blue, underline = true },

      ["helpCommand"] = { bg = p.bg0, fg = p.blue },

      debugPC = { bg = p.bg0 }, -- used for highlighting the current line in terminal-debug
      debugBreakpoint = { bg = p.bg3, fg = p.blue }, -- used for breakpoint colors in terminal-debug

      --- DIAGNOSTICS
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      DiagnosticError = { fg = p.diag.error },
      DiagnosticWarn = { fg = p.diag.warn },
      DiagnosticInfo = { fg = p.diag.info },
      DiagnosticHint = { fg = p.diag.hint },

      DiagnosticSignError = { link = "DiagnosticError" },
      DiagnosticSignWarn = { link = "DiagnosticWarn" },
      DiagnosticSignInfo = { link = "DiagnosticInfo" },
      DiagnosticSignHint = { link = "DiagnosticHint" },

      DiagnosticVirtualTextError = opts.diagnostic.background and { fg = p.bg, bg = p.diag.error }
        or { fg = p.diag.error, bg = color.rel_darken(p.diag.error, 0.8) },
      DiagnosticVirtualTextWarn = opts.diagnostic.background and { fg = p.bg, bg = p.diag.warn }
        or { fg = p.diag.warn, bg = color.rel_darken(p.diag.warn, 0.8) },
      DiagnosticVirtualTextInfo = opts.diagnostic.background and { fg = p.bg, bg = p.diag.info }
        or { fg = p.diag.info, bg = color.rel_darken(p.diag.info, 0.8) },
      DiagnosticVirtualTextHint = opts.diagnostic.background and { fg = p.bg, bg = p.diag.hint }
        or { fg = p.diag.hint, bg = color.rel_darken(p.diag.hint, 0.8) },

      DiagnosticUnderlineError = { undercurl = true, sp = p.diag.error },
      DiagnosticUnderlineWarn = { undercurl = true, sp = p.diag.warn },
      DiagnosticUnderlineInfo = { undercurl = true, sp = p.diag.info },
      DiagnosticUnderlineHint = { undercurl = true, sp = p.diag.hint },

      --- LSP
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      -- These groups are for the native LSP client. Some other LSP clients may
      -- use these groups, or use their own. Consult your LSP client's
      -- documentation.
      LspReferenceText = { bg = p.bg3 }, -- used for highlighting "text" references
      LspReferenceRead = { bg = p.bg3 }, -- used for highlighting "read" references
      LspReferenceWrite = { bg = p.bg4 }, -- used for highlighting "write" references

      LspSignatureActiveParameter = { fg = p.bg, bg = p.syntax.param },
      LspCodeLens = { fg = p.syntax.comment },

      LspInfoBorder = { fg = p.diag.info, bg = p.bg0 },

      ALEErrorSign = { fg = p.diag.error },
      ALEWarningSign = { fg = p.diag.warn },

      --- TREESITTER
      -- https://github.com/nvim-treesitter/nvim-treesitter
      -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ["@annotation"] = { link = "PreProc" }, -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
      ["@attribute"] = { fg = p.syntax.attribute, style = opts.styles.attributes }, -- HTML/JSX attributes
      ["@boolean"] = { link = "Boolean" }, -- Boolean literals: `True` and `False` in Python.
      ["@character"] = { link = "Character" }, -- Character literals: `'a'` in C.
      ["@character.special"] = { link = "SpecialChar" }, -- Special characters
      ["@comment"] = { link = "Comment" }, -- Line comments and block comments.
      ["@conditional"] = { link = "Conditional" }, -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
      ["@constant"] = { link = "Constant" }, -- Constants identifiers. These might not be semantically constant.  E.g. uppercase variables in Python.
      ["@constant.builtin"] = { fg = p.syntax.builtin2, style = opts.styles.constants }, -- Built-in constant values: `nil` in Lua.
      ["@constant.macro"] = { link = "Define" }, -- Constants defined by macros: `NULL` in C.
      ["@constructor"] = { fg = p.syntax.constantructor }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
      ["@debug"] = { link = "Debug" }, -- For keyword like `debugger`
      ["@define"] = { link = "Define" }, -- For `#define` in C/C++
      ["@error"] = { link = "Error" }, -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
      ["@exception"] = { link = "Exception" }, -- Exception related keywords: `try`, `except`, `finally` in Python.
      ["@field"] = { fg = p.syntax.field }, -- Object and struct fields.
      ["@float"] = { link = "Float" }, -- Floating-point number literals.
      ["@function"] = { link = "Function" }, -- Function definitions.
      ["@function.call"] = { link = "Function" }, -- Function calls
      ["@function.builtin"] = { fg = p.syntax.builtin0, style = opts.styles.functions }, -- Built-in functions: `print` in Lua.
      ["@function.macro"] = { fg = p.syntax.builtin0, style = opts.styles.functions }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
      ["@include"] = { link = "Include" }, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
      ["@keyword"] = { link = "Keyword" }, -- Keywords that don't fit into other categories.
      ["@keyword.function"] = { fg = p.syntax.keyword, style = opts.styles.functions }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
      ["@keyword.operator"] = { link = "Operator" }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
      ["@keyword.return"] = { fg = p.syntax.builtin0, style = opts.styles.keywords }, -- Keywords like `return` and `yield`.
      ["@label"] = { link = "Label" }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
      ["@method"] = { link = "Function" }, -- Method definitions.
      ["@method.call"] = { link = "Function" }, -- Method calls
      ["@namespace"] = { fg = p.syntax.builtin1 }, -- Identifiers referring to modules and namespaces.
      ["@none"] = { fg = p.fg2 }, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
      ["@number"] = { link = "Number" }, -- Numeric literals that don't fit into other categories.
      ["@operator"] = { link = "Operator" }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
      ["@parameter"] = { fg = p.syntax.param, style = opts.styles.parameters }, -- Parameters of a function.
      ["@parameter.reference"] = { link = "@parameter" }, -- References to parameters of a function.
      ["@preproc"] = { link = "PreProc" }, -- Preprocessors
      ["@property"] = { link = "@field" }, -- Same as `@field`.
      ["@punctuation.delimiter"] = { fg = p.syntax.punctuation }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
      ["@punctuation.bracket"] = { link = "@punctuation.delimiter" }, -- Brackets, braces, parentheses, etc.
      ["@punctuation.special"] = { link = "@punctuation.delimiter" }, --  punctuation that doesn't fit into the previous categories.
      ["@repeat"] = { link = "Repeat" }, -- Keywords related to loops: `for`, `while`, etc.
      ["@storageclass"] = { link = "StorageClass" }, -- Same as 'StorageClass'
      ["@string"] = { link = "String" }, -- String literals.
      ["@string.regex"] = { fg = p.syntax.regex }, -- Regular expression literals.
      ["@string.escape"] = { link = "Operator" }, -- Escape characters within a string: `\n`, `\t`, etc.
      ["@string.special"] = { link = "Operator" }, -- Strings with special meaning that don't fit into the previous categories.
      ["@symbol"] = { link = "Identifier" }, -- Strings with special meaning that don't fit into the previous categories.
      ["@tag"] = { link = "Label" }, -- Tags like HTML tag names.
      ["@tag.attribute"] = { link = "@attribute" }, -- HTML tag attributes.
      ["@tag.delimiter"] = { link = "Delimiter" }, -- Tag delimiters like `<` `>` `/`.
      ["@text"] = { fg = p.syntax.variable }, -- Non-structured text. Like text in a markup language.
      ["@text.strong"] = { fg = p.syntax.variable, bold = true }, -- Text to be represented in bold.
      ["@text.emphasis"] = { fg = p.syntax.variable, italic = true }, -- Text to be represented with emphasis.
      ["@text.underline"] = { fg = p.syntax.variable, underline = true }, -- Text to be represented with an underline.
      ["@text.strike"] = { fg = p.syntax.variable, strikethrough = true }, -- Strikethrough text.
      ["@text.title"] = { link = "Title" }, -- Text that is part of a title.
      ["@text.literal"] = { link = "String" }, -- Literal or verbatim text.
      ["@text.uri"] = { link = "Underlined" }, -- URIs like hyperlinks or email addresses.
      ["@text.math"] = { link = "Special" }, -- Math environments like LaTeX's `$ ... $`
      ["@text.reference"] = { link = "Constant" }, -- Footnotes, text references, citations, etc.
      ["@text.environment"] = { link = "Macro" }, -- Text environments of markup languages.
      ["@text.environment.name"] = { link = "Type" }, -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
      ["@text.note"] = { link = "SpecialComment" }, -- Text representation of an informational note.
      ["@text.warning"] = { link = "Todo" }, -- Text representation of a warning note.
      ["@text.danger"] = { link = "Error" }, -- Text representation of a danger note.
      ["@todo"] = { link = "Todo" }, -- Same as `Todo`
      ["@type"] = { link = "Type" }, -- Type (and class) definitions and annotations.
      ["@type.builtin"] = { fg = p.syntax.builtin1, style = opts.styles.types }, -- Built-in types: `i32` in Rust.
      ["@type.qualifier"] = { link = "Indentifier" }, -- Type but what is qualifier?
      ["@type.definition"] = { link = "Type" }, -- Type (and class) definitions
      ["@variable"] = { fg = p.syntax.variable, style = opts.styles.variables }, -- Variable names that don't fit into other categories.
      ["@variable.builtin"] = { fg = p.syntax.builtin0, style = opts.styles.variables }, -- Variable names defined by the language: `this` or `self` in Javascript.
      ["@field.rust"] = { fg = p.fg2 }, -- Object fields in Rust
      ["@tag.javascript"] = { fg = p.syntax.builtin0 }, -- JSX tag opening/closing element
      ["@tag.typescript"] = { fg = p.syntax.builtin0 }, -- TSX tag opening/closing element

      -- LSP Semantic Token Groups
      ["@lsp.type.comment"] = { link = "@comment" },
      ["@lsp.type.enum"] = { link = "@type" },
      ["@lsp.type.enumMember"] = { link = "@constant" },
      ["@lsp.type.interface"] = { link = "@type" },
      ["@lsp.type.keyword"] = { link = "@keyword" },
      ["@lsp.type.namespace"] = { link = "@namespace" },
      ["@lsp.type.parameter"] = { link = "@parameter" },
      ["@lsp.type.property"] = { link = "@property" },
      ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
      ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.operator.injected"] = { link = "@operator" },
      ["@lsp.typemod.string.injected"] = { link = "@string" },
      ["@lsp.typemod.type.defaultLibrary"] = { fg = p.syntax.builtin1 },
      ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
      ["@lsp.typemod.variable.injected"] = { link = "@variable" },
      -- NOTE: maybe add these with distinct highlights?
      -- ["@lsp.typemod.variable.globalScope"] (global variables)
    },
    plugins = {
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/goolord/alpha-nvim
      alpha = {
        AlphaShortcut = { fg = p.blue },
        AlphaHeader = { fg = p.accent },
        AlphaHeaderLabel = { fg = p.orange },
        AlphaFooter = { fg = p.magenta, italic = true },
        AlphaButtons = { fg = p.fg },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/romgrk/barbar.nvim
      barbar = {
        BufferCurrent = { bg = p.bg0, fg = p.fg },
        BufferCurrentERROR = { bg = p.bg0, fg = p.diag.error },
        BufferCurrentHINT = { bg = p.bg0, fg = p.diag.hint },
        -- BufferCurrentIcon = { bg = p.bg0, fg = c.},
        BufferCurrentINFO = { bg = p.bg0, fg = p.diag.info },
        BufferCurrentWARN = { bg = p.bg0, fg = p.diag.warn },
        BufferCurrentIndex = { bg = p.bg0, fg = p.diag.info },
        BufferCurrentMod = { bg = p.bg0, fg = p.diag.warn },
        BufferCurrentSign = { bg = p.bg0, fg = p.diag.info },
        BufferCurrentTarget = { bg = p.bg0, fg = p.red },
        BufferAlternate = { bg = p.bg0, fg = p.fg },
        BufferAlternateERROR = { bg = p.bg0, fg = p.diag.error },
        BufferAlternateHINT = { bg = p.bg0, fg = p.diag.hint },
        -- BufferAlternateIcon = { bg = p.bg0, fg = c. },
        BufferAlternateIndex = { bg = p.bg0, fg = p.diag.info },
        BufferAlternateINFO = { bg = p.bg0, fg = p.diag.info },
        BufferAlternateMod = { bg = p.bg0, fg = p.diag.warn },
        BufferAlternateSign = { bg = p.bg0, fg = p.diag.info },
        BufferAlternateTarget = { bg = p.bg0, fg = p.red },
        BufferAlternateWARN = { bg = p.bg0, fg = p.diag.warn },
        BufferVisible = { bg = p.dark, fg = p.fg },
        BufferVisibleERROR = { bg = p.dark, fg = p.diag.error },
        BufferVisibleHINT = { bg = p.dark, fg = p.diag.hint },
        -- BufferVisibleIcon = { bg = p.dark, fg = c. },
        BufferVisibleINFO = { bg = p.dark, fg = p.diag.info },
        BufferVisibleWARN = { bg = p.dark, fg = p.diag.warn },
        BufferVisibleIndex = { bg = p.dark, fg = p.diag.info },
        BufferVisibleMod = { bg = p.dark, fg = p.diag.warn },
        BufferVisibleSign = { bg = p.dark, fg = p.diag.info },
        BufferVisibleTarget = { bg = p.dark, fg = p.red },
        BufferInactive = { bg = p.dark, fg = p.bg4 },
        BufferInactiveERROR = { bg = p.dark, fg = color.rel_darken(p.diag.error, 0.32) },
        BufferInactiveHINT = { bg = p.dark, fg = color.rel_darken(p.diag.hint, 0.32) },
        -- BufferInactiveIcon = { bg = p.dark, fg = util.pywal_darken(c., 0.7) },
        BufferInactiveINFO = { bg = p.dark, fg = color.rel_darken(p.diag.info, 0.32) },
        BufferInactiveWARN = { bg = p.dark, fg = color.rel_darken(p.diag.warn, 0.32) },
        BufferInactiveIndex = { bg = p.dark, fg = p.bg4 },
        BufferInactiveMod = { bg = p.dark, fg = color.rel_darken(p.diag.warn, 0.32) },
        BufferInactiveSign = { bg = p.dark, fg = p.fg3 },
        BufferInactiveTarget = { bg = p.dark, fg = p.red },
        BufferOffset = { bg = p.dark, fg = p.bg4 },
        BufferTabpageFill = { bg = p.dark, fg = p.bg4 },
        BufferTabpages = { bg = p.dark, fg = p.none },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/akinsho/bufferline.nvim
      bufferline = {
        BufferLineFill = { bg = p.dark },
        BufferLineBackground = { fg = p.syntax.comment, bg = p.bg0 },
        BufferLineBufferVisible = { fg = p.fg3, bg = p.bg0 },
        BufferLineBufferSelected = { fg = p.fg0, bg = p.bg },
        BufferLineTab = { fg = p.bg3, bg = p.bg0 },
        BufferLineTabSelected = { fg = p.bg0, bg = p.bg },
        BufferLineTabClose = { fg = p.diag.error, bg = p.bg0 },
        BufferLineIndicatorSelected = { fg = p.bg, bg = p.bg },
        BufferLineSeparator = { fg = p.bg4, bg = p.bg0 },
        BufferLineSeparatorVisible = { fg = p.bg4, bg = p.bg0 },
        BufferLineSeparatorSelected = { fg = p.bg4, bg = p.bg },
        BufferLineCloseButton = { fg = p.diag.error, bg = p.bg0 },
        BufferLineCloseButtonVisible = { fg = p.diag.error, bg = p.bg0 },
        BufferLineCloseButtonSelected = { fg = p.diag.error, bg = p.bg },
        BufferLineModified = { fg = p.diag.hint, bg = p.bg0 },
        BufferLineModifiedVisible = { fg = p.diag.hint, bg = p.bg0 },
        BufferLineModifiedSelected = { fg = p.diag.hint, bg = p.bg },
        BufferLineError = { fg = p.diag.error, bg = p.bg0 },
        BufferLineErrorDiagnostic = { fg = p.diag.error, bg = p.bg0 },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/glepnir/dashboard-nvim
      dashboard = {
        DashboardShortCut = { link = "Keyword" },
        DashboardHeader = { fg = p.accent },
        DashboardCenter = { fg = p.syntax.func },
        DashboardFooter = { fg = p.syntax.constant, italic = true },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- Diff
      diff = {
        diffAdded = { fg = p.diff.add },
        diffRemoved = { fg = p.diff.delete },
        diffChanged = { fg = p.diff.change },
        diffOldFile = { fg = p.yellow },
        diffNewFile = { fg = p.orange },
        diffFile = { fg = p.blue },
        diffLine = { fg = p.comment },
        diffIndexLine = { fg = p.magenta },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/lewis6991/gitsigns.nvim
      gitsigns = {
        GitSignsAdd = { fg = p.git.added }, -- diff mode: Added line |diff.txt|
        GitSignsChange = { fg = p.git.changed }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = { fg = p.git.removed }, -- diff mode: Deleted line |diff.txt|
      },

      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/phaazon/hop.nvim
      hop = {
        HopNextKey = { fg = p.teal, bold = true },
        HopNextKey1 = { fg = p.blue, bold = true },
        HopNextKey2 = { fg = color.rel_darken(p.blue, 0.16) },
        HopUnmatched = { fg = p.fg3 },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/lukas-reineke/indent-blankline.nvim
      indent_blankline = {
        IndentBlanklineChar = { fg = p.bg2, nocombine = true },
        IndentBlanklineContextChar = { fg = p.accent, nocombine = true },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/folke/lazy.nvim
      lazy = {
        LazyProgressDone = { bold = true, fg = p.accent },
        LazyProgressTodo = { bold = true, fg = p.fg2 },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/ggandor/leap.nvim
      leap = {
        LeapMatch = { bg = p.blue, fg = p.bg, bold = true },
        LeapLabelPrimary = { fg = p.blue, bold = true },
        LeapLabelSecondary = { fg = p.green, bold = true },
        LeapBackdrop = { fg = p.bg4 },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/glepnir/lspsaga.nvim
      lspsaga = {
        LspFloatWinNormal = { bg = p.bg0 },
        LspFloatWinBorder = { fg = p.fg3 },
        LspSagaBorderTitle = { link = "Title" },
        LspSagaHoverBorder = { fg = p.fg3 },
        LspSagaRenameBorder = { fg = p.fg3 },
        LspSagaDefPreviewBorder = { fg = p.fg3 },
        LspSagaCodeActionBorder = { fg = p.fg3 },
        LspSagaFinderSelection = { fg = p.blue },
        LspSagaCodeActionTitle = { link = "Title" },
        LspSagaCodeActionContent = { link = "String" },
        LspSagaSignatureHelpBorder = { fg = p.diag.error },
        ReferencesCount = { fg = p.magenta },
        DefinitionCount = { fg = p.magenta },
        DefinitionIcon = { fg = p.blue },
        ReferencesIcon = { fg = p.blue },
        TargetWord = { fg = p.pink },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/echasnovski/mini.nvim
      mini = {
        MiniCompletionActiveParameter = { underline = true },

        MiniCursorword = { bg = p.bg2 },
        MiniCursorwordCurrent = { bg = p.bg3 },

        MiniIndentscopeSymbol = { fg = p.accent },
        MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

        MiniJump = { bg = p.blue, fg = p.fg },

        MiniJump2dSpot = { fg = p.blue, bold = true, nocombine = true },

        MiniStarterCurrent = { nocombine = true },
        MiniStarterFooter = { fg = p.magenta, italic = true },
        MiniStarterHeader = { fg = p.accent },
        MiniStarterInactive = { fg = p.syntax.comment, style = opts.styles.comments },
        MiniStarterItem = { fg = p.fg, bg = opts.transparent and p.none or p.bg },
        MiniStarterItemBullet = { fg = p.bg4 },
        MiniStarterItemPrefix = { fg = p.yellow },
        MiniStarterSection = { fg = p.blue },
        MiniStarterQuery = { fg = p.teal },

        MiniStatuslineDevinfo = { fg = p.fg3, bg = p.blue },
        MiniStatuslineFileinfo = { fg = p.fg3, bg = p.blue },
        MiniStatuslineFilename = { fg = p.fg3, bg = p.bg4 },
        MiniStatuslineInactive = { fg = p.blue, bg = p.dark },
        MiniStatuslineModeCommand = { fg = p.black, bg = p.yellow, bold = true },
        MiniStatuslineModeInsert = { fg = p.black, bg = p.green, bold = true },
        MiniStatuslineModeNormal = { fg = p.black, bg = p.blue, bold = true },
        MiniStatuslineModeOther = { fg = p.black, bg = p.teal, bold = true },
        MiniStatuslineModeReplace = { fg = p.black, bg = p.red, bold = true },
        MiniStatuslineModeVisual = { fg = p.black, bg = p.magenta, bold = true },

        MiniSurround = { bg = p.orange, fg = p.black },

        MiniTablineCurrent = { fg = p.fg, bg = p.bg4 },
        MiniTablineFill = { bg = p.black },
        MiniTablineHidden = { fg = p.syntax.comment, bg = p.dark },
        MiniTablineModifiedCurrent = { fg = p.diag.warn, bg = p.bg4 },
        MiniTablineModifiedHidden = { bg = p.dark, fg = color.rel_darken(p.diag.warn, 0.16) },
        MiniTablineModifiedVisible = { fg = p.diag.warn, bg = p.dark },
        MiniTablineTabpagesection = { bg = p.dark, fg = p.none },
        MiniTablineVisible = { fg = p.fg, bg = p.dark },

        MiniTestEmphasis = { bold = true },
        MiniTestFail = { fg = p.red, bold = true },
        MiniTestPass = { fg = p.green, bold = true },

        MiniTrailspace = { bg = p.red },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/nvim-neo-tree/neo-tree.lua
      neo_tree = {
        NeoTreeExpander = { fg = p.black },
        NeoTreeNormal = { fg = p.fg2, bg = opts.transparent and "NONE" or p.bg0 },
        NeoTreeNormalNC = { fg = p.fg2, bg = opts.transparent and "NONE" or p.bg0 },
        NeoTreeVertSplit = { link = "VertSplit" },
        NeoTreeIndentMarker = { fg = p.bg4 },
        NeoTreeTitleBar = { fg = p.bg, bg = p.accent },

        NeoTreeDimText = { fg = p.fg3 },
        NeoTreeRootName = { fg = p.accent, bold = true },
        NeoTreeDirectoryName = { fg = p.fg2 },
        NeoTreeDirectoryIcon = { fg = p.accent },
        NeoTreeFileName = { fg = p.fg },
        NeoTreeFileNameOpened = { fg = p.accent },
        NeoTreeFloatBorder = { fg = p.accent },
        NeoTreeFloatTitle = { fg = p.accent },

        NeoTreeGitAdded = { fg = p.git.added },
        NeoTreeGitConflict = { fg = p.git.conflict },
        NeoTreeGitDeleted = { fg = p.git.removed },
        NeoTreeGitIgnored = { fg = p.git.ignored },
        NeoTreeGitModified = { fg = p.cyan },
        NeoTreeGitUnstaged = { fg = p.teal },
        NeoTreeGitUntracked = { fg = p.magenta },
        NeoTreeGitStaged = { fg = p.accent },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/hrsh7th/nvim-cmp
      nvim_cmp = {
        CmpDocumentation = { fg = p.fg, bg = p.bg0 },
        CmpDocumentationBorder = { fg = p.bg2, bg = p.bg0 },

        CmpItemAbbr = { fg = p.fg },
        CmpItemAbbrDeprecated = { fg = p.syntax.deprecated, strikethrough = true },
        CmpItemAbbrMatch = { fg = p.accent },
        CmpItemAbbrMatchFuzzy = { fg = p.accent },

        CmpItemKindDefault = { fg = p.fg3 },
        CmpItemMenu = { link = "Comment" },

        CmpItemKindVariable = { link = "TSVariable" },
        CmpItemKindConstant = { link = "TSConstant" },
        CmpItemKindKeyword = { link = "Keyword" },
        CmpItemKindReference = { link = "Keyword" },
        CmpItemKindValue = { link = "Keyword" },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindMethod = { link = "Function" },
        CmpItemKindConstructor = { link = "Function" },
        CmpItemKindEvent = { link = "Constant" },
        CmpItemKindUnit = { link = "Constant" },
        CmpItemKindInterface = { link = "Type" },
        CmpItemKindClass = { link = "Type" },
        CmpItemKindStruct = { link = "Type" },
        CmpItemKindEnum = { link = "Type" },
        CmpItemKindModule = { link = "TSNamespace" },
        CmpItemKindProperty = { link = "TSProperty" },
        CmpItemKindField = { link = "TSField" },
        CmpItemKindTypeParameter = { link = "TSField" },
        CmpItemKindEnumMember = { link = "TSField" },
        CmpItemKindOperator = { link = "Operator" },
        CmpItemKindSnippet = { fg = p.fg2 },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/SmiteshP/nvim-navic
      nvim_navic = {
        NavicIconsFile = { fg = p.fg, bg = p.none },
        NavicIconsModule = { fg = p.yellow, bg = p.none },
        NavicIconsNamespace = { fg = p.fg, bg = p.none },
        NavicIconsPackage = { fg = p.fg, bg = p.none },
        NavicIconsClass = { fg = p.orange, bg = p.none },
        NavicIconsMethod = { fg = p.blue, bg = p.none },
        NavicIconsProperty = { fg = p.green, bg = p.none },
        NavicIconsField = { fg = p.green, bg = p.none },
        NavicIconsConstructor = { fg = p.orange, bg = p.none },
        NavicIconsEnum = { fg = p.orange, bg = p.none },
        NavicIconsInterface = { fg = p.orange, bg = p.none },
        NavicIconsFunction = { fg = p.blue, bg = p.none },
        NavicIconsVariable = { fg = p.magenta, bg = p.none },
        NavicIconsConstant = { fg = p.magenta, bg = p.none },
        NavicIconsString = { fg = p.green, bg = p.none },
        NavicIconsNumber = { fg = p.orange, bg = p.none },
        NavicIconsBoolean = { fg = p.orange, bg = p.none },
        NavicIconsArray = { fg = p.orange, bg = p.none },
        NavicIconsObject = { fg = p.orange, bg = p.none },
        NavicIconsKey = { fg = p.purple, bg = p.none },
        NavicIconsKeyword = { fg = p.purple, bg = p.none },
        NavicIconsNull = { fg = p.orange, bg = p.none },
        NavicIconsEnumMember = { fg = p.green, bg = p.none },
        NavicIconsStruct = { fg = p.orange, bg = p.none },
        NavicIconsEvent = { fg = p.orange, bg = p.none },
        NavicIconsOperator = { fg = p.fg, bg = p.none },
        NavicIconsTypeParameter = { fg = p.green, bg = p.none },
        NavicText = { fg = p.fg, bg = p.none },
        NavicSeparator = { fg = p.fg, bg = p.none },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/rcarriga/nvim-notify
      nvim_notify = {
        NotifyERRORBorder = { fg = p.diag.error },
        NotifyWARNBorder = { fg = p.diag.warn },
        NotifyINFOBorder = { fg = p.diag.info },
        NotifyDEBUGBorder = { fg = p.diag.hint },
        NotifyTRACEBorder = { fg = p.bg4 },

        NotifyERRORTitle = { fg = p.diag.error },
        NotifyWARNTitle = { fg = p.diag.warn },
        NotifyINFOTitle = { fg = p.diag.info },
        NotifyDEBUGTitle = { fg = p.diag.hint },
        NotifyTRACETitle = { fg = p.syntax.comment },

        NotifyERRORIcon = { link = "NotifyERRORTitle" },
        NotifyWARNIcon = { link = "NotifyWARNTitle" },
        NotifyINFOIcon = { link = "NotifyINFOTitle" },
        NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
        NotifyTRACEIcon = { link = "NotifyTRACETitle" },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/kyazdani42/nvim-tree.lua
      nvim_tree = {
        NvimTreeNormal = { fg = p.fg2, bg = opts.transparent and "NONE" or p.bg0 },
        NvimTreeVertSplit = { link = "VertSplit" },
        NvimTreeIndentMarker = { fg = p.bg2 },

        NvimTreeRootFolder = { fg = p.accent, bold = true },
        NvimTreeFolderName = { fg = p.fg2 },
        NvimTreeFolderIcon = { fg = p.accent },
        NvimTreeOpenedFolderName = { fg = p.accent },
        NvimTreeEmptyFolderName = { fg = p.syntax.deprecated },
        NvimTreeSymlink = { fg = p.magenta },
        NvimTreeSpecialFile = { fg = p.blue },
        NvimTreeImageFile = { fg = p.white },
        NvimTreeOpenedFile = { fg = p.white },

        NvimTreeGitNew = { fg = p.git.added },
        NvimTreeGitDeleted = { fg = p.git.removed },
        NvimTreeGitDirty = { fg = p.git.changed },
        NvimTreeGitMerge = { fg = p.git.conflict },
        NvimTreeGitRenamed = { fg = p.cyan },
        NvimTreeGitStaged = { fg = p.accent },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/p00f/nvim-ts-rainbow
      -- https://github.com/mrjones2014/nvim-ts-rainbow
      nvim_ts_rainbow = {
        rainbowcol1 = { fg = p.red },
        rainbowcol2 = { fg = p.orange },
        rainbowcol3 = { fg = p.yellow },
        rainbowcol4 = { fg = p.green },
        rainbowcol5 = { fg = p.blue },
        rainbowcol6 = { fg = p.magenta },
        rainbowcol7 = { fg = p.cyan },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/HiPhish/nvim-ts-rainbow2
      nvim_ts_rainbow2 = {
        TSRainbowRed = { fg = p.red },
        TSRainbowOrange = { fg = p.orange },
        TSRainbowYellow = { fg = p.yellow },
        TSRainbowGreen = { fg = p.green },
        TSRainbowBlue = { fg = p.blue },
        TSRainbowViolet = { fg = p.magenta },
        TSRainbowCyan = { fg = p.cyan },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/petertriho/nvim-scrollbar
      nvim_scrollbar = {
        ScrollbarHandle = { fg = p.fg0, bg = p.syntax.comment },
        ScrollbarCursorHandle = { fg = p.accent, bg = p.accent },
        ScrollbarCursor = { fg = p.bg4, bg = p.syntax.bg4 },

        ScrollbarSearchHandle = { fg = p.accent, bg = p.bg },
        ScrollbarSearch = { fg = p.accent, bg = p.bg },
        ScrollbarErrorHandle = { fg = p.diag.error, bg = p.bg },
        ScrollbarError = { fg = p.diag.error, bg = p.bg },
        ScrollbarWarnHandle = { fg = p.diag.warn, bg = p.bg },
        ScrollbarWarn = { fg = p.diag.warn, bg = p.bg },
        ScrollbarInfoHandle = { fg = p.diag.info, bg = p.bg },
        ScrollbarInfo = { fg = p.diag.info, bg = p.bg },
        ScrollbarHintHandle = { fg = p.diag.hint, bg = p.bg },
        ScrollbarHint = { fg = p.diag.hint, bg = p.bg },
        ScrollbarMiscHandle = { fg = p.fg0, bg = p.bg },
        ScrollbarMisc = { fg = p.fg0, bg = p.bg },

        ScrollbarGitAddHandle = { fg = p.git.added, bg = p.bg },
        ScrollbarGitAdd = { fg = p.git.added, bg = p.bg },
        ScrollbarGitChangeHandle = { fg = p.git.changed, bg = p.bg },
        ScrollbarGitChange = { fg = p.git.changed, bg = p.bg },
        ScrollbarGitDeleteHandle = { fg = p.git.removed, bg = p.bg },
        ScrollbarGitDelete = { fg = p.git.removed, bg = p.bg },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/nvim-telescope/telescope.nvim
      telescope = {
        TelescopeBorder = { fg = p.bg4 },
        TelescopeSelectionCaret = { fg = p.diag.hint },
        TelescopeSelection = { link = "CursorLine" },
        TelescopeMatching = { link = "Search" },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/folke/trouble.nvim
      trouble = {
        TroubleCount = { link = "CursorLineNr" },
        TroubleError = { link = "DiagnosticError" },
        TroubleNormal = { fg = p.fg },
        TroubleTextInformation = { link = "DiagnosticInfo" },
        TroubleSignWarning = { link = "DiagnosticWarn" },
        TroubleLocation = { fg = p.fg },
        TroubleWarning = { link = "DiagnosticWarn" },
        TroublePreview = { fg = p.fg },
        TroubleTextError = { link = "DiagnosticError" },
        TroubleSignInformation = { link = "DiagnosticInfo" },
        TroubleIndent = { fg = p.bg2 },
        TroubleSource = { fg = p.accent },
        TroubleSignHint = { link = "DiagnosticHint" },
        TroubleSignOther = { fg = p.fg3 },
        TroubleFoldIcon = { link = "CursorLineNr" },
        TroubleTextWarning = { link = "DiagnosticWarn" },
        TroubleCode = { fg = p.fg },
        TroubleInformation = { link = "DiagnosticInfo" },
        TroubleSignError = { link = "DiagnosticError" },
        TroubleFile = { fg = p.fg },
        TroubleHint = { link = "DiagnosticHint" },
        TroubleTextHint = { link = "DiagnosticHint" },
        TroubleText = { fg = p.fg },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/airblade/vim-gitgutter
      vim_gitgutter = {
        GitGutterAdd = { fg = p.git.added }, -- diff mode: Added line |diff.txt|
        GitGutterChange = { fg = p.git.changed }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete = { fg = p.git.removed }, -- diff mode: Deleted line |diff.txt|
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/RRethy/vim-illuminate
      vim_illuminate = {
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },
      },
      -----------------------------------------------------------------------------------------------------------------
      --https://github.com/justinmk/vim-sneak
      vim_sneak = {
        Sneak = { fg = p.bg, bg = p.accent },
        SneakScope = { bg = p.accent },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/folke/which-key.nvim
      which_key = {
        WhichKey = { link = "Identifier" },
        WhichKeyGroup = { link = "Function" },
        WhichKeyDesc = { link = "Keyword" },
        WhichKeySeperator = { link = "Comment" },
        WhichKeySeparator = { link = "Comment" },
        WhichKeyFloat = { bg = p.bg0 },
        WhichKeyValue = { link = "Comment" },
      },
      -----------------------------------------------------------------------------------------------------------------
      -- https://github.com/gbprod/yanky.nvim
      yanky = {
        YankyPut = { link = "IncSearch" },
        YankyYanked = { link = "IncSearch" },
      },
      -----------------------------------------------------------------------------------------------------------------
    },
  }
end

function _theme.get_highlight_groups(p, opts)
  local groups = _theme.groups(p, opts)
  local hls = {}
  hls = vim.tbl_deep_extend("force", hls, groups.core or {})

  for plugin, plugin_opts in pairs(opts.plugins) do
    if (type(plugin_opts) == "table" and plugin_opts.enabled) or plugin_opts == true then
      hls = vim.tbl_deep_extend("keep", hls, groups.plugins[plugin] or {})
    end
  end

  return vim.tbl_deep_extend("force", hls, opts.overrides.groups or {})
end

--- Set terminal colors
function _theme.set_terminal_colors(p)
  local colors = {
    p.black,
    p.red,
    p.green,
    p.yellow,
    p.blue,
    p.magenta,
    p.cyan,
    p.white,
    p.black,
    p.red,
    p.green,
    p.yellow,
    p.blue,
    p.magenta,
    p.cyan,
    p.white,
  }

  vim.g.terminal_color_foreground = p.fg
  vim.g.terminal_color_background = p.bg

  for i, c in ipairs(colors) do
    local n = "terminal_color_" .. i - 1
    vim.g[n] = c
  end

  if vim.fn.has("nvim") == 0 then
    vim.g.terminal_ansi_colors = vim.list(colors)
  end
end

--- Highlight commands for NeoVim 0.7+
function _theme.highlight(groups)
  vim.o.termguicolors = true
  vim.g.colors_name = "proxima"
  if color.is_dark(groups["Normal"].bg) then
    vim.o.background = "dark"
  end

  for group, opts in pairs(groups) do
    if opts.link and opts.link ~= "" then
      vim.api.nvim_set_hl(0, group, { link = opts.link })
    else
      if opts.style then
        opts = vim.tbl_extend("force", opts, opts.style)
        opts.style = nil
      end
      vim.api.nvim_set_hl(0, group, opts)
    end
  end
end

function _theme.setup()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  local pal = palette()
  local groups = _theme.get_highlight_groups(pal, config.opts)
  if config.term then
    _theme.set_terminal_colors(pal)
  end
  _theme.highlight(groups)
end

return _theme
