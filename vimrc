"-------------------------------------------
"確認有沒有vim-plugin, 沒有則自動下載
"https://github.com/junegunn/vim-plug 
"-------------------------------------------
if empty(glob($HOME.'/.vim/autoload/plug.vim'))
  exec 'silent !curl -fLo'.$HOME.'/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
"-------------------------------------------
"PlugInstall    Install plugins
"PlugUpdate     Install or update plugins
"PlugClean      Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade    Upgrade vim-plug itself
"PlugStatus	    Check the status of plugins
"PlugDiff       Examine changes from the previous update and the pending changes
"PlugSnapshot   Generate script for restoring the current snapshot of the plugins
"-------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
call plug#end()
"-------------------------------------------
"setting for plugin
"-------------------------------------------
nmap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nmap <F8> :TagbarToggle<CR>

"lightline + vim-gitbranch
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"-------------------------------------------

endif

"顯示行號 (nu/nonu)
set nonumber

"自動縮排 (ai/noai)
set autoindent

"縮排空白數 (default 8)
set tabstop=4

"自動縮排對齊間隔數：向右或向左一個縮排的寬度
set shiftwidth=4

"自動註解關閉, 避免註解下一行被自動加上註解
set formatoptions-=r

"自動換行顯示 (wrap/nowrap)
set nowrap

"啟用依照檔案類型，決定自動縮排樣式的功能
filetype plugin indent on

"設定色彩
set t_Co=256
set bg=dark

"開啟/關閉vim的程式碼語法高亮支援
syntax on

"開啟/關閉vim的搜尋結果高亮提示 (hl/nohl)
set nohlsearch

"設定檔案語系
set enc=utf8
set fileencodings=utf8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

"顯示狀態行
"-------------------------------------------
function IsBinary()
  if (&binary == 0)
	return ""
  else
	return "[Binary]"
  endif
endfunction

function FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
	return "[Empty]"
  endif
  if bytes < 1024
	return "[" . bytes . "B]"
  elseif bytes < 1048576
	return "[" . (bytes / 1024) . "KB]"
  else
	return "[" . (bytes / 1048576) . "MB]"
  endif
endfunction
" Manually set the status line color for terminal.
"hi StatusLine ctermbg=white ctermfg=black
"set laststatus=2
"set statusline=[%{expand('%:p')}][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]
"-------------------------------------------

"key mapping
"-------------------------------------------
"ctrl + l   切換自動斷行模式
"ctrl + n/p tab切換
"-------------------------------------------
map <C-l> :call SwitchLineBreakingMode()<CR>
map! <C-l> <Esc>:call SwitchLineBreakingMode()<CR>
function SwitchLineBreakingMode()
  if (&wrap == 0)
	set wrap
	echo "Switch to line breaking mode."
  else
	set nowrap
	echo "Switch to one line mode."
  endif
endfunction

map <C-n> :tabnext<CR>
map <C-p> :tabprev<CR>

"-------------------------------------------
