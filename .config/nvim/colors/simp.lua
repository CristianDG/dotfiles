
vim.cmd.highlight('clear')
vim.g.colors_name = 'simp'

local hi = function(name, val)
  -- Force links
  val.force = true

  -- Make sure that `cterm` attribute is not populated from `gui`
  val.cterm = val.cterm or {}

  -- Define global highlight
  vim.api.nvim_set_hl(0, name, val)
end

--stylua: ignore start
-- General

hi('Normal', { bg = "#181818", ctermbg = "DarkGrey" })
hi('concealed', { fg = "#53535f" })
hi('important', { fg = "#5dbee8", bold = true, cterm = { bold = true }})
hi('_string', { fg = "#508561", ctermfg = "Black" })
hi('text', { fg = "#dddddd", ctermfg = "White" })
hi('other_text', { fg = "#b1b1b1", ctermfg = "Grey" })

hi('SpecialChar',  { fg = "#224d30" })

hi("Comment", { link = "concealed" })

hi("String", { link = "_string" })

hi("Cursor", { link = "important" })
hi("Keyword", { link = "important" })
hi("Keywords", { link = "important" })
hi("Function", { link = "text" })
hi("Statement", { link = "important" })

hi("Type", { link = "other_text" })

-- 
-- Conceal
-- Cursor
-- lCursor
-- DiffText
-- ErrorMsg
-- IncSearch
-- ModeMsg
-- NonText
-- PmenuSbar
-- StatusLine
-- StatusLineNC
-- TabLineFill
-- TabLineSel
-- TermCursor
-- WinBar
-- WildMenu
-- 
-- VertSplit
-- WinSeparator
-- WinBarNC
-- EndOfBuffer
-- LineNrAbove
-- LineNrBelow
-- QuickFixLine
-- CursorLineSign
-- CursorLineFold
-- CurSearch
-- PmenuKind
-- PmenuKindSel
-- PmenuMatch
-- PmenuMatchSel
-- PmenuExtra
-- PmenuExtraSel
-- Substitute
-- Whitespace
-- MsgSeparator
-- NormalFloat
-- FloatBorder
-- FloatTitle
-- FloatFooter
-- 
-- FloatShadow
-- FloatShadowThrough
-- RedrawDebugNormal
-- RedrawDebugClear
-- RedrawDebugComposed
-- RedrawDebugRecompose
-- Error
-- Todo
-- 
-- String
-- Character
-- Number
-- Boolean
-- Float
-- Function
-- Conditional
-- Repeat
-- Label
-- Operator
-- Keyword
-- Exception
-- Include
-- Define
-- Macro
-- PreCondit
-- StorageClass
-- Structure
-- Typedef
-- Tag
-- SpecialChar
-- Delimiter
-- SpecialComment
-- Debug
-- 
-- DiagnosticError
-- DiagnosticWarn
-- DiagnosticInfo
-- DiagnosticHint
-- DiagnosticOk
-- DiagnosticUnderlineError
-- DiagnosticUnderlineWarn
-- DiagnosticUnderlineInfo
-- DiagnosticUnderlineHint
-- DiagnosticUnderlineOk
-- DiagnosticVirtualTextError
-- DiagnosticVirtualTextWarn
-- DiagnosticVirtualTextInfo
-- DiagnosticVirtualTextHint
-- DiagnosticVirtualTextOk
-- DiagnosticFloatingError
-- DiagnosticFloatingWarn
-- DiagnosticFloatingInfo
-- DiagnosticFloatingHint
-- DiagnosticFloatingOk
-- DiagnosticSignError
-- DiagnosticSignWarn
-- DiagnosticSignInfo
-- DiagnosticSignHint
-- DiagnosticSignOk
-- DiagnosticDeprecated
-- 
-- DiagnosticUnnecessary
-- LspInlayHint
-- SnippetTabstop
-- 
-- -- Text
-- @markup.raw
-- @markup.link
-- @markup.heading
-- @markup.link.url
-- @markup.underline
-- @comment.todo
-- 
-- -- Miscs
-- @comment
-- @punctuation
-- 
-- -- Constants
-- @constant
-- @constant.builtin
-- @constant.macro
-- @keyword.directive
-- @string
-- @string.escape
-- @string.special
-- @character
-- @character.special
-- @number
-- @boolean
-- @number.float
-- 
-- -- Functions
-- @function
-- @function.builtin
-- @function.macro
-- @function.method
-- @variable.parameter
-- @variable.parameter.builtin
-- @variable.member
-- @property
-- @attribute
-- @attribute.builtin
-- @constructor
-- 
-- -- Keywords
-- @keyword.conditional
-- @keyword.repeat
-- @keyword.type
-- @label
-- @operator
-- @keyword
-- @keyword.exception
-- 
-- @variable
-- @type
-- @type.definition
-- @module
-- @keyword.import
-- @keyword.directive
-- @keyword.debug
-- @tag
-- @tag.builtin
-- 
-- -- LSP semantic tokens
-- @lsp.type.class
-- @lsp.type.comment
-- @lsp.type.decorator
-- @lsp.type.enum
-- @lsp.type.enumMember
-- @lsp.type.function
-- @lsp.type.interface
-- @lsp.type.macro
-- @lsp.type.method
-- @lsp.type.namespace
-- @lsp.type.parameter
-- @lsp.type.property
-- @lsp.type.struct
-- @lsp.type.type
-- @lsp.type.typeParameter
-- @lsp.type.variable
--
-- Default colors only used with a dark background.
-- ColorColumn
-- CursorColumn
-- CursorLine
-- CursorLineNr
-- DiffAdd
-- DiffChange
-- DiffDelete
-- Directory
-- FoldColumn
-- Folded
-- LineNr
-- MatchParen
-- MoreMsg
-- Pmenu
-- PmenuSel
-- PmenuThumb
-- Question
-- Search
-- SignColumn
-- SpecialKey
-- SpellBad
-- SpellCap
-- SpellLocal
-- SpellRare
-- StatusLineTerm
-- StatusLineTermNC
-- TabLine
-- Title
-- Visual
-- WarningMsg
-- Comment
-- Constant
-- Special
-- Identifier
-- Statement
-- PreProc
-- Type
-- Underlined
-- Ignore

