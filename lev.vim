set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "lev"
hi Normal		    guifg=white	guibg=black	ctermfg=NONE
hi NonText		    guifg=brown
hi Comment		    guifg=green	ctermfg=green
hi Constant		    guifg=red ctermfg=red
hi Identifier		guifg=yellow ctermfg=yellow
hi Statement		guifg=yellow ctermfg=yellow
hi Function		    guifg=yellow gui=bold ctermfg=yellow cterm=bold
hi Number		    guifg=white	ctermfg=white
hi Operator		    guifg=yellow ctermfg=yellow
hi preproc		    guifg=cyan ctermfg=cyan
hi type			    guifg=seagreen gui=bold
hi special		    guifg=yellow
hi ErrorMsg		    guifg=black	guibg=red
hi WarningMsg		guifg=black	guibg=green
hi Error		    guibg=Red
hi Todo			    guifg=Black	guibg=orange
hi Search		    guibg=lightslateblue
hi Cursor		    guibg=white ctermbg=white
hi IncSearch		gui=NONE guibg=steelblue
hi LineNr		    guifg=yellow ctermfg=214
hi title		    guifg=yellow
hi StatusLineNC		gui=NONE guifg=lightblue guibg=darkblue
hi StatusLine		guifg=cyan	gui=bold guibg=blue
hi label		    guifg=gold2
hi operator		    guifg=orange
hi Visual           ctermfg=white ctermbg=darkblue guifg=white guibg=steelblue
hi DiffChange		guibg=darkgreen
hi DiffText		    guibg=olivedrab
hi DiffAdd		    guibg=slateblue
hi DiffDelete		guibg=coral
hi Folded		    guibg=gray30
hi FoldColumn		guibg=gray30 guifg=white
hi cIf0			    guifg=gray
hi SignColumn       guibg=black ctermbg=black
hi GitGutterAdd     guifg=green ctermfg=green
hi GitGutterDelete  guifg=red ctermfg=red
hi GitGutterChange  guifg=magenta ctermfg=magenta
