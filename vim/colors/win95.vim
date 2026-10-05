" tema win95 (ou não)

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "win95"

" paleta
let s:bg        = "#c0c0c0"
let s:fg        = "#000000"
let s:blue      = "#000080"
let s:shadow    = "#808080"
let s:white     = "#ffffff"
let s:red       = "#ff0000"
let s:green     = "#008000"
let s:yellow    = "#808000"
let s:magenta   = "#800080"
let s:cyan      = "#008080"
let s:orange    = "#ff8000"
let s:lightgray = "#e0e0e0"
let s:darkgray  = "#a0a0a0"

" helpers
function! s:H(group, fg, bg, attr) abort
  exec 'hi ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . (empty(a:attr) ? '' : ' gui=' . a:attr)
endfunction

function! s:Hfg(group, fg, attr) abort
  exec 'hi ' . a:group . ' guifg=' . a:fg . (empty(a:attr) ? '' : ' gui=' . a:attr)
endfunction

function! s:Hbg(group, bg) abort
  exec 'hi ' . a:group . ' guibg=' . a:bg
endfunction

" ui
call s:H('Normal',       s:fg,      s:bg,       '')
call s:Hbg('CursorLine', s:lightgray)
call s:Hbg('CursorColumn', s:lightgray)
call s:H('LineNr',       s:shadow,  s:bg,       '')
call s:H('CursorLineNr', s:blue,    s:lightgray, 'bold')
call s:Hbg('SignColumn', s:bg)
call s:H('VertSplit',    s:shadow,  s:bg,       '')
call s:H('WinSeparator', s:shadow,  s:bg,       '')
call s:H('StatusLine',   s:fg,      s:shadow, 'bold')
call s:H('StatusLineNC', s:shadow,  s:bg,       '')
call s:H('Pmenu',        s:fg,      s:lightgray, '')
call s:H('PmenuSel',     s:white,   s:blue,       '')
call s:Hbg('PmenuSbar',  s:shadow)
call s:Hbg('PmenuThumb', s:blue)
call s:H('TabLine',      s:shadow,  s:bg,       '')
call s:H('TabLineSel',   s:white,   s:blue, 'bold')
call s:Hbg('TabLineFill', s:bg)

" busca
call s:H('Search',       s:white, s:blue,       '')
call s:H('IncSearch',    s:white, s:red,        '')
call s:H('CurSearch',    s:white, s:orange,     '')
call s:H('MatchParen',   s:white, s:blue, 'bold')

" visual
call s:H('Visual',       s:white, s:blue, '')
call s:H('VisualNOS',    s:white, s:blue, '')

" syntax
call s:H('Comment',      s:shadow, s:bg, 'italic')
call s:Hfg('Constant',   s:green, '')
call s:Hfg('String',     s:green, '')
call s:Hfg('Character',  s:green, '')
call s:Hfg('Number',     s:magenta, '')
call s:Hfg('Boolean',    s:magenta, '')
call s:Hfg('Float',      s:magenta, '')

call s:Hfg('Identifier', s:blue, '')
call s:Hfg('Function',   s:blue, 'bold')

call s:Hfg('Statement',  s:red, 'bold')
call s:Hfg('Conditional',s:red, 'bold')
call s:Hfg('Repeat',     s:red, 'bold')
call s:Hfg('Label',      s:red, '')
call s:Hfg('Operator',   s:red, '')
call s:Hfg('Keyword',    s:red, 'bold')
call s:Hfg('Exception',  s:red, 'bold')

call s:Hfg('PreProc',    s:orange, '')
call s:Hfg('Include',    s:orange, '')
call s:Hfg('Define',     s:orange, '')
call s:Hfg('Macro',      s:orange, '')
call s:Hfg('PreCondit',  s:orange, '')

call s:Hfg('Type',       s:cyan, 'bold')
call s:Hfg('StorageClass',s:cyan, '')
call s:Hfg('Structure',  s:cyan, '')
call s:Hfg('Typedef',    s:cyan, '')

call s:Hfg('Special',    s:magenta, '')
call s:Hfg('SpecialChar',s:magenta, '')
call s:Hfg('Tag',        s:blue, '')
call s:Hfg('Delimiter',  s:fg, '')
call s:H('SpecialComment',s:shadow, s:bg, 'bold,italic')
call s:Hfg('Debug',      s:red, '')

call s:Hfg('Underlined', s:fg, 'underline')
call s:Hfg('Ignore',     s:shadow, '')
call s:H('Error',        s:white, s:red, '')
call s:H('Todo',         s:white, s:orange, 'bold')

" diff
call s:Hbg('DiffAdd',    '#d0ffe0')
call s:Hbg('DiffChange', '#fff0d0')
call s:Hbg('DiffDelete', '#ffd0d0')
call s:H('DiffText',     s:fg, '#ff8080', 'bold')

" spell
call s:H('SpellBad',     s:bg, s:red, 'undercurl')
call s:H('SpellCap',     s:bg, s:blue, 'undercurl')
call s:H('SpellRare',    s:bg, s:cyan, 'undercurl')
call s:H('SpellLocal',   s:bg, s:green, 'undercurl')

" markdown
call s:H('markdownH1',           s:blue,   s:bg, 'bold')
call s:H('markdownH2',           s:blue,   s:bg, 'bold')
call s:H('markdownH3',           s:cyan,   s:bg, 'bold')
call s:H('markdownH4',           s:cyan,   s:bg, 'bold')
call s:H('markdownH5',           s:green,  s:bg, 'bold')
call s:H('markdownH6',           s:magenta,  s:bg, 'bold')

call s:Hfg('markdownHeadingRule',    s:shadow, '')
call s:Hfg('markdownHeadingDelimiter', s:shadow, '')

call s:H('markdownCode',          s:magenta, s:lightgray, '')
call s:H('markdownCodeBlock',     s:fg,      s:lightgray, '')
call s:Hfg('markdownCodeDelimiter', s:shadow, '')

call s:Hfg('markdownLinkText',       s:blue, 'underline')
call s:Hfg('markdownUrl',            s:shadow, 'underline')
call s:Hfg('markdownLinkDelimiter',  s:shadow, '')

call s:Hfg('markdownBold',       s:fg, 'bold')
call s:Hfg('markdownItalic',     s:fg, 'italic')
call s:Hfg('markdownBoldItalic', s:fg, 'bold,italic')

call s:Hfg('markdownListMarker',         s:blue, '')
call s:Hfg('markdownOrderedListMarker',  s:blue, '')

call s:Hfg('markdownRule',       s:shadow, '')
call s:H('markdownBlockquote',  s:shadow, s:bg, 'italic')

call s:Hfg('markdownImage',    s:magenta, 'bold')

" html
call s:Hfg('htmlTag',         s:shadow, '')
call s:Hfg('htmlTagName',     s:blue, '')
call s:Hfg('htmlArg',         s:cyan, '')
call s:Hfg('htmlString',      s:green, '')
call s:Hfg('htmlEvent',       s:orange, '')

" git/diff
call s:Hfg('diffAdded',     s:green, '')
call s:Hfg('diffRemoved',   s:red, '')
call s:Hfg('diffChanged',   s:orange, '')
call s:Hfg('diffFile',      s:blue, '')
call s:Hfg('diffLine',      s:shadow, '')
call s:Hfg('diffIndexLine', s:cyan, '')

" terminal fallback (16 cores)
if !has("gui_running") && &t_Co < 256
  hi Normal       ctermfg=0  ctermbg=7
  hi CursorLine   ctermbg=7
  hi LineNr       ctermfg=8
  hi CursorLineNr ctermfg=4  cterm=bold
  hi StatusLine   ctermfg=0  ctermbg=8  cterm=bold
  hi StatusLineNC ctermfg=8  ctermbg=7
  hi VertSplit    ctermfg=8  ctermbg=7
  hi Pmenu        ctermfg=0  ctermbg=7
  hi PmenuSel     ctermfg=15 ctermbg=4
  hi Search       ctermfg=15 ctermbg=4
  hi IncSearch    ctermfg=15 ctermbg=1
  hi Visual       ctermfg=15 ctermbg=4
  hi Comment      ctermfg=8  cterm=italic
  hi Constant     ctermfg=2
  hi String       ctermfg=2
  hi Number       ctermfg=5
  hi Identifier   ctermfg=4
  hi Function     ctermfg=4  cterm=bold
  hi Statement    ctermfg=1  cterm=bold
  hi Keyword      ctermfg=1  cterm=bold
  hi Type         ctermfg=6  cterm=bold
  hi Special      ctermfg=5
  hi Error        ctermfg=15 ctermbg=1
  hi Todo         ctermfg=15 ctermbg=3  cterm=bold

  hi markdownH1   ctermfg=4 cterm=bold
  hi markdownH2   ctermfg=4 cterm=bold
  hi markdownH3   ctermfg=6 cterm=bold
  hi markdownH4   ctermfg=6 cterm=bold
  hi markdownH5   ctermfg=2 cterm=bold
  hi markdownH6   ctermfg=2 cterm=bold
  hi markdownCode ctermfg=5 ctermbg=7
endif
