local variants = require("rasmus.colors")
local cfg = require("rasmus.config").config
local c = variants[cfg.variant]
local utils = require("rasmus.utils")
local M = {}

local set_terminal_colors = function()
  vim.g.terminal_color_0 = c.gray03
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.gray05
  vim.g.terminal_color_9 = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
  vim.g.terminal_color_background = c.black
  vim.g.terminal_color_foreground = c.white
end

local set_groups = function()
  local groups = {
    -- Base
    -- Editor highlight groups
    Normal = { fg = c.white, bg = cfg.transparent and c.none or c.black }, -- normal text and background color
    NormalNC = { fg = c.white, bg = cfg.transparent and c.none or c.black }, -- normal text in non-current windows
    SignColumn = { fg = c.white, bg = cfg.transparent and c.none or c.black }, -- column where signs are displayed
    EndOfBuffer = { fg = c.gray03 }, -- ~ lines at the end of a buffer
    NormalFloat = { fg = c.white, bg = c.gray02 }, -- normal text and background color for floating windows
    FloatBorder = { fg = c.blue, bg = c.gray02 },
    ColorColumn = { fg = c.none, bg = c.gray01 }, --  used for the columns set with 'colorcolumn'
    Conceal = { fg = c.gray05 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.cyan, bg = c.none, style = "reverse" }, -- the character under the cursor
    CursorIM = { fg = c.cyan, bg = c.none, style = "reverse" }, -- like Cursor, but used when in IME mode
    Directory = { fg = c.blue, bg = c.none, style = "bold" }, -- directory names (and other special names in listings)
    DiffAdd = { fg = c.bright_green, bg = c.none, style = "reverse" }, -- diff mode: Added line
    DiffChange = { fg = c.bright_blue, bg = c.none, style = "reverse" }, --  diff mode: Changed line
    DiffDelete = { fg = c.bright_red, bg = c.none, style = "reverse" }, -- diff mode: Deleted line
    DiffText = { fg = c.white, bg = c.none, style = "reverse" }, -- diff mode: Changed text within a changed line
    ErrorMsg = { fg = c.red }, -- error messages
    Folded = { fg = c.gray05, c.none, style = "italic" },
    FoldColumn = { fg = c.blue },
    IncSearch = { style = "reverse" },
    LineNr = { fg = c.gray05 },
    CursorLineNr = { fg = c.gray07 },
    MatchParen = { fg = c.yellow, style = "bold" },
    ModeMsg = { fg = c.cyan, style = "bold" },
    MoreMsg = { fg = c.cyan, style = "bold" },
    NonText = { fg = c.gray03 },
    Pmenu = { fg = c.gray07, bg = c.gray02 },
    PmenuSel = { fg = c.black, bg = c.gray06, style = "bold" },
    PmenuSbar = { fg = c.white, bg = c.gray02 },
    PmenuThumb = { fg = c.white, bg = c.gray05 },
    Question = { fg = c.green, style = "bold" },
    QuickFixLine = { fg = c.blue, bg = c.gray01, style = "bold,italic" },
    qfLineNr = { fg = c.blue, bg = c.gray01 },
    Search = { style = "reverse" },
    SpecialKey = { fg = c.gray03 },
    SpellBad = { fg = c.red, bg = c.none, style = "italic,undercurl" },
    SpellCap = { fg = c.blue, bg = c.none, style = "italic,undercurl" },
    SpellLocal = { fg = c.cyan, bg = c.none, style = "italic,undercurl" },
    SpellRare = { fg = c.cyan, bg = c.none, style = "italic,undercurl" },
    StatusLine = { fg = c.gray07, bg = c.gray01 },
    StatusLineNC = { fg = c.gray06, bg = c.gray01 },
    StatusLineTerm = { fg = c.gray07, bg = c.gray01 },
    StatusLineTermNC = { fg = c.gray07, bg = c.gray01 },
    TabLineFill = { fg = c.gray05, bg = c.gray01 },
    TablineSel = { fg = c.black, bg = c.gray07 },
    Tabline = { fg = c.gray05 },
    Title = { fg = c.cyan, bg = c.none, style = "bold" },
    Visual = { fg = c.none, bg = c.gray03 },
    VisualNOS = { fg = c.none, bg = c.gray03 },
    WarningMsg = { fg = c.yellow, style = "bold" },
    WildMenu = { fg = c.black, bg = c.blue, style = "bold" },
    CursorColumn = { fg = c.none, bg = c.white },
    CursorLine = { fg = c.none, bg = c.gray01 },
    ToolbarLine = { fg = c.white, bg = c.gray01 },
    ToolbarButton = { fg = c.white, bg = c.none, style = "bold" },
    NormalMode = { fg = c.cyan, bg = c.none, style = "reverse" },
    InsertMode = { fg = c.green, bg = c.none, style = "reverse" },
    VisualMode = { fg = c.cyan, bg = c.none, style = "reverse" },
    VertSplit = { fg = c.gray02 },
    CommandMode = { fg = c.gray05, bg = c.none, style = "reverse" },
    Warnings = { fg = c.yellow },
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.yellow },
    --common
    Type = { fg = c.cyan }, -- int, long, char, etc.
    StorageClass = { fg = c.cyan }, -- static, register, volatile, etc.
    Structure = { fg = c.white }, -- struct, union, enum, etc.
    Constant = { fg = c.cyan }, -- any constant
    Comment = { fg = c.gray05, bg = c.none, style = cfg.comment_style }, -- italic comments
    Conditional = { fg = c.blue, bg = c.none, style = cfg.keyword_style }, -- italic if, then, else, endif, switch, etc.
    Keyword = { fg = c.blue, bg = c.none, style = cfg.keyword_style }, -- italic for, do, while, etc.
    Repeat = { fg = c.blue, bg = c.none, style = cfg.keyword_style }, -- italic any other keyword
    Boolean = { fg = c.cyan, bg = c.none, style = cfg.boolean_style }, -- true , false
    Function = { fg = c.blue, bg = c.none, style = cfg.function_style },
    Identifier = { fg = c.blue, bg = c.none }, -- any variable name
    String = { fg = c.cyan, bg = c.none }, -- Any string
    Character = { fg = c.cyan }, -- any character constant: 'c', '\n'
    Number = { fg = c.cyan }, -- a number constant: 5
    Float = { fg = c.cyan }, -- a floating point constant: 2.3e10
    Statement = { fg = c.blue }, -- any statement
    Label = { fg = c.cyan }, -- case, default, etc.
    Operator = { fg = c.yellow }, -- sizeof", "+", "*", etc.
    Exception = { fg = c.yellow }, -- try, catch, throw
    PreProc = { fg = c.red }, -- generic Preprocessor
    Include = { fg = c.blue }, -- preprocessor #include
    Define = { fg = c.cyan }, -- preprocessor #define
    Macro = { fg = c.blue }, -- same as Define
    Typedef = { fg = c.cyan }, -- A typedef
    PreCondit = { fg = c.cyan }, -- preprocessor #if, #else, #endif, etc.
    Special = { fg = c.blue, bg = c.none, "italic" }, -- any special symbol
    SpecialChar = { fg = c.cyan }, -- special character in a constant
    Tag = { fg = c.yellow }, -- you can use CTRL-] on this
    Delimiter = { fg = c.gray07 }, -- character that needs attention like , or .
    SpecialComment = { fg = c.blue }, -- special things inside a comment
    Debug = { fg = c.red }, -- debugging statements
    Underlined = { fg = c.cyan, bg = c.none, style = "underline" }, -- text that stands out, HTML links
    Ignore = { fg = c.gray07 }, -- left blank, hidden
    Error = { fg = c.red, bg = c.none, style = "bold,underline" }, -- any erroneous construct
    Todo = { fg = c.cyan, bg = c.none, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- HTML
    htmlArg = { fg = c.white, style = "italic" },
    htmlBold = { fg = c.white, bg = c.none, style = "bold" },
    htmlEndTag = { fg = c.white },
    htmlStyle = { fg = c.cyan, bg = c.none, style = "italic" },
    htmlLink = { fg = c.cyan, style = "underline" },
    htmlSpecialChar = { fg = c.yellow },
    htmlSpecialTagName = { fg = c.blue, style = "bold" },
    htmlTag = { fg = c.white },
    htmlTagN = { fg = c.yellow },
    htmlTagName = { fg = c.yellow },
    htmlTitle = { fg = c.white },
    htmlH1 = { fg = c.blue, style = "bold" },
    htmlH2 = { fg = c.blue, style = "bold" },
    htmlH3 = { fg = c.blue, style = "bold" },
    htmlH4 = { fg = c.blue, style = "bold" },
    htmlH5 = { fg = c.blue, style = "bold" },
    -- Markdown
    markdownH1 = { fg = c.bright_white, style = "bold" },
    markdownH2 = { fg = c.bright_white, style = "bold" },
    markdownH3 = { fg = c.bright_white, style = "bold" },
    markdownH4 = { fg = c.bright_white, style = "bold" },
    markdownH5 = { fg = c.bright_white, style = "bold" },
    markdownH6 = { fg = c.bright_white, style = "bold" },
    markdownHeadingDelimiter = { fg = c.gray05 },
    markdownHeadingRule = { fg = c.gray05 },
    markdownId = { fg = c.cyan },
    markdownIdDeclaration = { fg = c.blue },
    markdownIdDelimiter = { fg = c.cyan },
    markdownLinkDelimiter = { fg = c.gray05 },
    markdownLinkText = { fg = c.bright_white, style = "italic" },
    markdownListMarker = { fg = c.yellow },
    markdownOrderedListMarker = { fg = c.yellow },
    markdownRule = { fg = c.gray05 },
    markdownUrl = { fg = c.gray06, bg = c.none },
    markdownBlockquote = { fg = c.gray07 },
    markdownBold = { fg = c.white, bg = c.none, style = "bold" },
    markdownItalic = { fg = c.white, bg = c.none, style = "italic" },
    markdownCode = { fg = c.white, bg = c.gray02 },
    markdownCodeBlock = { fg = c.white, bg = c.gray02 },
    markdownCodeDelimiter = { fg = c.white, bg = c.gray02 },
    -- Dashboard
    DashboardShortCut = { fg = c.red },
    DashboardHeader = { fg = c.magenta },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.green, style = "italic" },
    -- TreeSitter highlight groups
    TSAnnotation = { fg = c.green }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = { fg = c.white }, -- (unstable) TODO: docs
    TSBoolean = { fg = c.cyan, bg = c.none, style = cfg.boolean_style }, -- true or false
    TSCharacter = { fg = c.cyan }, -- For characters.
    TSComment = { fg = c.gray05, bg = c.none, style = cfg.comment_style }, -- For comment blocks.
    TSConditional = { fg = c.blue, style = cfg.keyword_style }, -- For keywords related to conditionnals.
    TSConstant = { fg = c.white }, -- For constants
    TSConstBuiltin = { fg = c.cyan, style = "italic" }, -- For constants that are built in the language: `nil` in Lua.
    TSConstMacro = { fg = c.cyan }, -- For constants that are defined by macros: `NULL` in C.
    TSConstructor = { fg = c.gray07 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSError = { fg = c.red }, -- For syntax/parser errors.
    TSException = { fg = c.yellow }, -- For exception related keywords.
    TSField = { fg = c.cyan }, -- For fields.
    TSFloat = { fg = c.cyan }, -- For floats.
    TSFunction = { fg = c.white, style = cfg.function_style }, -- For fuction (calls and definitions).
    TSFuncBuiltin = { fg = c.white, style = cfg.function_style }, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro = { fg = c.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = { fg = c.blue, style = "italic" }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.blue, style = cfg.keyword_style }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.blue, style = cfg.function_style }, -- For keywords used to define a fuction.
    TSKeywordOperator = { fg = c.yellow }, -- For operators that are English words, e.g. `and`, `as`, `or`.
    TSKeywordReturn = { fg = c.blue, style = cfg.keyword_style }, -- For the `return` and `yield` keywords.
    TSLabel = { fg = c.cyan }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod = { fg = c.bright_blue, style = cfg.function_style }, -- For method calls and definitions.
    TSNamespace = { fg = c.blue }, -- For identifiers referring to modules and namespaces.
    -- TSNone = {}, -- No highlighting. Don't change the values of this highlight group.
    TSNumber = { fg = c.cyan }, -- For all numbers
    TSOperator = { fg = c.yellow }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.white }, -- For parameters of a function.
    TSParameterReference = { fg = c.white }, -- For references to parameters of a function.
    TSProperty = { fg = c.blue }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.gray05 }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.gray05 }, -- For brackets and parens.
    TSPunctSpecial = { fg = c.green }, -- For special punctutation that does not fall in the catagories before.
    TSRepeat = { fg = c.blue, style = cfg.keyword_style }, -- For keywords related to loops.
    TSString = { fg = c.cyan }, -- For strings.
    TSStringRegex = { fg = c.green }, -- For regexes.
    TSStringEscape = { fg = c.cyan }, -- For escape characters within a string.
    TSStringSpecial = { fg = c.green }, -- For strings with special meaning that don't fit into the above categories.
    TSSymbol = { fg = c.green }, -- For identifiers referring to symbols or atoms.
    TSTag = { fg = c.yellow }, -- Tags like html tag names.
    TSTagAttribute = { fg = c.white, style = "italic" }, -- For html tag attributes.
    TSTagDelimiter = { fg = c.gray05 }, -- Tag delimiter like `<` `>` `/`
    TSText = { fg = c.white }, -- For strings considered text in a markup language.
    TSStrong = { fg = c.bright_white, style = "bold" }, -- For text to be represented in bold.
    TSEmphasis = { fg = c.bright_white, style = "bold,italic" }, -- For text to be represented with emphasis.
    TSUnderline = { fg = c.bright_white, bg = c.none, style = "underline" }, -- For text to be represented with an underline.
    TSStrike = {}, -- For strikethrough text.
    TSTitle = { fg = c.white, bg = c.none, style = "bold" }, -- Text that is part of a title.
    TSLiteral = { fg = c.white }, -- Literal text.
    TSURI = { fg = c.cyan }, -- Any URL like a link or email.
    TSMath = { fg = c.blue }, -- For LaTeX-like math environments.
    TSTextReference = { fg = c.yellow }, -- For footnotes, text references, citations.
    TSEnvironment = { fg = c.blue }, -- For text environments of markup languages.
    TSEnvironmentName = { fg = c.bright_blue }, -- For the name/the string indicating the type of text environment.
    TSNote = { fg = c.blue, style = "italic" }, -- Text representation of an informational note.
    TSWarning = { fg = c.yellow, style = "italic" }, -- Text representation of a warning note.
    TSDanger = { fg = c.red, style = "italic" }, -- Text representation of a danger note.
    TSType = { fg = c.white }, -- For types.
    TSTypeBuiltin = { fg = c.blue }, -- For builtin types.
    TSVariable = { fg = c.white, style = cfg.variable_style }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.yellow, style = cfg.variable_style }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- highlight groups for the native LSP client
    LspReferenceText = { fg = c.black, bg = c.magenta }, -- used for highlighting "text" references
    LspReferenceRead = { fg = c.black, bg = c.magenta }, -- used for highlighting "read" references
    LspReferenceWrite = { fg = c.black, bg = c.magenta }, -- used for highlighting "write" references
    -- Diagnostics
    DiagnosticError = { fg = c.red }, -- base highlight group for "Error"
    DiagnosticWarn = { fg = c.yellow }, -- base highlight group for "Warning"
    DiagnosticInfo = { fg = c.blue }, -- base highlight group from "Information"
    DiagnosticHint = { fg = c.cyan }, -- base highlight group for "Hint"
    DiagnosticUnderlineError = { fg = c.red, style = "undercurl", sp = c.red }, -- used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn = { fg = c.yellow, style = "undercurl", sp = c.yellow }, -- used to underline "Warning" diagnostics.
    DiagnosticUnderlineInfo = { fg = c.blue, style = "undercurl", sp = c.blue }, -- used to underline "Information" diagnostics.
    DiagnosticUnderlineHint = { fg = c.cyan, style = "undercurl", sp = c.cyan }, -- used to underline "Hint" diagnostics.
    -- Diagnostics (old)
    LspDiagnosticsDefaultError = { fg = c.red }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError = { fg = c.red }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError = { fg = c.red, style = "bold" }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError = { fg = c.red, style = "bold" }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError = { fg = c.red, style = "undercurl", sp = c.red }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning = { fg = c.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { fg = c.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning = { fg = c.yellow, style = "bold" }, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning = { fg = c.yellow, style = "bold" }, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning = { fg = c.yellow, style = "undercurl", sp = c.yellow }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation = { fg = c.blue }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation = { fg = c.blue }, -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation = { fg = c.blue, style = "bold" }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = c.blue, style = "bold" }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation = { fg = c.blue, style = "undercurl", sp = c.blue }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint = { fg = c.cyan }, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint = { fg = c.cyan }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint = { fg = c.cyan, style = "bold" }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint = { fg = c.cyan, style = "bold" }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint = { fg = c.cyan, style = "undercurl", sp = c.cyan }, -- used to underline "Hint" diagnostics.
    -- Plugins highlight groups
    -- LspTrouble
    LspTroubleText = { fg = c.gray04 },
    LspTroubleCount = { fg = c.magenta, bg = c.gray03 },
    LspTroubleNormal = { fg = c.white, bg = c.black },
    -- Diff
    diffAdded = { fg = c.bright_green },
    diffRemoved = { fg = c.bright_red },
    diffChanged = { fg = c.bright_blue },
    diffOldFile = { fg = c.gray04 },
    diffNewFile = { fg = c.white },
    diffFile = { fg = c.gray05 },
    diffLine = { fg = c.cyan },
    diffIndexLine = { fg = c.magenta },
    -- GitSigns
    GitSignsAdd = { fg = c.bright_green }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr = { fg = c.bright_green }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn = { fg = c.bright_green }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.bright_red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = c.bright_red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = c.bright_red }, -- diff mode: Deleted line |diff.txt|
    -- Telescope
    TelescopeSelectionCaret = { fg = c.blue, bg = c.gray01 },
    TelescopeBorder = { fg = c.gray05 },
    TelescopePromptBorder = { fg = c.blue },
    TelescopeResultsBorder = { fg = c.gray07 },
    TelescopePreviewBorder = { fg = c.gray05 },
    TelescopeMatching = { fg = c.yellow },
    TelescopePromptPrefix = { fg = c.blue },
    -- NvimTree
    NvimTreeRootFolder = { fg = c.cyan, style = "italic" },
    NvimTreeNormal = { fg = c.white, bg = cfg.transparent and c.none or c.black },
    NvimTreeImageFile = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.green },
    NvimTreeSpecialFile = { fg = c.magenta },
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.bright_blue },
    NvimTreeOpenedFile = { fg = c.bright_blue },
    NvimTreeEmptyFolderName = { fg = c.gray05 },
    NvimTreeFolderIcon = { fg = c.gray07 },
    NvimTreeIndentMarker = { fg = c.gray03 },
    NvimTreeGitDirty = { fg = c.gray07 },
    NvimTreeGitStaged = { fg = c.cyan },
    NvimTreeGitRenamed = { fg = c.yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    -- Ale-vim
    ALEError = { fg = c.red },
    ALEWarning = { fg = c.yellow },
    ALEInfo = { fg = c.blue },
    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.yellow },
    ALEInfoSign = { fg = c.blue },
    ALEVirtualTextError = { fg = c.red },
    ALEVirtualTextWarning = { fg = c.yellow },
    ALEVirtualTextInfo = { fg = c.blue },
    -- WhichKey
    WhichKey = { fg = c.magenta, style = "bold" },
    WhichKeyGroup = { fg = c.magenta, style = "italic" },
    WhichKeyDesc = { fg = c.blue, style = "bold" },
    WhichKeySeperator = { fg = c.green },
    WhichKeyFloating = { bg = c.gray01 },
    WhichKeyFloat = { bg = c.gray01 },
    -- LspSaga
    LspSagaFinderSelection = { fg = c.magenta },
    LspSagaLspFinderBorder = { fg = c.gray05 },
    LspFloatWinNormal = { bg = c.black },
    LspFloatWinBorder = { fg = c.gray05 },
    LspSagaBorderTitle = { fg = c.gray07 },
    TargetWord = { fg = c.cyan },
    ReferencesCount = { fg = c.gray07 },
    DefinitionCount = { fg = c.gray07 },
    TargetFileName = { fg = c.bright_blue },
    DefinitionIcon = { fg = c.gray07 },
    ReferencesIcon = { fg = c.gray07 },
    ProviderTruncateLine = { fg = c.gray05 },
    SagaShadow = { fg = c.gray05 },
    DiagnosticTruncateLine = { fg = c.gray05 },
    DiagnosticWarning = { fg = c.yellow },
    DiagnosticInformation = { fg = c.blue },
    DefinitionPreviewTitle = { fg = c.gray07 },
    LspSagaShTruncateLine = { fg = c.gray05 },
    LspSagaDocTruncateLine = { fg = c.gray05 },
    LspSagaCodeActionTitle = { fg = c.gray07 },
    LspSagaCodeActionTruncateLine = { fg = c.gray05 },
    LspSagaCodeActionContent = { fg = c.magenta },
    LspSagaRenamePromptPrefix = { fg = c.green },
    LspSagaRenameBorder = { fg = c.gray05 },
    LspSagaHoverBorder = { fg = c.gray05 },
    LspSagaSignatureHelpBorder = { fg = c.gray05 },
    LspSagaCodeActionBorder = { fg = c.gray05 },
    LspSagaAutoPreview = { fg = c.gray07 },
    LspSagaDefPreviewBorder = { fg = c.gray05 },
    LspLinesDiagBorder = { fg = c.gray05 },
    LspSagaLightBulb = { fg = c.gray07 },
    LspSagaLightBulbSign = { fg = c.gray07 },
    LspSagaDiagnosticBorder = { fg = c.gray05 },
    LspSagaDiagnosticHeader = { fg = c.gray07 },
    LspSagaDiagnosticTruncateLine = { fg = c.gray05 },
    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.green },
    BufferLineFill = { bg = c.gray03 },
    -- Sneak
    Sneak = { fg = c.black, bg = c.green },
    SneakScope = { bg = c.gray04 },
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.gray03 },
    IndentBlanklineContextChar = { fg = c.gray05 },
    -- nvim-cmp
    CmpItemAbbrDeprecated = { fg = c.gray05, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.yellow },
    CmpItemAbbrMatchFuzzy = { fg = c.yellow },
    CmpItemKindVariable = { fg = c.blue },
    CmpItemKindInterface = { fg = c.blue },
    CmpItemKindText = { fg = c.blue },
    CmpItemKindFunction = { fg = c.magenta },
    CmpItemKindMethod = { fg = c.magenta },
    CmpItemKindKeyword = { fg = c.white },
    CmpItemKindProperty = { fg = c.white },
    CmpItemKindUnit = { fg = c.white },
    -- mini.nvim
    MiniStatuslineModeNormal = { fg = c.black, bg = c.bright_cyan },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.bright_blue },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.bright_magenta },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.bright_yellow },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.bright_green },
    MiniStatuslineModeOther = { fg = c.gray05, bg = c.gray01 },
    MiniStatuslineDevInfo = { fg = c.white, bg = c.gray02 },
    MiniStatuslineFilename = { fg = c.white, bg = c.gray01 },
    MiniStatuslineFileinfo = { fg = c.white, bg = c.gray02 },
    MiniStatuslineInactive = { fg = c.gray05, bg = c.gray01 },
    MiniTablineCurrent = { fg = c.black, bg = c.bright_cyan },
    MiniTablineVisible = { fg = c.black, bg = c.bright_magenta },
    MiniTablineHidden = { fg = c.gray05, bg = c.gray02 },
    MiniTablineModifiedCurrent = { fg = c.black, bg = c.bright_cyan },
    MiniTablineModifiedVisible = { fg = c.black, bg = c.bright_magenta },
    MiniTablineModifiedHidden = { fg = c.gray05, bg = c.gray02 },
    MiniTablineFill = { bg = c.gray01 },
    MiniCursorword = { style = "underline" },
    MiniSurround = { style = "underline" },
    MiniTrailspace = { bg = c.red },
    MiniCompletionActiveParameter = { style = "underline" },
    MiniJump = { style = "reverse" },
    MiniStarterCurrent = { fg = c.bright_cyan },
    MiniStarterFooter = { fg = c.gray07 },
    MiniStarterHeader = { fg = c.bright_blue },
    MiniStarterInactive = { fg = c.gray07 },
    MiniStarterItem = { fg = c.white, bg = c.gray01 },
    MiniStarterItemBullet = { bg = c.gray01 },
    MiniStarterItemPrefix = { style = "underline" },
    MiniStarterSelection = { fg = c.bright_magenta },
    MiniStarterQuery = { fg = c.bright_magenta },
    -- Custom highlight groups for use in statusline plugins
    StatusLineHint = { fg = c.cyan, bg = c.gray01 },
    StatusLineInfo = { fg = c.blue, bg = c.gray01 },
    StatusLineWarn = { fg = c.yellow, bg = c.gray01 },
    StatusLineError = { fg = c.red, bg = c.gray01 },
  }

  for group, parameters in pairs(groups) do
    utils.highlight(group, parameters)
  end
end

M.colorscheme = function()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "rasmus"

  set_terminal_colors()
  set_groups()
end

return M
