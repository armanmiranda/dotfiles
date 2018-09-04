set nocompatible
filetype plugin indent on
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
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-obsession'
Plugin 'slim-template/vim-slim.git'

call vundle#end()

autocmd VimEnter * if argc() == 0 | call fzf#run(fzf#wrap({"sink": "e"})) | endif
autocmd vimenter * filetype detect
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd vimenter * NERDTree

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

nmap <F2> :FZF<CR>
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set pastetoggle=<F3>
set splitright
set termguicolors

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable

colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:polyglot_disabled = ["graphql"]

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
