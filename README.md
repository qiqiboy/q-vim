q-vim
================
my vim config. 来自一个前端开发码农的vim配置方案。

### 功能 & Features
* 广泛支持前端开发，支持`html`、`javascript`、`typescript`、`react(jsx)`, `scss`、`css`等高亮、关键词补全、语法补全； 
也支持其它语言，例如`python`、`php`等
* 内置了 `gruvbox` `paperColor` 等优秀主题
* Lint 代码检查（由ALE提供支持，需要vim8+）
* minibufferexplore支持
* NERDTree支持，目录树
    * `F5` 打开NERDTree面板，或者刷新基于当前文件刷新目录树
* UndoTree支持，文件变动历史
    * `F4` 打开或者关闭UndoTree面板
* CtrlP.vim支持，项目全局文件模糊查找
    * `<Space>`空格键 或 `<leader>p` 触发查找面板
    * `<leader>pr` 触发最近访问文件列表面板
    * `<leader>pb` 触发当前buffers列表查找
    * `<leader>fu` 触发函数名查找
* Ctrlsf.vim支持，全局跨文件内容搜索
    * `<leader>sf` 打开搜索面板
* YCM支持，vim上最好的补全插件
    * 对css、scss等做了优化
* Ultisnips支持
    * 支持react-snippets、es6-snippets等
* 对git支持更好
    * 文件变动左侧标记，状态栏提示等
    * vim-fugitive支持，可以不离开vim进行git操作
* markdown编辑实时预览
* js等格式文件，可以显示对齐缩进线
* vim-easygrep带来更快的全局内容查找、替换
* 快速注释代码
    * `<c-c>` 添加注释
    * `<c-x>` 取消注释
* 快速打开或者关闭quickfix、loclist面板
    * `F2` 打开或者关闭qucikfix
    * `F3` 打开或者关闭loclist
* easymotion 更快速的文件内跳转
    * 对 `f` `F` `t` `T` 做了新的映射
    * 对 `/` `?` 搜索做了映射
    * `<leader><leader>j` `<leader><leader>k` `<leader><leader>h` `<leader><leader>l` 上下左右移动
* 更快速的移动、交换代码行
    * `<leader>j` 向下，`<leader>k` 向上 （由vim-move提供）
    * `<leader>h` 向左，`<leader>l` 向右（由vim-sideways提供）
    * `cx` `cxx` 快速交换词组、行、块等（由vim-exchange提供）


 ... 更多其它功能，更详细键位配置请参考vimrc文件

### 安装 & Install
##### 环境
 * `mac osx`（其它平台没测试，部分功能可能会有问题）
 * `vim8+`（否则无法使用`ale`代码检查功能）
 * `node6+`、`npm2+`、`ternjs`、`typescript`、`eslint`、`tslint`等
    ```
    brew install node
    npm install -g tern eslint tslint typescript
    ```
 * `ag`(the silver searcher) 
    ```
    brew install the_silver_searcher
    ```
 * 安装 `FantasqueSansMono` 字体（如果不安装，需要修改第 15 行， 改为 `set guifont=monoca`）

##### 安装
 * 安装好 `Vundle` 
 * 将 vimrc 里内容复制到你的 `~/.vimrc` 或者 `~/.vim/vimrc` 里
 * 执行 `BundleInstall`
 * 进入到 `~/.vim/bundle/YouCompleteMe` 目录，执行 `./install.py --tern-completer` 编译ycm


### 截图 & Screenshots
![startIfy](https://cloud.githubusercontent.com/assets/3774036/25426063/9016bcd4-2aa0-11e7-8f6a-769b655d386f.png)  

![coding](https://cloud.githubusercontent.com/assets/3774036/25426093/a21f62dc-2aa0-11e7-9a4c-2077f4480ce0.png)
