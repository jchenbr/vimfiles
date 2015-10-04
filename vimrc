" ====< zuo = "no", die = "no"/>====
" ----< zuo = "chapter # 0, Vundle", die = "true"/>----
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'Valloric/YouCompleteMe'
let mapleader = ","
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<cr>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----< zuo = "chapter # 1, vimrc basics", die = "true"/>----
" Set mapleader
let mapleader = ","

" a shortcut to source ./vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
" a shortcut to edit ./vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
" when modified .vimrc, source it again
autocmd! bufwritepost .vimrc source ~/.vimrc

" Platform check
function! GetMyPlatform()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

" ----< zuo = "chapter #2, workspace", die = "true"/>----

" if there is a configuration for local vim use, load it.
if filereadable("workspace.vim")
        source workspace.vim
endif

" ----< zuo = "chapter #3, taglist", die = "true" />-----

if GetMyPlatform() == "linux"
    let  Tlist_Ctags_Cmd ='/usr/bin/ctags'
endif

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0

map <silent> <F9> :TlistToggle<cr>

" ----< zuo = "chapter #4, dir/fiel explorer ", die = "true" />----
let g:newtrw_winsize = 30
nmap <silent> <leader>ed :Sexplore!<cr>

" BufExplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSortBy = 'mru'
let g:bufExplorerSplitRight = 0
let g:bufExplorerSplitVertical = 1
let g:bufExplorerSplitVertSize = 30
let g:bufExplorerUseCurrentWindow = 1
autocmd BufWinEnter \[Buf\ List\] setl nonumber

" Winmanageer
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth   = 30
let g:defaultExplorer = 0
nmap <silent> <leader>wm :WMToggle<cr>

" Lookupfile
let g:LookupFile_MinPatLength =2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0

nmap <silent> <leader>lkf <Plug>LookupFile<cr>
nmap <silent> <leader>lkd :LUWalk<cr>
nmap <silent> <leader>lkb :LUBufs<cr>

" ----< zuo = "chapter #5, filetype", die = "false" />----
filetype on
filetype plugin on
filetype indent on
set nocp

"Set ta
set shiftwidth=4 
set tabstop=4 
set softtabstop=4 
set expandtab

" ----< zuo = "chapter #6, highlight", die = "true" />----
syntax enable
set nu

" cursor
set cursorline
set cursorcolumn

" color scheme
colorscheme desert

" search result
set hls
set incsearch

" ----< zuo = "chapter #7, quick fix, complete", die = "true" />----
nmap <leader>mk :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" ---< zuo = "chapter #8, Scheme configuration", die = "false" />----
autocmd filetype lisp,scheme,art setlocal equalprg=~/.vim/others/scmindent.rkt

