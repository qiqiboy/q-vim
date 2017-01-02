" System vimrc file for MacVim
set nocompatible

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix,dos
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set nu!

filetype off

set guifont=monaco:h12

set tags=tags;
set autochdir
set hidden

set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠

set number                      " 显示行号
set tabstop=4                   " 设定tab长度为4
set shiftwidth=4                " 缩进的空格数
set softtabstop=4
set expandtab                 " 是否在缩进和遇到Tab键时使用空格代替; 使用noexpandtab取消设置
set smarttab
set autoindent                  " 自动缩进
set smartindent
set cindent
set confirm

set showcmd              "在状态栏显示当前输入的命令
set showmode			 "显示INSERT NORMAL等

set hlsearch
set incsearch

set showmatch                   " 显示括号配对情况
set paste                       " 支持外部复制(好像不管用)
set clipboard+=unnamed          " 与windows共享剪贴板

set history=99                  " keep 99 lines of command history
set showmatch                   " 显示括号配对情况

set guioptions-=T               " windows下隐藏工具栏
"set guioptions-=r               " 把gui右边的滑动条去掉
set guioptions-=L               " 把gui左边的滑动条去掉
set guioptions-=m               " 把gui的菜单栏去掉
set guioptions-=b
set shortmess=atI               " 启动的时候不显示援助索马里儿童的提示(是I而不是L)

set completeopt=preview,menu
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

" if has("persistent_undo")
"    set undodir = ~/.undodir/
" endif

"autocmd GUIEnter * simalt ~x  	" windows下启动vim最大化
if has('gui_running')
    set lines=60 columns=240
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 "let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 """"""""vim scripts""""""""""""""""""
 Bundle 'minibufexpl.vim'
 Bundle 'winmanager'

 """"""""git上的插件"""""""""""""""
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'ctrlpvim/ctrlp.vim'
 Bundle 'godlygeek/tabular'
 Bundle 'terryma/vim-multiple-cursors'
 Bundle 'lilydjwg/colorizer'
 Bundle 'tpope/vim-haml'
 Bundle 'genoma/vim-less'
 Bundle 'Raimondi/delimitMate'
 Bundle 'hail2u/vim-css3-syntax'
 Bundle 'othree/html5.vim'
 Bundle 'docunext/closetag.vim'
 Bundle 'gregsexton/MatchTag'
 Bundle 'easymotion/vim-easymotion'
 Bundle 'terryma/vim-expand-region'
 Bundle 'tpope/vim-surround'
 Bundle 'tpope/vim-repeat'
 Bundle 'bronson/vim-trailing-whitespace'
 Bundle 'SirVer/ultisnips'
 Bundle 'honza/vim-snippets'
 Bundle 'rstacruz/vim-ultisnips-css'
 Bundle 'tacahiroy/ctrlp-funky'
 Bundle 'dyng/ctrlsf.vim'
 Bundle 'othree/yajs.vim'
 Bundle "pangloss/vim-javascript"
 Bundle 'othree/javascript-libraries-syntax.vim'
 Bundle 'maksimr/vim-jsbeautify'
 Bundle 'mbriggs/mark.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'Xuyuanp/nerdtree-git-plugin'
 "Bundle 'majutsushi/tagbar'
 "Bundle 'hushicai/tagbar-javascript.vim'
 Bundle 'airblade/vim-gitgutter'
 Bundle 'tpope/vim-fugitive'
 Bundle 'matthewsimo/angular-vim-snippets'
 Bundle 'suan/vim-instant-markdown'
 Bundle 'Yggdroot/indentLine'
 Bundle 'elzr/vim-json'
 Bundle 'dkprice/vim-easygrep'
 Bundle 'mbbill/undotree'
 Bundle 'mattn/emmet-vim'
 Bundle 'mxw/vim-jsx'
 Bundle 'scrooloose/nerdcommenter'
 "Bundle 'editorconfig/editorconfig-vim'

 """"""""themes"""""""""""""""
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'chriskempson/vim-tomorrow-theme'

call vundle#end()

let g:solarized_termcolors=256

filetype on
filetype plugin on
filetype plugin indent on

syntax enable
syntax on

set background=dark
colorscheme solarized 				"  主题设置

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplModSelTarget=1

"let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWindowLayout='NERDTree'
let g:winManagerWidth=25
let g:AutoOpenWinManager = 1

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_semantic_triggers =  {
  \   'javascript,javascript.jsx,typescript' : ['re![a-zA-Z_$]+', '.', '['],
  \   'css,less,sass,scss' : ['-', ':'],
  \ }
nnoremap <leader>w :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

let g:EasyMotion_smartcase = 1
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map ? <Plug>(easymotion-Fn)
map / <Plug>(easymotion-sn)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <leader>. <Plug>(easymotion-repeat)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

map <leader><space> :FixWhitespace<cr>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

nnoremap <Leader>a :Tabularize /

map <leader>ue :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger = "<a-tab>"
let g:UltiSnipsListSnippets = "<Leader><Leader>1"
let g:UltiSnipsJumpBackwardTrigger = "<Leader><Leader>1"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>p'
nnoremap <Leader>pr :CtrlPMRU<Cr>
nnoremap <Leader>pm :CtrlPMixed<Cr>
nnoremap <Leader>pb :CtrlPBuffer<Cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|images)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

nnoremap <Leader>sf :CtrlSF<space>
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '100'

let g:used_javascript_libs = 'jquery,requirejs,underscore,angularjs,react,flux'

nnoremap <tab> %
vnoremap <tab> %
inoremap <C-tab> <c-x><c-o>

autocmd FileType javascript noremap <buffer>  <leader>b :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>b :call HtmlBeautify()<cr>
autocmd FileType css,sass,scss,less noremap <buffer> <leader>b :call CSSBeautify()<cr>
autocmd FileType javascript.jsx noremap <buffer> <leader>b :call JsxBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>b :call JsonBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <leader>b :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>b :call RangeHtmlBeautify()<cr>
autocmd FileType css,sass,scss,less vnoremap <buffer> <leader>b :call RangeCSSBeautify()<cr>
autocmd FileType javascript.jsx vnoremap <buffer> <leader>b :call RangeJsxBeautify()<cr>
autocmd FileType json vnoremap <buffer> <leader>b :call RangeJsonBeautify()<cr>

let g:tern_show_signature_in_pum = 1
autocmd BufEnter * set completeopt-=preview

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'q'
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

noremap <f5> :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    exe 'q'
    exe 'TagbarOpen'
endfunction

function! Tagbar_IsValid()
    return 1
endfunction
let g:tagbar_vertical = 30
let g:tagbar_expand = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1

nmap <Leader>c <Plug>MarkAllClear

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gc :Gcommit -m""
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gl :Glog
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gpp :Gpull<cr>

nnoremap <F4> :UndotreeToggle<cr>
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 3
endif

let g:gitgutter_sign_column_always = 1
let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_max_signs = 1000
highlight SignColumn guibg = #002b36

let g:indentLine_enabled = 1
let g:indentLine_fileType = ['javascript', 'javascript.jsx', 'python']
let g:indentLine_color_gui = '#394f51'

let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
    \'html' : {
    \    'indent_blockelement': 1
    \}
\}
autocmd FileType html,css,sass,scss,less,php EmmetInstall

"let g:jsx_ext_required = 0

noremap  <silent> <C-C> :call NERDComment(1, "Sexy")<CR>
noremap  <silent> <C-X> :call NERDComment(1, "Uncomment")<CR>

