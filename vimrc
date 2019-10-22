" System vimrc file for MacVim
" set nocompatible
set encoding=utf-8
scriptencoding utf-8

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix,dos
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set background=dark
set guifont=Iosevka\ Nerd\ Font\ Complete\ Mono:h13
set linespace=1

set tags=tags;
set hidden

set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=indent
set foldlevel=99

set number                      " 显示行号
set tabstop=4                   " 设定tab长度为4
set shiftwidth=4                " 缩进的空格数
set softtabstop=4
set expandtab                 " 是否在缩进和遇到Tab键时使用空格代替; 使用noexpandtab取消设置
set smarttab
set autoindent                  " 自动缩进
set smartindent
set ignorecase
set smartcase
set cindent
set confirm

set showcmd              "在状态栏显示当前输入的命令
set showmode			 "显示INSERT NORMAL等
set lazyredraw           " Don't redraw while executing macros (good performance config)

set hlsearch
set incsearch

set showmatch                   " 显示括号配对情况
set nopaste
set clipboard+=unnamed          " 与windows共享剪贴板

set history=99                  " keep 99 lines of command history
set showmatch                   " 显示括号配对情况

set shortmess=atI               " 启动的时候不显示援助索马里儿童的提示(是I而不是L)

set completeopt=longest,menu
set ruler
set cursorline
set autowrite
set magic
set nowrap
set linebreak
set iskeyword+=_,$,@,%,#,-

set backspace=indent,eol,start

set undofile

set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 禁止生成临时文件
set nobackup
set noswapfile

" set scrolloff=5
set sidescrolloff=3
set pumheight=20

" set list
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•

set formatoptions+=j              " Delete comment character when joining commented lines
set wildmenu
set wildignore+=*.un~,*.pyc,*.zip,*.rar,*.dll,*.dmg
set wildignore+=*.jpg,*.png,*.jpeg,*.gif,*.svg,*.ico
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*

set grepprg=ag\ --nocolor\ --nogroup\ --column\ --vimgrep

set t_Co=256

filetype plugin indent on

syntax enable
syntax on

" if has("persistent_undo")
"    set undodir = ~/.undodir/
" endif

"autocmd GUIEnter * simalt ~x  	" windows下启动vim最大化
if has('gui_running')
  set guioptions-=T               " windows下隐藏工具栏
  "set guioptions-=r               " 把gui右边的滑动条去掉
  set guioptions-=L               " 把gui左边的滑动条去掉
  set guioptions-=m               " 把gui的菜单栏去掉
  set guioptions-=b
  set lines=52 columns=200
endif

" make signColumn always show
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
  let g:ale_sign_column_always = 1
endif

if v:version >= 800
  packadd! matchit
else
  runtime! macros/matchit.vim
endif

" some enhanced mapping
noremap K kJ
noremap H ^
noremap L $
noremap ; :
nnoremap Q :qa!<CR>
nnoremap <leader>x :x<CR>
nnoremap U <C-r>
nnoremap <tab> %
vnoremap <tab> %
inoremap <C-tab> <c-x><c-o>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

call plug#begin('~/.vim/plugged')

let ctrlp_cmds = ['<plug>(ctrlp', 'CtrlP',
  \ 'CtrlPMixed', 'CtrlPBuffer',
  \ 'CtrlPLine', 'CtrlPUndo',
  \ 'CtrlPChange', 'CtrlPQuickfix',
  \ 'CtrlPMRU', 'CtrlPFunky',
  \ 'CtrlPCurWD']

let nerdtree_cmds = ['NERDTreeFind', 'NERDTree', 'NERDTreeToggle']

 Plug 'fholgado/minibufexpl.vim'
 Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --ts-completer' }
 Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
 Plug 'ctrlpvim/ctrlp.vim', { 'on': ctrlp_cmds }
  Plug 'tacahiroy/ctrlp-funky', { 'on': ctrlp_cmds }
 Plug 'ryanoasis/vim-devicons'
 Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
 Plug 'terryma/vim-multiple-cursors'
 Plug 'ap/vim-css-color'
 Plug 'rstacruz/vim-hyperstyle', { 'for': ['css', 'less', 'sass', 'scss'] }
 Plug 'genoma/vim-less'
 Plug 'jiangmiao/auto-pairs'
 Plug 'hail2u/vim-css3-syntax'
 Plug 'othree/html5.vim'
 Plug 'docunext/closetag.vim'
 Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xhtml', 'xml', 'javascript', 'typescript'] }
 Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }
 Plug 'terryma/vim-expand-region', { 'on': '<Plug>(expand_region' }
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'bronson/vim-trailing-whitespace'
 Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'epilande/vim-es2015-snippets', { 'for': ['javascript', 'typescript'] }
  Plug 'qiqiboy/vim-react-snippets', { 'for': ['javascript', 'typescript'] }
 Plug 'dyng/ctrlsf.vim', { 'on': ['<Plug>CtrlSF', 'CtrlSFToggle'] }
 " Plug 'pangloss/vim-javascript'
 Plug 'othree/javascript-libraries-syntax.vim'
 Plug 'neoclide/vim-jsx-improve'
 Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'], 'on': ['JsDoc', '<Plug>(jsdoc)'] }
 Plug 'Yggdroot/vim-mark', { 'on': '<Plug>MarkSearch' }
 Plug 'scrooloose/nerdtree', { 'on': nerdtree_cmds }
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': nerdtree_cmds }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': nerdtree_cmds }
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install' }
 Plug 'Yggdroot/indentLine'
 Plug 'elzr/vim-json', { 'for': 'json' }
 Plug 'dkprice/vim-easygrep', { 'on': ['<plug>EgMap', 'Grep', 'Replace'] }
 Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
 Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
 Plug 'jceb/emmet.snippets', { 'on': 'EmmetInstall' }
 Plug 'scrooloose/nerdcommenter', { 'on': '<Plug>NERDCommenter' }
 Plug 'ivyl/vim-bling'
 Plug 'Valloric/ListToggle'
 Plug 'mhinz/vim-startify'
 Plug 'matze/vim-move', { 'on': ['<Plug>MoveBlock', '<Plug>MoveLine'] }
 Plug 'tommcdo/vim-exchange', { 'on': '<Plug>(Exchange' }
 Plug 'AndrewRadev/sideways.vim', { 'on': ['SidewaysLeft', 'SidewaysRight'] }
 Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'lucasecdb/vim-tsx', { 'for': 'typescript' }
 Plug 'terryma/vim-smooth-scroll'
 Plug 'wellle/targets.vim'
 Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'lvht/tagbar-markdown', { 'for': 'markdown' }
 Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
 Plug 'airblade/vim-rooter'
 Plug 'posva/vim-vue', { 'for': 'vue' }
 Plug 'editorconfig/editorconfig-vim'
 if v:version >= 800
 Plug 'dense-analysis/ale'
 endif

 """"""""themes"""""""""""""""
 Plug 'gruvbox-community/gruvbox'
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'nanotech/jellybeans.vim'
 Plug 'rakr/vim-one'

call plug#end()

"let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'dark0'
let g:gruvbox_vert_split = 'dark0'
colorscheme gruvbox
hi VertSplit guifg=bg ctermfg=bg

" terminal
if has('terminal')
  if exists('&termwinsize')
    set termwinsize=20x0
  else
    set termsize=20x0
  endif

  nnoremap <leader>t :call <SID>OpenTerminal()<CR>
  tnoremap <c-k> <C-w>k
  tnoremap <c-n> <C-w>N
  tnoremap <c-d> <c-w>:bd!<CR>
  function! <SID>OpenTerminal()
    bo 10split
    term ++curwin ++close ++open
  endf
endif

augroup customAutocmd
  au!
  " au BufNewFile,BufRead *.jsx set filetype=javascript
  au BufNewFile,BufRead .tern-project,.eslintrc,.tslintrc,.prettierrc,.htmlhintrc setf json
  au FileType json,vim,yaml setlocal shiftwidth=2 softtabstop=2
  au FileType html,xhtml,xml,css,sass,scss,less,php,javascript,typescript.tsx EmmetInstall
  au FileType javascript,typescript.tsx UltiSnipsAddFiletypes html
  au BufWinEnter * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else | exe "norm $" | endif | endif
  au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

  "NERDTree autocmd
  " 启动vim自动打开 nerdtree
  " au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  au StdinReadPre * let s:std_in=1
  au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " autocmd FileType nerdtree setlocal ambiwidth=double
augroup END

" airline
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_powerline_fonts = 90

" minibufexplorer
hi MBENormal               guifg=#928374 guibg=fg ctermfg=244
hi MBEChanged              guifg=#CD5907 guibg=fg ctermfg=208
hi MBEVisibleNormal        guifg=#8ec07c guibg=fg ctermfg=72
hi MBEVisibleChanged       guifg=#CC241D guibg=fg ctermfg=124
hi MBEVisibleActiveNormal  guifg=#AFD700 guibg=fg ctermfg=142
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg ctermfg=167
" let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitToEdge = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplShowBufNumbers = 0
let g:did_minibufexplorer_syntax_inits = 1
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
nnoremap <leader>q :call <SID>CloseOrQuitBuffer()<CR>
function! <SID>CloseOrQuitBuffer()
  let l:buf_num = len(filter(range(1, bufnr('$')), 'buflisted(v:val) && !empty(bufname(v:val))'))
  if empty(&buftype) && l:buf_num > 1 && match(&filetype, 'fugitive') < 0
    exec ':MBEbw!'
  else
    exec 'q!'
  endif
endfunction

"auto-pair
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutJump = '<C-a>'

" YCM
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_invoke_completion = '<C-c>'
" replace with your python virtual environment path {{{
let g:ycm_python_binary_path = $HOME . '/develop/portal/venv/bin/python2'
" }}}
let g:ycm_semantic_triggers =  {
  \   'css,less,sass,scss' : ['-', 're!:\s*']
  \ }
nnoremap <leader>w :YcmCompleter GoTo<CR>
nnoremap <leader>ww :YcmCompleter GoToReferences<CR>
nnoremap <leader>wd :YcmCompleter GetDoc<CR>
nnoremap <leader>wt :YcmCompleter GetType<CR>
nnoremap <leader>wf :YcmCompleter FixIt<CR>
nnoremap <leader>wi :YcmCompleter OrganizeImports<CR>
nnoremap <leader>wr :YcmCompleter RefactorRename 

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-T)
nmap ? <Plug>(easymotion-Fn)
nmap / <Plug>(easymotion-sn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)
nmap <leader>. <Plug>(easymotion-repeat)

nmap <Leader><Leader>l <Plug>(easymotion-w)
nmap <Leader><Leader>j <Plug>(easymotion-j)
nmap <Leader><Leader>k <Plug>(easymotion-k)
nmap <Leader><Leader>h <Plug>(easymotion-b)

" vim-trailing-whitespace
map <leader><space> :FixWhitespace<CR>

" expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Tabular
nnoremap <Leader>a :Tabularize /

" UltiSnips
map <leader>ue :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger = '<a-tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_tilde_homedir = 1
nmap <Leader>p :CtrlP<CR>
nmap <Leader>pr :CtrlPMRU<CR>
nmap <Leader>pm :CtrlPMixed<CR>
nmap <Leader>pb :CtrlPBuffer<CR>
nmap <Leader>pl :CtrlPLine<CR>
nmap <Leader>pu :CtrlPUndo<CR>
nmap <Leader>pc :CtrlPChange<CR>
nmap <Leader>pq :CtrlPQuickfix<CR>
nmap <Leader>pw :CtrlPCurWD<CR>
nmap <Leader>fu :CtrlPFunky<CR>
nmap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
nmap <Space> <plug>(ctrlp)
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['mixed', 'line', 'funky', 'undo', 'changes']
let g:ctrlp_match_window = 'results:50'

" CtrlSF
nmap <Leader>sf <Plug>CtrlSFPrompt
vmap <Leader>sf <Plug>CtrlSFVwordPath
nmap <leader>sw <Plug>CtrlSFCwordPath<CR>
vmap <leader>sw <Plug>CtrlSFVwordExec
nmap <leader>st :CtrlSFToggle<CR>
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_mapping = {
    \ 'next': 'n',
    \ 'prev': 'N',
    \ }
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '50%'

"javascript libs
let g:used_javascript_libs = 'jquery,requirejs,underscore,angularjs,react,flux'

" NERDTree
let g:NERDTreeMouseMode = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeBookmarksFile = $HOME . '/.vim/.NERDTreeBookmarks'
let g:NERDTreeIgnore=['\~$', '\v\.(git|vscode|pyc|ico|png|jpeg|gif|svg|ttf|woff|woff2|eot|mp4|exe|dmg|jpg|pdf|pem|DS_Store)$']
let g:NERDTreeExtensionHighlightColor = {
  \'tsx': '834F79'
\}
noremap <F5> :NERDTreeFind<CR>
noremap <CR> :NERDTreeFind<CR>

" devicons
function! WebDevIconsGetFileTypeSymbol(...)
  return ''
endfunction

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

if has('gui_running')
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
endif

if !exists('g:ctrlp_formatline_func')
  " logic for ctrlpvim/ctrlp.vim:
  let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '
endif

" Tagbar
let g:tagbar_width = 25
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }
nnoremap <silent> <F6> :TagbarToggle<CR>

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1

" vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'
nmap m <Plug>MarkSearchOrCurNext
nmap M <Plug>MarkSearchOrCurPrev
nmap <Leader>c :nohl<CR><Plug>MarkAllClear

" vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit -m""
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gpp :Gpull<CR>

" vim-gitgutter
let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_max_signs = 1000

" vim-undotree
nnoremap <F4> :UndotreeToggle<CR>
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 3
endif

" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_path_to_chrome = 'open -a Safari'
let g:mkdp_refresh_slow = 1

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_fileType = ['javascript', 'typescript', 'typescript.tsx', 'python', 'php', 'css', 'scss', 'sass', 'less']

" emmet
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
    \'html' : {
    \    'indent_blockelement': 1
    \}
\}

" markdown toc
let g:vmt_auto_update_on_save = 0
let g:vmt_cycle_list_item_markers = 1

" vim-jsx-improve
let g:jsx_improve_motion_disable = 1

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
map <silent> <C-c> <Plug>NERDCommenterSexy
nmap <silent> <C-c> <Plug>NERDCommenterComment
map <silent> <C-x> <Plug>NERDCommenterUncomment

" easygrep
let g:EasyGrepCommand = 1
let g:EasyGrepRecursive = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepReplaceWindowMode = 2
let g:EasyGrepWindowPosition = 'botright'
let g:EasyGrepRoot = 'search:.git,.svn,.hg'
nmap <leader>vc :Grep 
map <silent> <leader>vo <plug>EgMapGrepOptions
map <silent> <leader>vv <plug>EgMapGrepCurrentWord_v
vmap <silent> <leader>vv <plug>EgMapGrepSelection_v
map <silent> <leader>va <plug>EgMapGrepCurrentWord_a
vmap <silent> <leader>va <plug>EgMapGrepSelection_a
map <silent> <leader>vr <plug>EgMapReplaceCurrentWord_r
vmap <silent> <leader>vr <plug>EgMapReplaceSelection_r

" matchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'htmldjango': 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php': 1,
    \ 'javascript' : 1,
    \ 'typescript.tsx' : 1
    \}

" vim-bling
"let g:bling_time = 80
let g:bling_count = 2
let g:bling_color_gui_fg = 'white'
let g:bling_color_gui_bg = '#af005f'

" ale
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '▸▸'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%code%]'
let g:ale_virtualenv_dir_names = ['.env', 'env', 've-py3', 've', 'virtualenv', 'venv']
let g:airline#extensions#ale#error_symbol = g:ale_sign_error . ' '
let g:airline#extensions#ale#warning_symbol = g:ale_sign_warning . ' '
let airline#extensions#ale#open_lnum_symbol = ":L"
let airline#extensions#ale#close_lnum_symbol = ''

let g:ale_linters = {
\   'javascript': ['tsserver', 'eslint'],
\   'typescript': ['tsserver', 'eslint'],
\}
" ale tslint
let g:ale_typescript_tslint_use_global = 1
let g:ale_typescript_tslint_config_path = $HOME . '/.tslint.json'
" ale fixers
nmap <leader>b <Plug>(ale_fix)
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': 'prettier',
\   'scss': 'prettier',
\   'sass': 'prettier',
\   'less': 'prettier',
\   'html': 'prettier',
\   'yaml': 'prettier',
\   'markdown': 'prettier',
\   'typescript': ['prettier', 'eslint'],
\   'json': 'prettier',
\   'vue': 'prettier',
\}

"ale tidy
"let g:ale_html_tidy_use_global = 1
let g:ale_html_tidy_options = '-q -e -language en --config ~/.tidyrc'

" ListToggle
let g:lt_quickfix_list_toggle_map = '<F2>'
let g:lt_location_list_toggle_map = '<F3>'
let g:lt_height = 10

" startify
let g:startify_padding_left = 30
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'c': '~/.vim/vimrc'}, {'z': '~/.zshrc'}, {'h': '/etc/hosts'}]
let g:startify_enable_special = 0
let g:startify_commands = [
    \ ['Status of Plugins', 'PlugStatus'],
    \ ['Install Plugins', 'PlugInstall'],
    \ ['Clean Plugins', 'PlugClean']
    \ ]
let g:startify_list_order = [
            \ [repeat(' ', g:startify_padding_left - 4) . '最近访问:'],
            \ 'files',
            \ [repeat(' ', g:startify_padding_left - 4) . '已存会话:'],
            \ 'sessions',
            \ [repeat(' ', g:startify_padding_left - 4) . '已存书签:'],
            \ 'bookmarks',
            \ [repeat(' ', g:startify_padding_left - 4) . '常用命令:'],
            \ 'commands',
            \ ]
let g:start_header = [
          \ '                                                                     ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄',
          \ '                                                                    ▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌',
          \ '                                                                     ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌',
          \ '  ██████╗  ██╗  ██████╗  ██╗ ██████╗   ██████╗ ██╗   ██╗              ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌',
          \ ' ██╔═══██╗ ██║ ██╔═══██╗ ██║ ██╔══██╗ ██╔═══██╗╚██╗ ██╔╝               ▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌',
          \ ' ██║   ██║ ██║ ██║   ██║ ██║ ██████╔╝ ██║   ██║ ╚████╔╝                 ▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌',
          \ ' ██║▄▄ ██║ ██║ ██║▄▄ ██║ ██║ ██╔══██╗ ██║   ██║  ╚██╔╝                   ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌',
          \ ' ╚██████╔╝ ██║ ╚██████╔╝ ██║ ██████╔╝ ╚██████╔╝   ██║                     ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌',
          \ '  ╚══▀▀═╝  ╚═╝  ╚══▀▀═╝  ╚═╝ ╚═════╝   ╚═════╝    ╚═╝                      ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌',
          \ '                                                                            ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌',
          \ '                                                                             ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀ ',
          \'',
          \'',
          \ repeat(' ', 6) . repeat('=', 100)
          \]
hi link StartifyHeader StartifySection

function! s:filter_header(lines) abort
    let l:longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let l:centered_lines = map(copy(a:lines),
        \ 'repeat('' '', (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_lines
endfunction
let g:startify_custom_header = s:filter_header(g:start_header)

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" vim-move
let g:move_map_keys = 0
vmap <silent> <leader>j <Plug>MoveBlockDown:call repeat#set("gv\<leader>j", v:count)<CR>
vmap <silent> <leader>k <Plug>MoveBlockUp:call repeat#set("gv\<leader>k", v:count)<CR>
nmap <silent> <leader>j <Plug>MoveLineDown:call repeat#set("\<leader>j", v:count)<CR>
nmap <silent> <leader>k <Plug>MoveLineUp:call repeat#set("\<leader>k", v:count)<CR>

" sideways.vim
nnoremap <silent> <leader>h :SidewaysLeft<CR>
nnoremap <silent> <leader>l :SidewaysRight<CR>

" vim-exchange
let g:exchange_no_mappings = 1
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 5)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 5)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 10)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 10)<CR>

if !has('gui_running')
  noremap <ScrollWheelUp> 2<C-y>
  noremap <ScrollWheelDown> 2<C-e>
endif

" vim-rooter
let g:rooter_patterns = ['package.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_silent_chdir = 1

" editorconfig
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
