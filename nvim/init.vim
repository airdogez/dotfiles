"Plug Plugins {{{
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
endif

call plug#begin()

"Plugin Bundler
"Neovim stuf
Plug 'neomake/neomake' "Syntax checker

"Status line
Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-fswitch'

"Autocompletion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'zchee/deoplete-clang', { 'for': ['cpp', 'c', 'h', 'hpp'] }
""Plug 'Rip-Rip/clang_complete', { 'for': ['cpp', 'c', 'h', 'hpp'] }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c', 'h', 'hpp'] }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'astralhpi/deoplete-omnisharp', { 'for': 'cs' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'landaire/deoplete-d', { 'for': 'd' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neco-syntax'
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
"
"Omnicompletion
"Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' } "Omnicompletion for C# (hooks to Youcompleteme)
"Omnicompletion for Javascript
"Plug 'marijnh/tern_for_vim'
"Plug 'Valloric/YouCompleteMe', { 'for': ['cpp', 'c', 'h', 'hpp'] }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx'

Plug 'critiqjo/lldb.nvim'

"CSV
Plug 'chrisbra/csv.vim'

"Godot
Plug 'quabug/vim-gdscript'
"Haskell
"Plug 'neovimhaskell/haskell-vim'
"Plug 'lukerandall/haskellmode-vim'
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell'}

Plug 'flazz/vim-colorschemes' "Collection of colorschemes
Plug 'sheerun/vim-polyglot' "Collection of Syntax highliters for multiple langauges
Plug 'honza/vim-snippets' "Collection of Snipets to work with Ultisnips and Snipmate
Plug 'justinj/vim-react-snippets'
"Moonscript
Plug 'leafo/moonscript-vim'
"Nginx syntax
"Plug 'evanmiller/nginx-vim-syntax'
"Lua Plugins
Plug 'xolox/vim-misc', { 'for': 'lua' }
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }

"Random Generator
Plug 'tkhren/vim-fake'

Plug 'osyo-manga/vim-over'
Plug 'gregsexton/gitv'
Plug 'dbakker/vim-projectroot'

"Tpope plugins
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-surround' "Change surroundings in pairs
Plug 'tpope/vim-rails', { 'for': 'ruby' } "Use rails and rake commands from inside vim
Plug 'tpope/vim-speeddating' "Modify dates and hours with context
"Asyncronus run bash commands
"Plug 'tpope/vim-dispatch'

"Shougo/Unite plugins
Plug 'Shougo/unite.vim' "Unite, fuzzy searcher and base plugin
Plug 'Shougo/vimproc', { 'do': 'make' } "Interacive command execution in vim
Plug 'Shougo/unite-outline' "Shows an outline of the headers in a new window
Plug 'Shougo/unite-session' "Save and load sessions via Unite
Plug 'Shougo/neomru.vim' "Most Recen used
Plug 'Shougo/vimfiler.vim' "File Explorer for Unite
Plug 'Shougo/vimshell.vim' "Shell Inegration for Vim
Plug 'Shougo/neossh.vim' "SSH for Vimfile
Plug 'Shougo/unite-help' "Unite help integration
Plug 'thinca/vim-unite-history' "Unite history of command/search
Plug 'ujihisa/unite-colorscheme' "Change color schemes from unite
Plug 'tsukkee/unite-tag' "Add tag support to unite
Plug 'osyo-manga/unite-quickfix'

Plug 'SirVer/ultisnips' "Base plugin for Snippets
Plug 'zhaocai/GoldenView.Vim' "Resize split windows
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript' } "Typescript integration with TSServer (Omnicompletion, Symbol navigation)
Plug 'scrooloose/nerdcommenter' "Comment lines of code
Plug 'ervandew/supertab' "Makes TAB inteligent enough to know what kind of autocompletion to use
Plug 'Raimondi/delimitMate' "Insert mode auto completion of delimiters
Plug 'mbbill/undotree' "Better view for Vim undo tree
"Org-Mode for Vim, not that complete
"Plug 'jceb/vim-orgmode'
Plug 'ryanoasis/vim-devicons' "Adds Glyphs for most programming languages
Plug 'mhinz/vim-startify' "Startup homepage
Plug 'lilydjwg/colorizer' "Color Hex Codes
"Writing tools
Plug 'reedes/vim-pencil' "Change between Hard and Soft line, conceal text, status line for writing
Plug 'junegunn/goyo.vim' "Center text on screen when writing
Plug 'junegunn/limelight.vim' "Hyperfocus writing
Plug 'junegunn/vim-easy-align' "Align text
Plug 'beloglazov/vim-online-thesaurus'
"Plug 'rhysd/vim-grammarous' "Grammer Checker
"Plug 'vim-scripts/LanguageTool' "Grammer Checker
Plug 'dpelle/vim-LanguageTool'
Plug 't9md/vim-choosewin' "Window Chooser
Plug 'tfnico/vim-gradle' "Vim-Gradle
"Plug 'vimwiki/vimwiki' "Personal Wiki
"Pandoc, markdown and R
Plug 'vim-pandoc/vim-pandoc',            { 'for': ['pandoc', 'markdown', 'rmd', 'rmarkdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax',     { 'for': ['pandoc', 'markdown', 'rmd', 'rmarkdown' ] }
Plug 'vim-pandoc/vim-criticmarkup',      { 'for': ['pandoc', 'markdown', 'rmd', 'rmarkdown' ] }
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': ['pandoc', 'markdown', 'rmd', 'rmarkdown' ] }
Plug 'vim-pandoc/vim-pandoc-after', { 'for': ['pandoc', 'markdown', 'rmd', 'rmarkdown' ] }

Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jalvesaq/Nvim-R'
Plug 'msprev/unite-bibtex', { 'for': ['pandoc', 'markdown', 'latex', 'rmd'] }
"VimR
"Plug 'vim-scripts/Vim-R-plugin'
Plug 'vim-scripts/DrawIt' "DrawIt
Plug 'dhruvasagar/vim-table-mode' "Table mode
" Plug 'farseer90718/vim-taskwarrior' "Taskwarrior
"Python
Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
"Nyaovim
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'rhysd/nyaovim-popup-tooltip'
Plug 'rhysd/nyaovim-mini-browser'

call plug#end()
"}}}
"Built-in configuration{{{
"Initial Configuration {{{
filetype off
nnoremap Q <Nop>
set langmenu=en
set nocompatible
set relativenumber
set number
set autoread
let mapleader = ","
let g:mapleader = ","
"au BufWinLeave *.* mkview
"au BufWinEnter *.* silent loadview
augroup MyAutoCmd
  autocmd!
augroup END

"Custom Mappings
nnoremap <silent> <Esc><Esc> <Esc>:nohl<CR><Esc>
nnoremap <leader>b :ls<cr>:b<space>
map <left> :bp<cr>
map <right> :bn<cr>
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <leader>s :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Autocmd
autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
autocmd BufNewFile,BufReadPost *.md setlocal filetype=pandoc
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType vim setlocal fdm=marker
autocmd FileType rmd setlocal filetype+=.rmarkdown
autocmd FileType cpp setlocal keywordprg=:term\ cppman
"autocmd FileType liquid setlocal filetype=pandoc

"Folding
nmap <leader>w :w!<cr>
if has("folding")
  set foldtext=MyFoldText()
  function! MyFoldText()
    " for now, just don't try if version isn't 7 or higher
    if v:version < 701
      return foldtext()
    endif
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
    if &fdm=='diff'
      let l:linetext=''
      let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
      let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
      " note trailing space on next line
      setlocal fillchars+=fold:\ 
    elseif !exists('b:foldpat') || b:foldpat==0
      let l:foldtext = ' '.(v:foldend-v:foldstart).' lines folded'.v:folddashes.'|'
      let l:endofline = (&textwidth>0 ? &textwidth : 80)
      let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
      let l:align = l:endofline-strlen(l:linetext)
      setlocal fillchars+=fold:-
    elseif b:foldpat==1
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
      let l:foldtext = ' '.v:folddashes
      let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
      let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' lines--- '
      let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
      let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
      let l:align -= strlen(l:linetext)
      setlocal fillchars+=fold:-
    endif
    return printf('%s%*s', l:linetext, l:align, l:foldtext)
  endfunction
endif
""}}}
"Text Tab Indentantion {{{
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=4
set expandtab "tabs to spaces
set ss=1
set ai
set winaltkeys=no
set colorcolumn=80
set lbr
set nowrap
set conceallevel=2
set concealcursor=nc
"set virtualedit=all
set virtualedit=block
"set foldmethod=syntax
set formatoptions+=j
"}}}
"Fonts Colors GUI {{{
if has ("gui_running")
  set background=dark
  set go-=T
  set go-=m
  set go-=e
  set go-=r
  set go-=l
  set go-=L
  set go-=R
  set t_Co=256
  set guitablabel=%M\ %t
endif
set encoding=utf-8
"set guifont=DejaVuSansMonoPowerline:h10
set ffs=unix,dos,mac
"Editor Interface
"set so=5
set laststatus=2
set list
set listchars=tab:>\ ,trail:-,extends:»,precedes:«,nbsp:%
set fillchars+=stl:\ ,stlnc:\  
set wildmenu
set wildmode=longest,list:full
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Ignore node modules
set wildignore+=node_modules/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
set cmdheight=2
set backspace=eol,start,indent
set whichwrap=b,s,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
"set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set tm=500
set title
set titlelen=95
set hidden
set showtabline=0
set clipboard+=unnamedplus
"}}}
"Language Specific Config {{{
"Python
au BufNewFile,BufReadPost *.py set tabstop=4 softtabstop=4 shiftwidth=4
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
let python_highlight_all=1
"Moonscript
au BufNewFile,BufReadPost *.moon set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
"
"Godot
au BufNewFile,BufReadPost *.gd setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au BufNewFile,BufReadPost *.gd setlocal filetype=gdscript
"}}}
"}}}
"Plugins configurations {{{
""Deoplete{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#omni_patterns = {}
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['']
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
""}}}
""Deoplete-clang {{{
""let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
""let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
""}}}
""Clang-complete {{{
"let g:clang_complete_auto = 1
"let g:clang_auto_select = 0
"let g:clang_omnicppcomplete_compliance = 0
"let g:clang_make_default_keymappings = 0
"let g:clang_use_library = 1
"let g:clang_library_path = "/usr/lib/libclang.so"
""}}}
"Neoinclude{{{
"let g:neoinclude#ctags_command = ''
"}}}
"NeoMake {{{
autocmd! BufWritePost * Neomake
let g:neomake_cpp_clang_maker = {
      \ 'args': ['-std=c++1z'],
      \ }
"}}}
"Omnisharp {{{
"let g:Omnisharp_start_server = 1
"let g:Omnisharp_stop_server = 1
let g:OmniSharp_timeout = 1
set completeopt=longest,menuone,preview
set splitbelow
let g:syntastic_cs_checkers = ['syntax', 'semantic']
let g:OmniSharp_selector_ui = 'unite'
"let g:OmniSharp_server_type = 'roslyn'
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    autocmd FileWritePost *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END
" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>
"}}}
"Polyglot {{{
let g:polyglot_disabled = ['liquid', 'markdown']
"}}}
"Vim-Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#nrrwrgn#enabled = 0
let g:airline#extensions#capslock#enabled = 0
let g:airline#extensions#windowswap#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 0
let g:airline#extensions#taboo#enabled = 0
let g:airline#extensions#ycm#enabled = 1
"let g:airline#extensions#tagbar#flags = ''
"let g:airline#extensions#ctrlp#color_template = 'insert'
"let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_exclude_preview = 1
let g:airline_theme='dark'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '|'
"}"}}}
"SuperTab {{{
let g:SuperTabDefaultCompletionType = '<C-n>'
"}}}
"UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"let g:neocomplcache_enable_at_startup = 1
"}}}
"Javascript {{{
let g:javascript_enable_domhtmlcss  = 1
let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "¿"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:jsx_ext_required = 0
"au FileType javascript setl conceallevel=2 concealcursor=nc
"}}}
""Typescript {{{
"autocmd FileType typescript setlocal completeopt+=menu,preview
"}}}
"Unite {{{
"Taken from terryma dotfile
" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
" call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.sync/',
      \ '\.stversions/',
      \ '\.steam/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ '.meta',
      \ ], '\|'))
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=buffer buffer<CR>

" Quick windows
nnoremap <silent> [unite]w :<C-u>Unite
      \ -buffer-name=window window<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers file_mru buffer<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical -winwidth=40 outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets ultisnips<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick line
"nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
" \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                           ',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['status',
        \'Gstatus'],
    \['diff',
        \'Gdiff'],
    \['commit',
        \'Gcommit'],
    \['log',
        \'exe "silent Glog | Unite quickfix"'],
    \['blame',
        \'Gblame'],
    \['stage',
        \'Gwrite'],
    \['checkout',
        \'Gread'],
    \['rm',
        \'Gremove'],
    \['mv',
        \'exe "Gmove " input("destino: ")'],
    \['push',
        \'Git! push'],
    \['pull',
        \'Git! pull'],
    \['prompt',
        \'exe "Git! " input("comando git: ")'],
    \['cd',
        \'Gcd'],
    \]
nnoremap <silent>[unite]G :<C-u>Unite -silent -start-insert menu:git<CR>
let g:unite_source_menu_menus.java= {
    \ 'description' : '            Comandos Java Eclim
        \                           ',
    \}
let g:unite_source_menu_menus.java.command_candidates = [
    \['Run Java',
        \'Java'],
    \['Import',
        \'JavaImport'],
    \['Import Organize',
        \'JavaImportOrganize'],
    \['Implement',
        \'JavaImpl'],
    \['JavaDoc Comment',
        \'JavaDocComment'],
    \['JavaDoc Preview',
        \'JavaDocPreview'],
    \['Correct Errors',
        \'JavaCorrect'],
    \['Proyect Tree',
        \'ProjectTreeToggle'],
    \]
nnoremap <silent>[unite]j :<C-u>Unite -silent -start-insert menu:java<CR>

" Custom Unite settings
au MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " nmap <buffer> <ESC> <Plug>(unite_exit)
  nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_insert_leave)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

let g:unite_data_directory = "~/.unite"

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
" let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --noheading --nocolor -a'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_rec_max_cache_files = 99999
let g:unite_source_session_path = '~/vimfiles/session'
"""Bibtex
let g:unite_bibtex_bib_files = ['/home/aqws3/Sync/Papers/library.bib']
let g:unite_bibtex_cache_dir = '/home/aqws3/tmp'
"}}}
"Vimfiler {{{
nnoremap <F2> :<C-u>VimFilerExplorer<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = '|'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:my_vimfiler_explorer_name = 'explorer'
let g:my_vimfiler_winwidth = 40
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_directory_display_top = 1
let g:vimfiler_ignore_pattern = ['^\%(.git\|.idea\|.DS_Store\)$', '^\.', '.meta$']

 autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
 function! s:vimfiler_settings()
   nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
 endfunction
"}}}
"Writing configuration{{{
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  "autocmd FileType markdown,mkd,md,rmd,Rmd call pencil#init()
  autocmd FileType text call pencil#init()
  autocmd FileType textile call pencil#init()
augroup end
"}}}
"Goyo{{{
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
"}}}
"Easy Align{{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"Choose Win {{{
nmap <leader>, <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
"}}}
"UndoTree {{{
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
"}}}
"Startify {{{
let g:startify_list_order = [
      \ [' Most recent used files:'],
      \ 'files', 
      \ [' Saved sessions:'],
      \ 'sessions',
      \ ]
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:startify_custom_header = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ '',
            \ '',
            \ ]
let g:startify_custom_footer = [
      \ ' ',
      \ '~~~By Aqws3',
      \ ]
"}}}
"Webdev Icons {{{
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
"}}}
"Java{{{
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"}}}
"Lua {{{
  let g:lua_check_syntax = 0
  let g:lua_complete_omni = 1
  let g:lua_complete_dynamic = 1
  let g:lua_define_completion_mappings = 0
""  let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
"}}}
"Haskell{{{
"au BufEnter *.hs compiler ghc
"let g:haddock_browser="/usr/bin/firefox"
"}}}
"Pandoc{{{
let g:pandoc#after#modules#enabled = ["ultisnips", "unite", "supertab", "tablemode"]
"}}}
"Tablemode{{{
"let g:table_mode_corner_corner="+"
"let g:table_mode_header_fillchar="="
"}}}
"LLDB{{{
nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F9> :LLmode debug<CR>
nnoremap <S-F9> :LLmode code <CR>
nnoremap <F7> :LL continue<CR>
nnoremap <S-F7> :LL process interrupt<CR>
nnoremap <F10> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F10> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
"}}}
"R{{{
"let g:R_openpdf=1
"}}}
"Language Tool{{{
"let g:grammarous#languagetool_cmd = 'languagetool'
"}}}
"<UNUSED>LaTex {{{
"let g:tex_flavor='latex'
"set grepprg=grep\ -nH\ $*
"}}}
"<UNUSED>Vimwiki{{{
"let g:vimwiki_list = [{'path': '~/vimwiki/',
                     "\ 'syntax': 'markdown', 'ext': '.md'}]
"}}}
"<UNUSED> YouCompleteMe {{{
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_register_as_syntastic_checker = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 1
""let g:ycm_auto_start_csharp_server = 0
""let g:ycm_auto_stop_csharp_server = 0
""let g:ycm_csharp_server_port = 2000
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_cache_omnifunc = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_disable_for_files_larger_than_kb = 700
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
""}}}
"<UNUSED>Syntastic {{{
"set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatusLineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1
""let b:syntastic_skip_checks = 1
""let g:syntastic_style_error_symbol = "S✗"
""let g:syntastic_style_warning_symbol = "S⚠"
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_shell = "/bin/sh"
"let g:syntastic_mode_map = {
    "\ "mode": "active",
    "\ "active_filetypes": [],
    "\ "passive_filetypes": []}
""let g:syntastic_cpp_compiler = 'clang++'
""let g:syntastic_cpp_compiler = 'g++'
""let g:syntastic_cpp_compiler_options = '-std=c++11 -std=libc++'
"let g:syntastic_cpp_compiler_options = ' -std=c++1z'

"}"}}}
"<UNUSED> Eclim {{{
"let g:EclimCompletionMethod = 'omnifunc'
"}}}
"}}}
"Post Initialization {{{
colorscheme monokain
highlight Comment cterm=italic
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on
"}}}
