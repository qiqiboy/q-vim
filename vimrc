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
set guifont=FantasqueSansMono\ Nerd\ Font:h13
set linespace=0
set noimdisable     " Vim 会在离开 Insert 模式时自动切换至英文输入法

set updatetime=1000
set tags=tags;
set hidden

set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldcolumn=1
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
set fillchars+=vert:\           " hide verical split line

set backspace=indent,eol,start

set undofile

set mouse=a
" set mousemoveevent
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

set formatoptions+=jroc
set wildmenu
set wildignore+=*.un~,*.pyc,*.zip,*.rar,*.dll,*.dmg
set wildignore+=*.jpg,*.png,*.jpeg,*.gif,*.svg,*.ico,*.mp3,*.mp4,*.wav
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*

set grepprg=rg\ --color=never

filetype plugin indent on

syntax enable
syntax on

" if has("persistent_undo")
"    set undodir = ~/.undodir/
" endif

" enable 24bit colors in vim's builtin terminal
if !empty($VIM_TERMINAL)
  set termguicolors
endif

"autocmd GUIEnter * simalt ~x  	" windows下启动vim最大化
if has('gui_running')
  set guioptions-=T               " windows下隐藏工具栏
  "set guioptions-=r              " 把gui右边的滑动条去掉
  set guioptions-=L               " 把gui左边的滑动条去掉
  set guioptions-=m               " 把gui的菜单栏去掉
  set guioptions-=b
  set lines=45 columns=180

  set macmeta                     " Use option (alt) as meta key
endif

if has('popupwin')
  set completeopt+=popup
  set completepopup=height:20,width:60,highlight:Pmenu,border:off
endif

" make signColumn always show
if has('nvim') || has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
endif

" Disable HIG Cmd and Option movement mappings
let g:macvim_skip_cmd_opt_movement = 1

" some enhanced mapping
nnoremap K kJ
nnoremap H ^
nnoremap L $
nnoremap ; :
nnoremap Q :qa<CR>
nnoremap <leader>x :x<CR>
nnoremap U <C-r>
nmap <Tab> %
vmap <Tab> %
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
vnoremap <Backspace> s
vnoremap <Delete> s

if has('nvim')
set runtimepath+=$HOME/.vim
endif

call plug#begin('~/.vim/plugged')

let nerdtree_cmds = ['NERDTreeFind', 'NERDTree', 'NERDTreeToggle']
let htmltag_types = ['html', 'htmldjango', 'xhtml', 'xml', 'vue', 'javascript', 'javascriptreact',
        \ 'typescript', 'typescriptreact']

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm i --no-save && npm run build'}
Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'Yggdroot/LeaderF'
Plug 'mg979/vim-visual-multi'
Plug 'qiqiboy/vim-hyperstyle', { 'for': ['css', 'less', 'sass', 'scss'] }
Plug 'jiangmiao/auto-pairs'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim',  { 'for':htmltag_types }
Plug 'docunext/closetag.vim', { 'for': htmltag_types }
Plug 'andymass/vim-matchup'
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }
Plug 'terryma/vim-expand-region', { 'on': '<Plug>(expand_region' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'honza/vim-snippets'
Plug 'qiqiboy/vim-react-snippets', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'dyng/ctrlsf.vim', { 'on': ['<Plug>CtrlSF', 'CtrlSFToggle'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'typescriptreact'] }
Plug 'Yggdroot/vim-mark', { 'on': '<Plug>MarkSearch' }
Plug 'preservim/nerdtree', { 'on': nerdtree_cmds }
 Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': nerdtree_cmds }
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': nerdtree_cmds }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && npm install' }
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'scrooloose/nerdcommenter', { 'on': '<Plug>NERDCommenter' }
Plug 'ivyl/vim-bling'
Plug 'mhinz/vim-startify'
Plug 'matze/vim-move', { 'on': ['<Plug>MoveBlock', '<Plug>MoveLine'] }
Plug 'tommcdo/vim-exchange', { 'on': '<Plug>(Exchange' }
Plug 'AndrewRadev/sideways.vim', { 'on': ['SidewaysLeft', 'SidewaysRight'] }
Plug 'psliwka/vim-smoothie'
Plug 'wellle/targets.vim'
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'airblade/vim-rooter'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'editorconfig/editorconfig-vim', { 'tag': 'v1.1.1' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'farmergreg/vim-lastplace'
Plug 'qiqiboy/copilot.vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

""""""""themes"""""""""""""""
Plug 'gruvbox-community/gruvbox'

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
hi FoldColumn guifg=Grey30 guibg=NONE ctermfg=239 ctermbg=NONE
hi link Terminal Normal

" terminal
if has('terminal') || has('nvim')
  nnoremap <leader>t :call <SID>OpenTerminal()<CR>

  if has('nvim')
    tnoremap <ESC> <c-\><C-n>
    tnoremap <c-k> <c-\><C-n><C-w>k
    tnoremap <c-d> <c-\><C-n>:q!<CR>
  else
    tnoremap <c-k> <C-w>k
    tnoremap <c-n> <C-w>N
    tnoremap <c-d> <c-w>:bd!<CR>
  endif

  function! <SID>OpenTerminal()
    bo 20split
    if has('nvim')
      term!
    else
      term ++curwin ++close ++open ++kill=kill
    endif
  endf
endif

augroup customAutocmd
  au!
  au BufNewFile,BufRead .tern-project,.eslintrc,.tslintrc,.prettierrc,.htmlhintrc setf json
  au BufNewFile,BufRead *.wxml setf html
  au BufNewFile,BufRead *.conf setf nginx
  au BufNewFile,BufRead *.ttss setf css
  au BufNewFile,BufRead *.ttml setf html
  au FileType json,vim,yaml setlocal shiftwidth=2 softtabstop=2
  au FileType javascript,javascriptreact,typescript,typescriptreact,dart,java,css setlocal foldmethod=syntax
  au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

  " NERDTree autocmd
  " 启动vim自动打开 nerdtree
  " au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  au StdinReadPre * let s:std_in=1
  au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
augroup END

" airline
" let g:airline_left_sep=""
" let g:airline_right_sep=""
let g:airline_detect_iminsert = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'

" airline-tabline
nnoremap <C-TAB>   :bn!<CR>
nnoremap <C-S-TAB> :bp!<CR>
nnoremap <leader>q :call <SID>CloseOrQuitBuffer()<CR>
function! <SID>CloseOrQuitBuffer()
  let l:buf_num = len(filter(range(1, bufnr('$')), 'buflisted(v:val) && !empty(bufname(v:val))'))
  if empty(&buftype) && l:buf_num > 1 && match(&filetype, 'fugitive') < 0
    let l:cur_buf = bufnr('%')
    if bufnr('#') > -1 && empty(getbufvar(bufnr('#'), "&bt"))
      exec 'b!' . bufnr('#')
    else
      exec 'bp!'
    endif
    if tabpagenr('$') > 1 && len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) <= 1
        exec 'tabclose!'
    endif
    exec 'bw! ' . l:cur_buf
  else
    exec 'q!'
  endif
endfunction

" auto-pair
let g:AutoPairsMapBS = 0
let g:AutoPairsMapCh = 0
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump = '<C-a>'
let g:AutoPairsMoveCharacter = ''

" coc.nvim
let g:coc_global_extensions = [
      \ 'coc-highlight',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-html',
      \ 'coc-htmlhint',
      \ 'coc-htmldjango',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ '@yaegassy/coc-volar',
      \ 'coc-docker',
      \ '@yaegassy/coc-nginx',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-solidity',
      \ 'coc-lua',
      \ 'coc-pyright',
      \ 'coc-sh',
      \ 'coc-go',
      \ 'coc-sourcekit',
      \ 'coc-flutter',
      \ 'coc-tabnine',
      \ 'coc-clangd',
      \ 'coc-rust-analyzer',
      \ 'coc-spell-checker',
      \ 'coc-code-translate',
\]
let airline#extensions#coc#warning_symbol = "\uf071 "
let airline#extensions#coc#error_symbol = "\uf188 "
let airline#extensions#coc#open_lnum_symbol = ":L"
let airline#extensions#coc#close_lnum_symbol = ''
let g:coc_snippet_prev = '<C-k>'
let g:coc_snippet_next = '<C-j>'

hi! link CocHighlightText Cursor
hi! link CocSemDeclaration GruvboxAqua
hi! link CocUnusedHighlight Comment
hi! link CocMenuSel PmenuSel
hi! link CocSearch GruvboxYellow
hi! link CocFloatDividingLine GruvboxBg3
hi! link CocInlayHint Folded
hi! link CocInlayHintParameter WildMenu
hi CocErrorVirtualText gui=italic guifg=#ff6464 guibg=#2f0505 ctermfg=196 ctermbg=52
hi CocWarningVirtualText gui=italic gui=italic guifg=#fa973a guibg=#2c1603 ctermfg=214 ctermbg=94
hi CocStrikeThrough gui=italic,strikethrough guifg=#928374 term=italic,strikethrough ctermfg=245

inoremap <silent><expr> <C-z> coc#refresh()
inoremap <silent><expr> <D-i> coc#refresh()
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? <SID>InsertPumOrJumpNext() :
        \ copilot#Accept({ -> <SID>CheckBackspace() ? "\<TAB>" : coc#refresh() })
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <C-TAB> coc#pum#visible() ? copilot#Accept({ -> coc#next(1) }) :
        \ coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <Backspace> coc#pum#visible() ?
        \ "\<BS>\<c-r>=coc#start()\<CR>" : "\<c-r>=AutoPairsDelete()\<CR>"
inoremap <silent><expr> <C-h> coc#pum#visible() ?
        \ "\<C-h>\<c-r>=coc#start()\<CR>" : "\<c-r>=AutoPairsDelete()\<CR>"
inoremap <silent><expr> <C-w> coc#pum#visible() ?
        \ "\<C-w>\<c-r>=coc#start()\<CR>" : "\<C-w>"
inoremap <silent><expr> <ESC> coc#pum#visible() ?
        \ coc#pum#stop() : "\<ESC>"
inoremap <silent><expr> <C-d>
        \ coc#pum#visible() ? coc#pum#scroll(1) : "\<C-d>"
inoremap <silent><expr> <C-u>
        \ coc#pum#visible() ? coc#pum#scroll(0) : "\<C-u>"
inoremap <silent><expr> <C-e>
        \ coc#pum#visible() ? coc#pum#cancel() : "<C-R>=AutoPairsFastWrap()<CR>"
inoremap <silent><expr> <C-p>
        \ coc#pum#visible() ? coc#pum#prev(1) : "\<cmd>LeaderfFile\<CR>"
inoremap <silent><expr> <UP>
        \ coc#pum#visible() ? (coc#pum#info()['reversed'] ? coc#pum#next(1) : coc#pum#prev(1)) :
        \ "\<UP>"
inoremap <silent><expr> <DOWN>
        \ coc#pum#visible() ? (coc#pum#info()['reversed'] ? coc#pum#prev(1) : coc#pum#next(1)) :
        \ "\<DOWN>"

nmap <silent> <leader>w <Plug>(coc-definition)
nmap <silent> <leader>wt <Plug>(coc-type-definition)
nmap <silent> <leader>wi <Plug>(coc-implementation)
nmap <silent> <leader>ww <Plug>(coc-references)
nmap <silent> <leader>wr <Plug>(coc-rename)
nmap <silent> <leader>wf <Plug>(coc-refactor)
nmap <silent> <leader>wc  <Plug>(coc-codelens-action)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <F2> :call <SID>ToggleDiagnostics()<CR>
nnoremap <silent> <F3> :call <SID>ToggleOutline()<CR>
nnoremap <silent> <leader>ss :CocList symbols<CR>

nnoremap <silent> <leader>wd :call <SID>ShowDocumentation()<CR>
nnoremap <silent> <leader>wci :call CocAction('showIncomingCalls')<CR>
nnoremap <silent> <leader>wco :call CocAction('showOutgoingCalls')<CR>

vmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <plug>(coc-codeaction)

vmap <silent> <leader>b <Plug>(coc-format-selected)
nnoremap <silent> <leader>b :call <SID>CallFormatAndAutofix()<CR>

imap <silent> <M-Tab> <Plug>(coc-snippets-expand)
imap <silent> <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <C-x> CocActionAsync('showSignatureHelp')

nmap <leader>i <cmd>CocCommand document.toggleInlayHint<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
nmap <C-f> <cmd>call <SID>DoSmoothieScroll('forward')<CR>
nmap <C-b> <cmd>call <SID>DoSmoothieScroll('backward')<CR>
vmap <C-f> <cmd>call <SID>DoSmoothieScroll('forward')<CR>
vmap <C-b> <cmd>call <SID>DoSmoothieScroll('backward')<CR>
imap <C-f> <cmd>call <SID>DoSmoothieScroll('right')<CR>
imap <C-b> <cmd>call <SID>DoSmoothieScroll('left')<CR>

augroup cocgroup
  autocmd!
  autocmd FileType javascript,javascriptreact,typescript,\
                  \ typescriptreact,vue,json,scss,less,sass,css
                  \ setl formatexpr=CocAction('formatSelected')
  autocmd FileType startify let b:no_cursor_hold = 1
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CursorHold * if !exists('b:no_cursor_hold') && exists('*CocAction') | silent! call CocActionAsync('highlight') | endif
  autocmd CursorHold * if !exists('b:no_cursor_hold') && exists('*CocAction') | silent! call <SID>ShowDocIfNoDiagnostic() | endif
augroup end

function! s:ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    silent! call CocActionAsync('definitionHover')
  endif
endfunction

function! s:ShowDocIfNoDiagnostic() abort
  if (!coc#float#has_float() && CocAction('hasProvider', 'hover'))
    silent! call CocActionAsync('doHover')
  endif
endfunction

function! s:CallFormatAndAutofix() abort
  if CocAction('hasProvider', 'format')
    silent! call CocAction('format')
  else
    silent! call CocAction('runCommand','prettier.formatFile')
  endif

  if (match(['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html', 'vue'], &filetype) >= 0)
    silent! call CocAction('runCommand','eslint.executeAutofix')
  endif
endfunction

function! s:CheckBackspace() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

function! s:InsertPumOrJumpNext() abort
  let l:info = coc#pum#info()
  let l:cword = strcharpart(getline('.'), col('.') - strlen(l:info['word']) - 1, strlen(l:info['word']))

  if !l:info['inserted'] && l:info['word'] != l:cword
    call timer_start(10, { -> coc#pum#select(l:info['index'], 1, 0) })
    return "\<Ignore>"
  endif

  return coc#pum#next(1)
endfunction

function! s:ToggleOutline() abort
  let l:winid = coc#window#find('cocViewId', 'OUTLINE')
  if l:winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call coc#window#close(l:winid)
  endif
endfunction

function! s:ToggleDiagnostics() abort
  if get(getloclist(0, {'winid':0}), 'winid', 0)
    silent! exec 'lclose'
  else
    silent! exec 'CocDiagnostics'
  endif
endfunction

function! s:DoSmoothieScroll(dir) abort
  if a:dir == 'forward'
    if coc#float#has_scroll() | call coc#float#scroll(1) | else | call smoothie#forwards() | endif
  elseif a:dir == 'backward'
    if coc#float#has_scroll() | call coc#float#scroll(0) | else | call smoothie#backwards() | endif
  elseif a:dir == 'right'
    if coc#float#has_scroll() | call coc#float#scroll(1) | elseif !coc#pum#visible() | call feedkeys("\<Right>") | endif
  elseif a:dir == 'left'
    if coc#float#has_scroll() | call coc#float#scroll(0) | elseif !coc#pum#visible() | call feedkeys("\<Left>") | endif
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
let g:extra_whitespace_ignored_filetypes = ['startify']
map <leader><space> :FixWhitespace<CR>

" expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" LeaderF
hi link Lf_hl_cursorline GruvboxYellow

let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupPreviewPosition = 'right'
let g:Lf_PreviewInPopup = 1
let g:Lf_HideHelp = 1
let g:Lf_PopupHeight = 0.5
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_PreviewScrollStepSize = 10
let g:Lf_ShortcutF = '<Space>'
let g:Lf_ShortcutB = '<leader>z'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Mru': 1,
        \ 'rg': 1,
        \ 'buffer': 1,
        \}
let g:Lf_CommandMap = {
        \ '<C-K>': ['<Up>', '<S-Tab>', '<C-k>'],
        \ '<C-J>': ['<Down>', '<Tab>', '<C-j>'],
        \ '<Tab>': ['<C-z>'],
        \ '<Up>': ['<C-p>'],
        \ '<Down>': ['<C-n>'],
        \ '<PageUp>': ['<PageUp>', '<C-u>'],
        \ '<PageDown>': ['<PageDown>', '<C-d>'],
        \ '<C-Up>': ['<C-b>'],
        \ '<C-Down>': ['<C-f>'],
        \ }

if g:colors_name == 'gruvbox'
  let g:Lf_PopupColorscheme = 'gruvbox_default'
endif

nnoremap <C-p> <cmd>LeaderfFile<CR>
nmap <leader>pw <Plug>LeaderfRgCwordLiteralNoBoundary<CR>
vmap <leader>pw <Plug>LeaderfRgVisualLiteralNoBoundary<CR>
nmap <leader>pf <Plug>LeaderfRgPrompt
nnoremap <leader>pb <cmd>LeaderfBuffer<CR>
nnoremap <leader>pm <cmd>LeaderfMru<CR>
nnoremap <leader>pl <cmd>LeaderfLine<CR>
nnoremap <leader>ph <cmd>LeaderfHelp<CR>
nnoremap <leader>pc <cmd>LeaderfCommand<CR>
nnoremap <leader>pr <cmd>Leaderf rg<CR>
nnoremap <leader>ps <cmd>Leaderf rg<CR>
nnoremap <leader>pt <cmd>Leaderf --recall<CR>

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
    \ 'nfile': '',
    \ 'pfile': '',
    \ }
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '50%'

" NERDTree
let g:NERDTreeMouseMode = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = "\uf0dc"
let g:NERDTreeDirArrowCollapsible = "\uf0dd"
let g:NERDTreeBookmarksFile = $HOME . '/.vim/.NERDTreeBookmarks'
let g:NERDTreeIgnore=['\~$', '\v\.(git|vscode|pyc|ico|png|jpeg|gif|svg|ttf|woff|woff2|eot|mp4|exe|dmg|jpg|pdf|pem|DS_Store)$']
nnoremap <F5> :NERDTreeFind<CR>
nnoremap <CR> :NERDTreeFind<CR>

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

if has('gui_running')
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
endif

" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

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
nnoremap <silent> <Leader>gs :Git status<CR>
nnoremap <silent> <Leader>gd :Git diff<CR>
nnoremap <silent> <Leader>gc :Git commit -m""
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gl :Git log
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gpp :Git pull<CR>
nnoremap <silent> <Leader>gm :call <SID>showGitMessage()<CR>

function! s:showGitMessage()
  call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:"
        \ . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")
endfunction

" vim-gitgutter
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_max_signs = 1000

" vim-undotree
nnoremap <F4> :UndotreeToggle<CR>
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 3
endif

" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_theme = 'light'

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_color_gui = 'Grey20'
let g:indentLine_fileTypeExclude = ['', 'text', 'sh', 'markdown']

" markdown toc
let g:vmt_auto_update_on_save = 0
let g:vmt_cycle_list_item_markers = 1

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

" vim-smoothie
let g:smoothie_experimental_mappings = 0

if !has('gui_running')
  noremap <ScrollWheelUp> 2<C-y>
  noremap <ScrollWheelDown> 2<C-e>
endif

" vim-rooter
let g:rooter_patterns = ['package.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_silent_chdir = 1

" editorconfig
let g:EditorConfig_max_line_indicator = 'line'
" let g:EditorConfig_preserve_formatoptions = 1

" Copilot
let g:copilot_no_tab_map = 1 " <TAB> keybinding in coc-config
let g:copilot_hide_during_completion = 0
imap <silent><script><expr> <Right> copilot#Accept("\<Right>")
imap <silent> <C-enter> <cmd>Copilot panel<CR>
imap <silent> <M-[> <Plug>(copilot-previous)
imap <silent> <M-]> <Plug>(copilot-next)
imap <silent><expr> <M-Bslash> exists('b:_copilot') ? '<Plug>(copilot-dismiss)' : '<Plug>(copilot-suggest)'
imap <silent> <M-Right> <Plug>(copilot-accept-word)
imap <silent> <M-Down> <Plug>(copilot-accept-line)

" vim-doge
let g:doge_enable_mappings = 0
nmap <silent> <leader>d <Plug>(doge-generate)

" vim-matchup
let g:matchup_mouse_enabled = 0
let g:matchup_surround_enabled = 1
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_offscreen = {'method': 'popup'}
