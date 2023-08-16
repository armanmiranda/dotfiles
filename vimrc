set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'travisjeffery/vim-auto-mkdir'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/fzf'
Plugin 'sheerun/vim-polyglot'
Plugin 'ryanoasis/vim-devicons'
Plugin 'slim-template/vim-slim.git'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-obsession'

call vundle#end()
filetype plugin indent on
set completeopt=longest,menuone

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
" Remove trailing white spaces from ruby files
autocmd BufWritePre *.rb %s/\s\+$//e

" User Defined Commands
:command -nargs=? Rspec call TermCommand("rspec", "<args>")
:command -nargs=0 TranslateJS call TermCommand("rails i18n:js:export")
:command -nargs=* Term call TermCommand("", "<args>")
:command -nargs=0 Gemfile vsp Gemfile

" User Defined Functions
:function TermCommand(termcmd, ...)
:  let s:curwin = @% =~ "^!" ? " ++curwin " : " "
:  let s:cmd = "term" . s:curwin . a:termcmd . " " . join(a:000)
:  let s:chomped_cmd = join(split(s:cmd))
:  execute s:chomped_cmd
:endfunction

" User Defined Keybindings
" FZF Searching
nmap <Space>ff :FZF<CR>

" Rspec Keybindings
nmap <Space>rt. :Rspec %<CR>

" Toggle NERDTree
nmap <Space>ft :NERDTreeToggle<CR>

set encoding=UTF-8
set number
set relativenumber
set list
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set pastetoggle=<F3>
set splitright
set textwidth=80
set termguicolors
set listchars=tab:▸\ ,nbsp:⋅,trail:•

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable

colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:polyglot_disabled = ["graphql"]

"gui options
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Source\ Code\ Pro\ Regular\ 10
  endif
endif

let g:rails_projections = {
      \ "app/javascript/*.jsx": {
      \   "command": "component"
      \ },
      \
      \ "app/javascript/packs/*.js": {
      \   "command": "packs"
      \ },
      \
      \ "app/admin/*.rb": {
      \   "command": "admin",
      \   "affinity": "model",
      \   "alternate": "app/models/*.rb",
      \   "template": "ActiveAdmin.register {} do\nend"
      \ }}
"Prose writing

augroup pencil
  autocmd!
  autocmd FileType text call pencil#init({'wrap': 'soft'})
augroup END
