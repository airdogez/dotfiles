"NeoBundle Plugins {{{
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=/home/aqws3/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/home/aqws3/.vim/bundle'))

"Plugin Bundler
NeoBundleFetch 'Shougo/neobundle.vim'

"Status line
NeoBundle 'bling/vim-airline'

"Agrupation of plugins to reduce plugin load
"Collection of colorschemes
NeoBundle 'flazz/vim-colorschemes'
"Collection of Syntax highliters for multiple langauges
NeoBundle 'sheerun/vim-polyglot'
"Collection of Snipets to work with Ultisnips and Snipmate
NeoBundle 'honza/vim-snippets'
"Override Polyglot Javascript plugin
NeoBundle 'pangloss/vim-javascript'


"Tpope plugins
"Git wrapper
NeoBundle 'tpope/vim-fugitive'
"Change surroundings in pairs
NeoBundle 'tpope/vim-surround'
"Use rails and rake commands from inside vim
NeoBundle 'tpope/vim-rails'
"Modify dates and hours with context
NeoBundle 'tpope/vim-speeddating'
"Asyncronus run bash commands
"NeoBundle 'tpope/vim-dispatch'

"Shougo/Unite plugins
"Unite, fuzzy searcher and base plugin
NeoBundle 'Shougo/unite.vim'
"Interacive command execution in vim
NeoBundle 'Shougo/vimproc'
"Shows an outline of the headers in a new window
NeoBundle 'Shougo/unite-outline'
"Save and load sessions via Unite
NeoBundle 'Shougo/unite-session'
"Most Recen used
NeoBundle 'Shougo/neomru.vim'
"File Explorer for Unite
NeoBundle 'Shougo/vimfiler.vim'
"Shell Inegration for Vim
NeoBundle 'Shougo/vimshell.vim'
"SSH for Vimfile
NeoBundle 'Shougo/neossh.vim'
"Unite help integration
NeoBundle 'tsukkee/unite-help'
"Unite history of command/search
NeoBundle 'thinca/vim-unite-history'
"Change color schemes from unite
NeoBundle 'ujihisa/unite-colorscheme'
"Add tag support to unite
NeoBundle 'tsukkee/unite-tag'
""Depreciated plugins by Unite 
""NeoBundle 'majutsushi/tagbar'
""NeoBundle 'szw/vim-ctrlspace'
""NeoBundle 'kien/ctrlp.vim'
""NeoBundle 'scrooloose/nerdtree'

"Syntax checker
NeoBundle 'scrooloose/syntastic'
"Base plugin for Snippets
NeoBundle 'SirVer/ultisnips'
"Resize split windows
NeoBundle 'zhaocai/GoldenView.Vim'
"Typescript integration with TSServer (Omnicompletion, Symbol navigation)
NeoBundle 'Quramy/tsuquyomi'
"Comment lines of code
NeoBundle 'scrooloose/nerdcommenter'
"Sends vim buffers to the command line
"NeoBundle 'krisajenkins/vim-pipe'
"All SQL completiton (Omnicompletion)
"NeoBundle 'vim-scripts/SQLComplete.vim'
"Access database via vim commands
"NeoBundle 'vim-scripts/dbext.vim'
"Makes TAB inteligent enough to know what kind of autocompletion to use
NeoBundle 'ervandew/supertab'
"Code completion for C-family, Python, C#, Go, Java and Ruby
NeoBundle 'Valloric/YouCompleteMe'
"Omnicompletion for C# (hooks to Youcompleteme) Don't really need it in linux?
"NeoBundle 'OmniSharp/omnisharp-vim'
"Omnicompletion for Javascrip
NeoBundle 'marijnh/tern_for_vim'
"Insert mode auto completion of delimiters
NeoBundle 'Raimondi/delimitMate'
"Better view for Vim undo tree
NeoBundle 'sjl/gundo.vim'
"Org-Mode for Vim, not that complete
"NeoBundle 'jceb/vim-orgmode'
"Adds Glyphs for most programming languages
NeoBundle 'ryanoasis/vim-devicons'
"Startup homepage
NeoBundle 'mhinz/vim-startify'
"Color Hex Codes #FFF ,#FFFFFF, rgb(100%,100%,100%), rgba(255,255,255,0) 
NeoBundle 'lilydjwg/colorizer'
"Writing tools
"Change between Hard and Soft line, conceal text, status line for writing
NeoBundle 'reedes/vim-pencil'
"Center text on screen when writing
NeoBundle 'junegunn/goyo.vim'
"Hyperfocus writing
NeoBundle 'junegunn/limelight.vim'
"Align text
NeoBundle 'junegunn/vim-easy-align'
"Window Chooser
NeoBundle 't9md/vim-choosewin'
"Vim-Gradle
NeoBundle 'tfnico/vim-gradle'
"Vim-Pandoc
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-rmarkdown'
"VimR
NeoBundle 'vim-scripts/Vim-R-plugin'
"DrawIt
NeoBundle 'vim-scripts/DrawIt'
"Table mode
NeoBundle 'dhruvasagar/vim-table-mode'

call neobundle#end()
"}}}
"Built-in configuration{{{
"Initial Configuration {{{
filetype off
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

"Autocmd
autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType vim setlocal fdm=marker

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
set expandtab
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
set list
set listchars=tab:>\ ,trail:-,extends:»,precedes:«,nbsp:%
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
"}}}
"}}}
"Plugins configurations {{{
"Polyglot {{{
let g:polyglot_disabled = ['javascript']
"}}}
"Vim-Airline {{{
""let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
"let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ctrlp#color_template = 'insert'
"let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#ctrlspace#enabled = 0
"let g:airline#extensions#eclim#enabled = 1
let g:airline_exclude_preview = 1
let g:airline_theme='badwolf'
"let g:protodefprotogetter = 'C:\pullproto.pl'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\  
"}"}}}
" <UNUSED> Tagbar {{{
"nmap <F8> :TagbarToggle<CR>
"}}}
"Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
"let b:syntastic_skip_checks = 1
"let g:syntastic_error_symbol = "¿>"
"let g:syntastic_warning_symbol = "¿>"
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": []}
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++14 -std=libc++'

"}"}}}
"YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_auto_start_csharp_server = 0
"let g:ycm_auto_stop_csharp_server = 0
"let g:ycm_csharp_server_port = 2000
let g:ycm_cache_omnifunc = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'unite' : 1
      \}
"}}}
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
" <UNUSED> Eclim {{{
"let g:EclimCompletionMethod = 'omnifunc'
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
"au FileType javascript setl conceallevel=2 concealcursor=nc
"}}}
"Typescript {{{
autocmd FileType typescript setlocal completeopt+=menu,preview
"}}}
"LaTex {{{
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
"}}}
"Gundo {{{
nnoremap <F5> :GundoToggle<cr>
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
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ ], '\|'))
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_rec/async<CR>

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
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>

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
    \['git status       (Fugitive)                                ',
        \'Gstatus'],
    \['git diff         (Fugitive)                                ',
        \'Gdiff'],
    \['git commit       (Fugitive)                                ',
        \'Gcommit'],
    \['git log          (Fugitive)                                ',
        \'exe "silent Glog | Unite quickfix"'],
    \['git blame        (Fugitive)                                ',
        \'Gblame'],
    \['git stage        (Fugitive)                                ',
        \'Gwrite'],
    \['git checkout     (Fugitive)                                ',
        \'Gread'],
    \['git rm           (Fugitive)                                ',
        \'Gremove'],
    \['git mv           (Fugitive)                                ',
        \'exe "Gmove " input("destino: ")'],
    \['git push         (Fugitive, salida por buffer)             ',
        \'Git! push'],
    \['git pull         (Fugitive, salida por buffer)             ',
        \'Git! pull'],
    \['git prompt       (Fugitive, salida por buffer)             ',
        \'exe "Git! " input("comando git: ")'],
    \['git cd           (Fugitive)',
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
"}}}
" <UNUSED> Omnisharp {{{
"let g:Omnisharp_start_server = 1
"let g:Omnisharp_stop_server = 1
"let g:OmniSharp_timeout = 1
"set completeopt=longest,menuone,preview
"set splitbelow
"let g:syntastic_cs_checkers = ['syntax', 'semantic']
"let g:OmniSharp_selector_ui = 'unite'
"augroup omnisharp_commands
    "autocmd!

    ""Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    ""autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    "" Synchronous build (blocks Vim)
    ""autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    "" Builds can also run asynchronously with vim-dispatch installed
    "autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    "" automatic syntax check on events (TextChanged requires Vim 7.4)
    ""autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    "autocmd FileWritePost *.cs SyntasticCheck

    "" Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    ""show type information automatically when the cursor stops moving
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    ""The following commands are contextual, based on the current cursor position.

    "autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    "autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    "autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    "autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    "autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    ""finds members in the current buffer
    "autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    "" cursor can be anywhere on the line containing an issue
    "autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    "autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    "autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    "autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    ""navigate up by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    ""navigate down by method/property/field
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

"augroup END
"" Force OmniSharp to reload the solution. Useful when switching branches etc.
"nnoremap <leader>rl :OmniSharpReloadSolution<cr>
"nnoremap <leader>cf :OmniSharpCodeFormat<cr>
"" Load the current .cs file to the nearest project
"nnoremap <leader>tp :OmniSharpAddToProject<cr>
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

 autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
 function! s:vimfiler_settings()
   nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
 endfunction
"}}}
" <UNUSED> NerdTree {{{
"nnoremap <F2> :NERDTree<cr>
"}}}
"Writing configuration{{{
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd FileType markdown,mkd call pencil#init()
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
"}}}
"Post Initialization {{{
au GUIEnter * set lines=80 columns=160
color monokain
"set t_ZH=[3m
"set t_ZR=[23m
highlight Comment cterm=italic
filetype plugin indent on
syntax on
NeoBundleCheck
"}}}
