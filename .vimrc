" ---------------------------------------------------------------------------------
" VsVim Configuration for Visual Studio
" Author: Mihail Anghelici
" 
" This .vimrc is specifically for VsVim usage within Visual Studio. It includes
" key mappings, clipboard utilities, and several plugin integrations to enhance
" productivity, especially for C++ development.
" 
" External Plugins:
" - VAssistX (Visual Assist X plugin for Visual Studio)
" ---------------------------------------------------------------------------------
inoremap <C-p> <up>
inoremap <C-n> <down>
" ===================================
" General Settings
" ===================================
set relativenumber
set ignorecase
set smartcase
set incsearch
set autoindent        
 
" ===================================
" Leader Key Mapping
" ===================================
nnoremap <SPACE> <Nop>
let mapleader=" "

" ===================================
" File Operations
" ===================================
" Easier save
 nnoremap <leader>w :<C-s><CR>

" Open .vimrc in a new tab
nnoremap <leader>fc :tabedit C:\Users\manghelici\.vimrc<CR>

" Reload/source Vim configuration
nnoremap <leader>sv :source C:\Users\manghelici\.vimrc<CR>

" ===================================
" Search and Navigation
" ===================================
" Map é to search like /
nnoremap é /

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-y> <C-y>3kzz
nnoremap <C-e> <C-e>3jzz

vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-y> <C-y>3kzz
vnoremap <C-e> <C-e>3jzz

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Search current selection in visual mode

" Modify symbol
nnoremap <leader>m :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" Rename symbol
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
" Rename symbol in all source
nnoremap <leader>ra :vsc VAssistX.RefactorRename<CR>

" Occurence search centering
nnoremap * *zz
nnoremap # #zz

" Delete from cursor to EOL
nnoremap <leader>de vg_"_d

vnoremap p "_dP

" Center on screen after next and previous during search
nnoremap n nzz
nnoremap N Nzz

" ===================================
" Clipboard Utilities
" ===================================
" Yank to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_

" Paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" ===================================
" Deleting Without Yanking
" ===================================
" Delete into black hole register (doesn't save into register)
nnoremap d "_d
vnoremap d "_d

" Prevent yanking with common motions
nnoremap ciw "_ciw
nnoremap x "_x
vnoremap x "px
vnoremap c "_c

" Allows to delte a match pattern in visual mode
xnoremap <leader>d :<C-u>'<,'>s///g<Left><Left><Left>

" ===================================
" Insert and Edit Utilities
" ===================================
" Insert space in normal mode
nnoremap <Space> i<Space><Right><ESC>

" Insert custom C++ macros for wrapping with common functions. 
nnoremap <leader>roe IRETURN_ON_ERROR(<ESC>$hi)
nnoremap <leader>ifa IIF_FAILED_ACTION(<ESC>$hi)
nnoremap <leader>ri IRETURN_IF(<ESC>$hi)
nnoremap <leader>rs ireturn im::err::SuccessCreate();<ESC>
nnoremap <leader>_ ea_<ESC>

" ===================================
" Window and Split Management
" ===================================
" Split and resize windows
nnoremap <leader>- :vsp<CR> 
nnoremap <leader>| :sp<CR>
nnoremap <leader>H :vertical resize -5<CR>
nnoremap <leader>L :vertical resize +5<CR 
nnoremap <leader>K :resize +5<CR>
nnoremap <leader>J :resize -5<CR>

" Navigate left and right in wide files
nnoremap <leader>l 20zl
nnoremap <leader>h 20zh

" ===================================
" Editor Hacks
" ===================================
" Show solution explorer
nnoremap <leader>e :vsc View.SolutionExplorer<CR>

" ===================================
" VAssistX and LSP Specific Mappings
" ===================================
nnoremap K :vsc Edit.PeekDefinition<CR>
nnoremap Q :vsc Edit.QuickInfo<CR>
nnoremap <leader>sw :vsc Edit.FindAllReferences<CR>

" Go to implementation (VAssistX)
nmap gd :vsc VAssistX.GoToImplementation<CR><Esc>

" (TODO) Select block comments 
nnoremap <leader>c ?^\s*//<CR>V/^\s*[^/]<CR>k

" Navigate forward and backward in editor
nmap <C-O> :vsc View.NavigateBackward<CR>
nmap <C-I> :vsc View.NavigateForward<CR>

nnoremap gcc :vsc Edit.ToggleBlockComment<CR>
vnoremap gc :vsc Edit.ToggleBlockComment<CR><Esc><Esc>
vnoremap <leader>* :vsc Edit.CommentSelection<CR><Esc><Esc>
 
" Add include for symbol (VAssistX)
nnoremap <leader>i :vsc VAssistX.RefactorAddInclude<CR>

" ===================================
" Surround Vim 
" ===================================
" Surround simulating bindings
nnoremap s) ciw(<C-r>")<Esc>
nnoremap s] ciw[<C-r>"]<Esc>
nnoremap s} ciw{<C-r>"}<Esc>
nnoremap s> ciw<lt><C-r>"><Esc>
nnoremap s" ciw"<C-r>""<Esc>
nnoremap s' ciw'<C-r>"'<Esc>
nnoremap s* ciw/*<C-r>"*/<Esc>
nnoremap sw) ciW(<C-r>")<Esc>
nnoremap sw] ciW[<C-r>"]<Esc>
nnoremap sw} ciW{<C-r>"}<Esc>
nnoremap sw> ciW<lt><C-r>"><Esc>
nnoremap sw" ciW"<C-r>""<Esc>
nnoremap sw' ciW'<C-r>"'<Esc>
nnoremap sw* ciW/*<C-r>"*/<Esc>

" Surround visual selected text
vnoremap S" c"<C-r>""<Esc>
vnoremap S' c"<C-r>"'<Esc>
vnoremap S) c(<C-r>")<Esc>
vnoremap S] c[<C-r>"]<Esc>
vnoremap S} c{<C-r>"}<Esc>
vnoremap S> c<lt><C-r>"><Esc>
vnoremap S* c/*<C-r>"*/<Esc>
