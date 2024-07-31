""" The following lines are required by vim-plug: """

set nocompatible 
filetype off

" Make fzf available on MacOS:
if isdirectory('/usr/local/opt/fzf')
    set rtp+=/usr/local/opt/fzf
endif

" Install vim-plug if it isn't present:
if has('nvim')
    let data_dir = '~/.local/share/nvim/site'
else
    let data_dir = '~/.vim'
endif
let autoload_dir = data_dir . '/autoload'
if empty(glob(autoload_dir . '/plug.vim'))
    silent execute '!curl -fLo '.autoload_dir.'/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC
endif

" Initialize vim-plug:
let plugged_dir = data_dir . '/plugged'
call plug#begin(plugged_dir)

" Let vim-plug manage vim-plug; update local copy of plug.vim from clone of
" repo:
Plug 'junegunn/vim-plug', {'do': 
    \ 'test '.plugged_dir.'/vim-plug/plug.vim -nt '.
    \ autoload_dir.'/plug.vim && cp -p '.plugged_dir.'/vim-plug/plug.vim '.autoload_dir.'/plug.vim'}

" Other plugins managed by vim-plug:
" ale requires vim8
" if v:version >= 800
"    Plug 'w0rp/ale'
" endif
if !has('nvim')
    Plug 'andrep/vimacs'
endif
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'vim-syntastic/syntastic'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jamessan/vim-gnupg'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/calendar.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-titlecase'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jalvesaq/Nvim-R'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-AdvancedSorters'
Plug 'skywind3000/asyncrun.vim'
Plug 'chrisbra/csv.vim'
Plug 'lebedov/mdnav'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SidOfc/mkdx'
Plug 'sunaku/vim-dasht'
Plug 'lepture/vim-jinja'
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
" Plug 'pyarmak/vim-pandoc-live-preview'
" Plug 'roblillack/vim-bufferlist'
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/vimshell.vim'
" Plug 'tshirtman/vim-cython', {'for': 'cython'}
" Plug 'pydave/AsyncCommand'
" Plug 'tmhedberg/matchit'
" Plug 'majutsushi/tagbar'
" Plug 'tomtom/tcomment_vim'
" Plug 't9md/vim-choosewin'
" Plug 'vim-scripts/taglist.vim'
" Plug 'jlanzarotta/bufexplorer'
" Plug 'fweep/vim-tabber'
" Plug 'm42e/vim-gcov-marker'
" Plug 'drmingdrmer/vim-tabbar'
" Plug 'davidhalter/jedi-vim.git'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" Plug 'klen/python-mode'
call plug#end()

""" End lines required by vim-plug

set rtp+=~/.vim/plugged/vimacs/plugin
filetype plugin indent on

" Bind various keys:
map <A-b> :buffers<CR>:buffer<Space>
imap <A-b> <ESC> :buffers<CR>:buffer<Space>

map <F5> :set norl nohkmap<CR>
map <F8> :set rl hkmap<CR>
imap <F5> <ESC>:set norl nohkmap<CR>a
imap <F8> <ESC>:set rl hkmap<CR>a
map <C-\> :NERDTreeToggle<CR>
imap <C-\> <ESC>:NERDTreeToggle<CR>a

" Don't create backup files:
set nobackup

" Turn on line numbers:
set number

" Automatically indent lines:
set autoindent

" Setup line wrapping:
set whichwrap=b,s,<,>,[,]
set wrap
set textwidth=80

" Set formatting options:
au FileType text,rst,md,tex set fo=aw

" Default file encoding:
set encoding=utf-8

" Turn on spell checking for certain file types:
au FileType latex,tex,md,markdown,rst,text setlocal spell

" Always indent list items by 4 spaces in markdown mode:
" let g:vim_markdown_new_list_item_indent = 4

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" Set color scheme:
colorscheme lev

" Always keep status line visible:
set laststatus=2

let python_highlight_all=1

set ts=4 sw=4 et

" File type-specific editor configuration:
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=0 smarttab
au FileType cpp setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=0 smarttab
au FileType pandoc setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=0 smarttab textwidth=80
au FileType markdown setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=0 smarttab textwidth=80
au FileType json setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=0 smarttab

" Disable pandoc folding module because it can be slow:
let g:pandoc#modules#disabled = ["folding"]

" Don't de-indent labels:
set cinoptions+=L0

" Enable vimacs:
let g:VM_Enabled=1

" Don't let vimacs automatically increase the command height:
let g:VM_CmdHeightAdj=0

" Configure syntastic:
" let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': ['python']}
let g:syntastic_cpp_include_dirs=['/usr/local/include/', '/usr/local/include/eigen3']
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_python_pylint_args = '-E'
let g:syntastic_python_checkers=['pyflakes', 'python3']

" Use glyphs in Ale:
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⭕'
 
" Highlight search results:
set hlsearch

" Configure rainbow parentheses:
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'ctermfgs': ['cyan', 'red', 'green', 'blue', 'magenta', 'brown'],
\ 'operators': '_,_',
\ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 
\                 'start=/</ end=/>/ fold', 'start=/{/ end=/}/ fold']
\}

" Configure indent guides:
let g:indent_guides_guide_size = 1

" Use horizontally split window for taglist:
let Tlist_Use_Horiz_Window = 1
let Tlist_WinHeight = 20

" Configure bufferlist:
map <silent> <F3> :call BufferList()<CR>
hi BufferSelected term=NONE cterm=bold ctermbg=blue ctermfg=white
hi BufferNormal term=reverse

" Configure gutter:
"hi SignColumn ctermbg=236
"hi GitGutterAdd ctermfg=green ctermbg=black cterm=bold
"hi GitGutterDelete ctermfg=red ctermbg=black cterm=bold
"hi GitGutterChange ctermfg=magenta ctermbg=black cterm=bold 

" Configure jedi:
let g:jedi#auto_initialization = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "2"

" Use old regexp engine to prevent easytags from slowing down:
" set regexpengine=0

" Make easytags operate asynchronously:
" let g:easytags_async = 1

" Prevent rope from slowing down vim in python-mode:
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_lint = 0
let g:pymode_lint_write = 0

" Enable opening of MATLAB files by using the 'gf' command when the cursor
" is over the corresponding function name:
set suffixesadd+=.m

" Use UTF-8:
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=utf-8
endif

" NERDTree configuration:
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Set font used by gvim:
if has('gui_running')
    if has('gui_macvim')
"        set guifont=InconsolataNerdFontCompleteM-Medium:h18
        set guifont=InconsolataNF-Regular:h18
    else
        set guifont=Inconsolata\ Nerd\ Font\ Regular\ Medium\ 18
    endif

    " Turn off menubar and toolbar:
    set guioptions-=m
    set guioptions-=T
endif

" Activate powerline if python3 support is available:
" NOTE: vim uses whatever python executable/library it was compiled against,
" which may differ from the python in the currently active conda environment:
" if has('python3')
"    python3 << EOF
" import glob, os, pathlib, sys
" if 'CONDA_PYTHON_EXE' in os.environ:
"     conda_root = str(pathlib.Path(os.environ['CONDA_PYTHON_EXE']).parent.parent)
"     sys.path.insert(0, glob.glob(conda_root+'/lib/python3.*/site-packages')[0])
"     from powerline.vim import setup as powerline_setup
"     powerline_setup()
"     del powerline_setup
" EOF
" endif

let g:airline_theme='cool'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Always show tabline:
set showtabline=2

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Start markserv using parent dir of currently open file as root:
command! StartMarkServ AsyncRun -cwd=$(VIM_FILEDIR) markserv -b qutebrowser 

" Use ag in ack.vim:
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

if has('macunix')
    let g:livepreview_previewer = 'open -a Preview'
else
    let g:livepreview_previewer = 'evince'
endif

let g:mkdp_browser = 'qutebrowser'

autocmd BufNewFile,BufRead *.pmd set filetype=pymdnoweb
autocmd BufNewFile,BufRead *.rstw set filetype=pyrstnoweb

" Commands for backing up and restoring contents of ~/.vim/plugged/ so that
" they can be saved in a git repo and immediately installed without checking
" them out individually:
command! BackupPlugins !tar -C ~/.vim -zcvf ~/.vim/plugged.tar.gz plugged
command! RestorePlugins !tar -C ~/.vim -zxf ~/.vim/plugged.tar.gz

" Shortcut to jump to definition with Coc:
nmap <silent> gd <Plug>(coc-definition)

" Disable Coc completion suggestions for several file types:
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType python let b:coc_suggest_disable = 1

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Dasht search keys:
" search related docsets
nnoremap <Leader>k :Dasht<Space>

" search ALL the docsets
nnoremap <Leader><Leader>k :Dasht!<Space>

" search related docsets
nnoremap <silent> <Leader>K :call Dasht(dasht#cursor_search_terms())<Return>

" search ALL the docsets
nnoremap <silent> <Leader><Leader>K :call Dasht(dasht#cursor_search_terms(), '!')<Return>
