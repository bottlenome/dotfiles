colorscheme desert
syntax on

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

set number
set expandtab
set autoindent
set smartindent
set tabstop=4 shiftwidth=4
set whichwrap=b,s,h,l,<,>,[,]
set background=dark
set backspace=indent,eol,start
autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType make set noexpandtab
autocmd FileType neosnippet set noexpandtab
highlight Pmenu ctermbg=4
highlight PmenuSet ctermbg=1
highlight PmenuSbar ctermbg=4
set path+=/opt/local/include/
set path+=/opt/local/include/opencv
set hlsearch
"set foldmethod=indent
set statusline=%F\ %03l\ %03v
set laststatus=2

let $BASH_ENV="~/.bash_aliases"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = $HOME . '/.vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  call system('cd ' . shellescape(s:dein_repo_dir) . '; git checkout refs/tags/1.5')
endif
" Required:
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/syntastic')
  call dein#add('Shougo/neocomplete.vim', {
        \ 'if': has('lua')
        \ })
  call dein#add('Shougo/neocomplcache.vim', {
        \ 'if': ! has('lua')
        \ })

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('fatih/vim-go')
  call dein#add('mattn/sonictemplate-vim')
  " need installation below
  " $ gem install redcarpet pygments.rb
  " $ npm -g install instant-markdown-d
  " call dein#add('suan/vim-instant-markdown')

  call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"neocomplete
  let g:neocomplete#enable_auto_close_preview = 1
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#enable_auto_close_preview = 1
"neocomplcache
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 0
  let g:neocomplcache_enable_underbar_completion = 1
"neosnippet
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neosnippet#snippets_directory = '~/.vim/my_neosnippets'

"sonictemplate {{{
let g:sonictemplate_vim_template_dir = ['~/.vim/template']
" }}}}

"vim-go
"let g:go_version_warning = 0


imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><CR> neosnippet#expandable() <bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
imap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

map <C-]> g<C-]>
