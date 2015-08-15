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

" 禁止生成临时文件
set nobackup
set noswapfile

"autocmd GUIEnter * simalt ~x  	" windows下启动vim最大化
set lines=60 columns=200

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 "let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 """"""""vim scripts""""""""""""""""""
 Bundle 'minibufexpl.vim'
 Bundle 'comments.vim'
 Bundle 'winmanager'

 """"""""git上的插件"""""""""""""""
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'kien/ctrlp.vim'
 Bundle 'godlygeek/tabular'
 Bundle 'terryma/vim-multiple-cursors'
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
 Bundle "pangloss/vim-javascript"
 Bundle 'othree/yajs.vim'
 Bundle 'othree/javascript-libraries-syntax.vim'
 Bundle 'maksimr/vim-jsbeautify'
 Bundle 'marijnh/tern_for_vim'
 Bundle 'mbriggs/mark.vim'
 Bundle 'gorodinskiy/vim-coloresque'
 Bundle 'scrooloose/nerdtree'
 Bundle 'Xuyuanp/nerdtree-git-plugin'
 Bundle 'majutsushi/tagbar'
 Bundle 'hushicai/tagbar-javascript.vim'

 """"""""themes"""""""""""""""
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'chriskempson/vim-tomorrow-theme'

call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

syntax enable
syntax on

set background=dark
colorscheme solarized 				"  主题设置

autocmd FileType javascript     set omnifunc=tern#Complete
autocmd FileType css,sass,less  set omnifunc=csscomplete#CompleteCSS
autocmd FileType html           set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php            set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml            set omnifunc=xmlcomplete#CompleteTags

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplModSelTarget=1

let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:AutoOpenWinManager = 1

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

let g:EasyMotion_smartcase = 1
map  f <Plug>(easymotion-f)
map  F <Plug>(easymotion-F)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  <leader><leader>. <Plug>(easymotion-repeat)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

map <leader><space> :FixWhitespace<cr>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

map <leader>ue :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger = "<a-tab>"
let g:UltiSnipsListSnippets = ""
let g:UltiSnipsJumpBackwardTrigger = ""
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>p'
nnoremap <Leader>pr :CtrlPMRU<Cr>
nnoremap <Leader>pm :CtrlPMixed<Cr>
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

let g:used_javascript_libs = 'jquery,requirejs,underscore,angularjs'

nnoremap <tab> %
vnoremap <tab> %
inoremap <C-tab> <c-x><c-o>

autocmd FileType javascript noremap <buffer>  <leader>b :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>b :call HtmlBeautify()<cr>
autocmd FileType css,sass,less noremap <buffer> <leader>b :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <leader>b :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>b :call RangeHtmlBeautify()<cr>
autocmd FileType css,sass,less vnoremap <buffer> <leader>b :call RangeCSSBeautify()<cr>

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
