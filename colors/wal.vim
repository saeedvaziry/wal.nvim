" wal.vim - A colorscheme using pywal colors
" Maintainer: Generated from pywal colors
" License: MIT

if exists("syntax_on")
  syntax reset
endif

hi clear

let g:colors_name = "wal"

" Load colors from pywal
let s:colors_file = expand('~/.cache/wal/colors-wal.vim')
if filereadable(s:colors_file)
  execute 'source' s:colors_file
else
  " Fallback to local colors.vim if pywal file doesn't exist
  let s:local_colors = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../colors.vim'
  if filereadable(s:local_colors)
    execute 'source' s:local_colors
  else
    echoerr "Could not load pywal colors"
    finish
  endif
endif

" Color definitions
let s:bg = background
let s:fg = foreground
let s:cursor = cursor
let s:color0 = color0
let s:color1 = color1
let s:color2 = color2
let s:color3 = color3
let s:color4 = color4
let s:color5 = color5
let s:color6 = color6
let s:color7 = color7
let s:color8 = color8
let s:color9 = color9
let s:color10 = color10
let s:color11 = color11
let s:color12 = color12
let s:color13 = color13
let s:color14 = color14
let s:color15 = color15

" Helper function - simple version
function! s:hi(group, guifg, guibg, attr)
  let l:cmd = 'hi ' . a:group
  if a:guifg != ''
    let l:cmd .= ' guifg=' . a:guifg
  endif
  if a:guibg != ''
    let l:cmd .= ' guibg=' . a:guibg
  endif
  if a:attr != ''
    let l:cmd .= ' gui=' . a:attr
  endif
  execute l:cmd
endfunction

" UI Elements
" Check if transparency is desired (set g:wal_transparent = 1 for transparent bg)
if get(g:, 'wal_transparent', 0)
  call s:hi('Normal', s:fg, 'NONE', '')
  call s:hi('NormalNC', s:fg, 'NONE', '')
else
  call s:hi('Normal', s:fg, s:bg, '')
  call s:hi('NormalNC', s:fg, s:bg, '')
endif
call s:hi('Cursor', s:bg, s:cursor, '')
call s:hi('CursorLine', '', s:color0, '')
call s:hi('CursorColumn', '', s:color0, '')
call s:hi('LineNr', s:color8, '', '')
call s:hi('CursorLineNr', s:fg, '', 'bold')
call s:hi('Visual', '', s:color8, '')
call s:hi('VisualNOS', '', s:color8, '')
call s:hi('Search', s:bg, s:color3, '')
call s:hi('IncSearch', s:bg, s:color3, '')
call s:hi('StatusLine', s:fg, s:color8, '')
call s:hi('StatusLineNC', s:color8, s:color0, '')
call s:hi('VertSplit', s:color8, '', '')
call s:hi('WildMenu', s:bg, s:color4, '')
call s:hi('Directory', s:color4, '', 'bold')
call s:hi('Title', s:color4, '', 'bold')
call s:hi('ErrorMsg', s:color1, '', 'bold')
call s:hi('MoreMsg', s:color2, '', 'bold')
call s:hi('ModeMsg', s:color2, '', 'bold')
call s:hi('Question', s:color2, '', 'bold')
call s:hi('WarningMsg', s:color3, '', 'bold')
call s:hi('MatchParen', s:bg, s:color5, 'bold')
call s:hi('Folded', s:color8, s:color0, '')
call s:hi('FoldColumn', s:color8, '', '')
" call s:hi('SignColumn', '', '', '')
call s:hi('ColorColumn', '', s:color0, '')

" Popup menu
if get(g:, 'wal_transparent', 0)
  call s:hi('Pmenu', s:fg, 'NONE', '')
  call s:hi('PmenuSbar', '', 'NONE', '')
else
  call s:hi('Pmenu', s:fg, s:color0, '')
  call s:hi('PmenuSbar', '', s:color8, '')
endif
call s:hi('PmenuSel', s:bg, s:color4, 'bold')
call s:hi('PmenuThumb', '', s:color4, '')

" Tabs
call s:hi('TabLine', s:color8, s:color0, '')
call s:hi('TabLineFill', s:color8, s:color0, '')
call s:hi('TabLineSel', s:fg, s:color8, 'bold')

" Syntax highlighting
call s:hi('Comment', s:color8, '', 'italic')
call s:hi('Constant', s:color1, '', '')
call s:hi('String', s:color2, '', '')
call s:hi('Character', s:color2, '', '')
call s:hi('Number', s:color1, '', '')
call s:hi('Boolean', s:color1, '', '')
call s:hi('Float', s:color1, '', '')
call s:hi('Identifier', s:color4, '', '')
call s:hi('Function', s:color4, '', 'bold')
call s:hi('Statement', s:color5, '', 'bold')
call s:hi('Conditional', s:color5, '', 'bold')
call s:hi('Repeat', s:color5, '', 'bold')
call s:hi('Label', s:color5, '', 'bold')
call s:hi('Operator', s:color6, '', '')
call s:hi('Keyword', s:color5, '', 'bold')
call s:hi('Exception', s:color1, '', 'bold')
call s:hi('PreProc', s:color3, '', 'bold')
call s:hi('Include', s:color3, '', 'bold')
call s:hi('Define', s:color3, '', 'bold')
call s:hi('Macro', s:color3, '', 'bold')
call s:hi('PreCondit', s:color3, '', 'bold')
call s:hi('Type', s:color6, '', 'bold')
call s:hi('StorageClass', s:color6, '', 'bold')
call s:hi('Structure', s:color6, '', 'bold')
call s:hi('Typedef', s:color6, '', 'bold')
call s:hi('Special', s:color7, '', '')
call s:hi('SpecialChar', s:color7, '', '')
call s:hi('Tag', s:color7, '', '')
call s:hi('Delimiter', s:color7, '', '')
call s:hi('SpecialComment', s:color8, '', 'italic')
call s:hi('Debug', s:color1, '', 'bold')
call s:hi('Underlined', s:color4, '', 'underline')
call s:hi('Ignore', s:color8, '', '')
call s:hi('Error', s:color1, s:bg, 'bold')
call s:hi('Todo', s:color3, s:bg, 'bold')

" Diff
call s:hi('DiffAdd', s:color2, '', '')
call s:hi('DiffChange', s:color3, '', '')
call s:hi('DiffDelete', s:color1, '', '')
call s:hi('DiffText', s:color4, '', 'bold')

" Spell
call s:hi('SpellBad', '', '', 'undercurl')
call s:hi('SpellCap', '', '', 'undercurl')
call s:hi('SpellLocal', '', '', 'undercurl')
call s:hi('SpellRare', '', '', 'undercurl')

" LSP/Diagnostic highlights
call s:hi('DiagnosticError', s:color1, '', '')
call s:hi('DiagnosticWarn', s:color3, '', '')
call s:hi('DiagnosticInfo', s:color4, '', '')
call s:hi('DiagnosticHint', s:color8, '', '')
call s:hi('DiagnosticUnderlineError', '', '', 'undercurl')
call s:hi('DiagnosticUnderlineWarn', '', '', 'undercurl')
call s:hi('DiagnosticUnderlineInfo', '', '', 'undercurl')
call s:hi('DiagnosticUnderlineHint', '', '', 'undercurl')

" Tree-sitter highlights
call s:hi('@comment', s:color8, '', 'italic')
call s:hi('@constant', s:color1, '', '')
call s:hi('@string', s:color2, '', '')
call s:hi('@number', s:color1, '', '')
call s:hi('@boolean', s:color1, '', '')
call s:hi('@function', s:color4, '', 'bold')
call s:hi('@keyword', s:color5, '', 'bold')
call s:hi('@type', s:color6, '', 'bold')
call s:hi('@variable', s:fg, '', '')
call s:hi('@parameter', s:fg, '', '')

" Additional LazyVim specific highlights
" Use transparency setting for floating windows and panels
if get(g:, 'wal_transparent', 0)
  call s:hi('NormalFloat', s:fg, 'NONE', '')
  call s:hi('FloatBorder', s:color8, 'NONE', '')
  call s:hi('TelescopeNormal', s:fg, 'NONE', '')
  call s:hi('TelescopeBorder', s:color8, 'NONE', '')
  call s:hi('WhichKeyFloat', s:fg, 'NONE', '')
  call s:hi('NeoTreeNormal', s:fg, 'NONE', '')
  call s:hi('NeoTreeNormalNC', s:fg, 'NONE', '')
else
  call s:hi('NormalFloat', s:fg, s:color0, '')
  call s:hi('FloatBorder', s:color8, s:color0, '')
  call s:hi('TelescopeNormal', s:fg, s:color0, '')
  call s:hi('TelescopeBorder', s:color8, s:color0, '')
  call s:hi('WhichKeyFloat', s:fg, s:color0, '')
  call s:hi('NeoTreeNormal', s:fg, s:color0, '')
  call s:hi('NeoTreeNormalNC', s:fg, s:color0, '')
endif

