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

set updatetime=1500
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

set shortmess=actI               " 启动的时候不显示援助索马里儿童的提示(是I而不是L)

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
set nowritebackup
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

set grepprg=rg\ --color=never

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

if has('popupwin')
  set completeopt+=popup
  set completepopup=height:20,width:60,highlight:Pmenu,border:off
endif

" make signColumn always show
if has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
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
nnoremap Q :qa<CR>
nnoremap <leader>x :x<CR>
nnoremap U <C-r>
nnoremap <tab> %
vnoremap <tab> %
inoremap <C-tab> <c-x><c-o>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
vnoremap <Backspace> s
vnoremap <Delete> s

call plug#begin('~/.vim/plugged')

let ctrlp_cmds = ['<plug>(ctrlp', 'CtrlP',
  \ 'CtrlPMixed', 'CtrlPBuffer',
  \ 'CtrlPLine', 'CtrlPUndo',
  \ 'CtrlPChange', 'CtrlPQuickfix',
  \ 'CtrlPMRU', 'CtrlPFunky',
  \ 'CtrlPCurWD']

let nerdtree_cmds = ['NERDTreeFind', 'NERDTree', 'NERDTreeToggle']
let indentLine_types = ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescriptreact', 'vue', 'python', 'php', 'css', 'scss', 'sass', 'less']
let htmltag_types = ['html', 'htmldjango', 'xhtml', 'xml', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact']

 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
 Plug 'ctrlpvim/ctrlp.vim', { 'on': ctrlp_cmds }
  Plug 'tacahiroy/ctrlp-funky', { 'on': ctrlp_cmds }
 Plug 'ryanoasis/vim-devicons'
 Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
 Plug 'mg979/vim-visual-multi'
 Plug 'rstacruz/vim-hyperstyle', { 'for': ['css', 'less', 'sass', 'scss'] }
 Plug 'jiangmiao/auto-pairs'
 Plug 'hail2u/vim-css3-syntax'
 Plug 'othree/html5.vim',  { 'for':htmltag_types }
 Plug 'docunext/closetag.vim', { 'for': htmltag_types }
 Plug 'Valloric/MatchTagAlways', { 'for': htmltag_types }
 Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }
 Plug 'terryma/vim-expand-region', { 'on': '<Plug>(expand_region' }
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'bronson/vim-trailing-whitespace'
 Plug 'honza/vim-snippets'
 Plug 'qiqiboy/vim-react-snippets', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
 Plug 'dyng/ctrlsf.vim', { 'on': ['<Plug>CtrlSF', 'CtrlSFToggle'] }
 Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'] }
 Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'typescriptreact'] }
 Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'], 'on': ['JsDoc', '<Plug>(jsdoc)'], 'do': 'make install' }
 Plug 'Yggdroot/vim-mark', { 'on': '<Plug>MarkSearch' }
 Plug 'preservim/nerdtree', { 'on': nerdtree_cmds }
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': nerdtree_cmds }
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install' }
 Plug 'Yggdroot/indentLine'
 Plug 'elzr/vim-json', { 'for': 'json' }
 Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
 Plug 'scrooloose/nerdcommenter', { 'on': '<Plug>NERDCommenter' }
 Plug 'ivyl/vim-bling'
 Plug 'mhinz/vim-startify'
 Plug 'matze/vim-move', { 'on': ['<Plug>MoveBlock', '<Plug>MoveLine'] }
 Plug 'tommcdo/vim-exchange', { 'on': '<Plug>(Exchange' }
 Plug 'AndrewRadev/sideways.vim', { 'on': ['SidewaysLeft', 'SidewaysRight'] }
 Plug 'terryma/vim-smooth-scroll'
 Plug 'wellle/targets.vim'
 Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
 Plug 'airblade/vim-rooter'
 Plug 'posva/vim-vue', { 'for': 'vue' }
 Plug 'editorconfig/editorconfig-vim'
 Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
 Plug 'chr4/nginx.vim', { 'for': 'nginx' }
 Plug 'tomlion/vim-solidity'
 Plug 'rhysd/git-messenger.vim', { 'on': ['<Plug>(git-messenger)', 'GitMessenger'] }

 """"""""themes"""""""""""""""
 Plug 'gruvbox-community/gruvbox'
 " Plug 'NLKNguyen/papercolor-theme'
 " Plug 'nanotech/jellybeans.vim'
 " Plug 'rakr/vim-one'
 " Plug 'joshdick/onedark.vim'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'dark0_hard'
let g:gruvbox_vert_split = 'dark0_hard'
let g:gruvbox_invert_indent_guides = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_tabline = 1
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
  au BufNewFile,BufRead *.jsx set filetype=javascript
  au BufNewFile,BufRead .tern-project,.eslintrc,.tslintrc,.prettierrc,.htmlhintrc setf json
  au BufNewFile,BufRead *.wxml setf html
  au BufNewFile,BufRead *.conf setf nginx
  au FileType json,vim,yaml setlocal shiftwidth=2 softtabstop=2
  au BufWinEnter * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else | exe "norm $" | endif | endif
  au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

  " NERDTree autocmd
  " 启动vim自动打开 nerdtree
  " au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  au StdinReadPre * let s:std_in=1
  au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " autocmd FileType nerdtree setlocal ambiwidth=double
augroup END

" airline
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_detect_iminsert = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
" let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'

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
let g:miniBufExplDebugMode = 3
let g:miniBufExplDebugLevel = 4
noremap <C-TAB>   :bn!<CR>
noremap <C-S-TAB> :bp!<CR>
nnoremap <leader>q :call <SID>CloseOrQuitBuffer()<CR>
function! <SID>CloseOrQuitBuffer()
  let l:buf_num = len(filter(range(1, bufnr('$')), 'buflisted(v:val) && !empty(bufname(v:val))'))
  if empty(&buftype) && l:buf_num > 1 && match(&filetype, 'fugitive') < 0
    " exec ':MBEbw!'
    let l:cur_buf = bufnr('%')
    if bufnr('#') > -1
      exec ':b!' . bufnr('#')
    else
      exec ':bp!'
    endif
    exec 'bw! ' . l:cur_buf
  else
    exec 'q!'
  endif
endfunction

"auto-pair
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutJump = '<C-a>'

" Coc
let g:coc_global_extensions = [
      \ 'coc-highlight',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-html',
      \ 'coc-emmet',
      \ 'coc-htmldjango',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ '@yaegassy/coc-volar',
      \ 'coc-markdownlint',
      \ 'coc-docker',
      \ '@yaegassy/coc-nginx',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-markdownlint',
      \ 'coc-solidity',
      \ 'coc-htmlhint',
      \ 'coc-spell-checker',
\]
let airline#extensions#coc#warning_symbol = '▸▸'
let airline#extensions#coc#error_symbol = '>>'
let airline#extensions#coc#open_lnum_symbol = ":L"
let airline#extensions#coc#close_lnum_symbol = ''
let g:coc_snippet_prev = '<C-k>'
let g:coc_snippet_next = '<C-j>'

hi link CocHighlightText Cursor
hi link CocSemDeclaration GruvboxAqua
hi link CocDeprecatedHighlight Comment

inoremap <silent><expr> <c-z> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <UP>
      \ pumvisible() ? "\<C-p>" : "\<UP>"
inoremap <silent><expr> <DOWN>
      \ pumvisible() ? "\<C-n>" : "\<DOWN>"

nmap <silent> <leader>w <Plug>(coc-definition)
nmap <silent> <leader>wt <Plug>(coc-type-definition)
nmap <silent> <leader>wi <Plug>(coc-implementation)
nmap <silent> <leader>ww <Plug>(coc-references)
nmap <leader>wr <Plug>(coc-rename)
nmap <leader>wf <Plug>(coc-refactor)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <F2> :CocList diagnostics<CR>
nnoremap <silent> <F3> :call <SID>ToggleOutline()<CR>

nnoremap <silent> <leader>wd :call <SID>ShowDocumentation()<CR>

vmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <plug>(coc-codeaction)

vmap <silent> <leader>b <Plug>(coc-format-selected)
nnoremap <silent> <leader>b :call <SID>CallFormatAndAutofix()<CR>

imap <silent> <A-Tab> <Plug>(coc-snippets-expand)
imap <silent> <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <C-x> CocActionAsync('showSignatureHelp')

augroup cocgroup
  autocmd!
  autocmd FileType javascript,javascriptreact,typescript,\
                  \ typescriptreact,vue,json,scss,less,sass,css
                  \ setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType htmldjango nmap <silent> <leader>b :call CocAction('runCommand','prettier.formatFile')<CR>
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHold * silent call <SID>ShowDocIfNoDiagnostic()
augroup end

function! s:ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    silent call CocActionAsync('definitionHover')
  endif
endfunction

function! s:ShowDocIfNoDiagnostic() abort
  if (!coc#float#has_float() && CocAction('hasProvider', 'hover'))
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:CallFormatAndAutofix() abort
  if (CocAction('hasProvider', 'format'))
    silent call CocAction('format')
    if (match(['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html', 'vue'], &filetype) >= 0)
        silent call CocAction('runCommand','eslint.executeAutofix')
    endif
  endif
endfunction

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:ToggleOutline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call coc#window#close(winid)
  endif
endfunction

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
nmap ? <Plug>(easymotion-repeat)
nmap / <Plug>(easymotion-sn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)

nmap <Leader><Leader>l <Plug>(easymotion-W)
nmap <Leader><Leader>j <Plug>(easymotion-j)
nmap <Leader><Leader>k <Plug>(easymotion-k)
nmap <Leader><Leader>h <Plug>(easymotion-B)

" vim-trailing-whitespace
map <leader><space> :FixWhitespace<CR>

" expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ctrlp
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
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
nmap <Leader>z :CtrlPBuffer<CR>
let g:ctrlp_root_markers = ['package.json']
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
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_extra_root_markers = ['package.json']
let g:ctrlsf_mapping = {
    \ 'next': 'n',
    \ 'prev': 'N',
    \ }
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '50%'

" NERDTree
let g:NERDTreeMouseMode = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeBookmarksFile = $HOME . '/.vim/.NERDTreeBookmarks'
let g:NERDTreeIgnore=['\~$', '\v\.(git|vscode|pyc|ico|png|jpeg|gif|svg|ttf|woff|woff2|eot|mp4|exe|dmg|jpg|pdf|pem|DS_Store)$']
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

" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowClean = 1

if !exists('g:ctrlp_formatline_func')
  " logic for ctrlpvim/ctrlp.vim:
  let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '
endif

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1


" vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_lehre_path = '/usr/local/bin/lehre'
let g:jsdoc_formatter = 'tsdoc'

" vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'
nmap m <Plug>MarkSearchOrCurNext
nmap M <Plug>MarkSearchOrCurPrev
nmap <Leader>c :nohl<CR><Plug>MarkAllClear

" vim-fugitive
nnoremap <Leader>gs :Git status<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gc :Git commit -m""
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gl :Git log
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gpp :Git pull<CR>

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
let g:indentLine_fileType = indentLine_types

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

" matchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'htmldjango': 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php': 1,
    \ 'vue': 1,
    \ 'javascript' : 1,
    \ 'javascriptreact' : 1,
    \ 'typescriptreact' : 1
    \}

" vim-bling
"let g:bling_time = 80
let g:bling_count = 2
let g:bling_color_gui_fg = 'white'
let g:bling_color_gui_bg = '#af005f'

" dart
let g:dart_html_in_string=v:true
let g:dart_style_guide = 2

" startify
let g:startify_padding_left = 30
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'c': '~/.vim/vimrc'}, {'z': '~/.zshrc'}, {'h': '/etc/hosts'}]
let g:startify_enable_special = 0
let g:startify_files_number = 15
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
let g:start_indent_str = repeat(' ', (100 - strwidth('░██████╗░░░░░░░██╗░░░██╗██╗███╗░░░███╗')) / 2)
let g:start_header = [
            \ g:start_indent_str . '░██████╗░░░░░░░██╗░░░██╗██╗███╗░░░███╗',
            \ g:start_indent_str . '██╔═══██╗░░░░░░██║░░░██║██║████╗░████║',
            \ g:start_indent_str . '██║██╗██║█████╗╚██╗░██╔╝██║██╔████╔██║',
            \ g:start_indent_str . '╚██████╔╝╚════╝░╚████╔╝░██║██║╚██╔╝██║',
            \ g:start_indent_str . '░╚═██╔═╝░░░░░░░░░╚██╔╝░░██║██║░╚═╝░██║',
            \ g:start_indent_str . '░░░╚═╝░░░░░░░░░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',
            \ '',
            \ repeat('═', 100)
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

" git-messager
let g:git_messenger_no_default_mappings = 1
let g:git_messenger_always_into_popup = 1

nmap <Leader>gm <Plug>(git-messenger)
