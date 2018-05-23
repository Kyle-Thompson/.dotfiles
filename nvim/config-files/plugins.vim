" ========== Plugins ==========
" =============================

" install vim-plug if it's not already
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

    " autocompletion
    Plug 'roxma/nvim-completion-manager'  " Completion engine
    " Plug 'rust-lang/rust.vim'             " (Included in polyglot)
    Plug 'racer-rust/vim-racer'           " TODO
    Plug 'roxma/nvim-cm-racer'            " TODO

    " colourscheme
    Plug 'Kyle-Thompson/xresources-colors.vim'

    " commenting
    Plug 'scrooloose/nerdcommenter'

    " file explorer
    Plug 'scrooloose/nerdtree'

    " fuzzy file searching
    Plug 'junegunn/fzf', { 'dir': $XDG_DATA_HOME . '/fzf',
                         \ 'do': './install --all'}
    Plug 'junegunn/fzf.vim'

    " git
    Plug 'tpope/vim-fugitive'     " command-line git wrapper
    " Plug 'airblade/vim-gitgutter' " git changes in the gutter

    " language pack
    Plug 'sheerun/vim-polyglot'

    " linting
    Plug 'neomake/neomake'

    " movement
    Plug 'easymotion/vim-easymotion'

    " pairing utilities
    Plug 'tpope/vim-surround'   " wrap text with new pair
    Plug 'jiangmiao/auto-pairs' " create new empty pair

    " REPL messages
    Plug 'metakirby5/codi.vim' " TODO

    " snippets TODO actually make use of this.
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " text
    Plug 'godlygeek/tabular'    " alignment
    Plug 'tommcdo/vim-exchange' " swapping
    Plug 'wellle/targets.vim'   " objects

    " transparency
    Plug 'miyakogi/seiya.vim'

call plug#end()


" ===== autocompletion =====
" rust
let g:rustc_path = $HOME.".cargo/bin/rustc"


" ===== colorscheme =====
silent! colorscheme xres


" ===== deoplete =====
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" ===== easymotion =====
" map <leader>m <Plug>(easymotion-prefix)


" ===== neomake =====
" general
autocmd! BufWritePost * Neomake
let g:neomake_verbose = 0
let g:neomake_open_list = 2

" c++
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ['-std=c++1z', '-Wall', '-Wextra', '-fsyntax-only']

" c
let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_args = ['-std=c11', '-Wall', '-Wextra', '-fsyntax-only']

" python
let g:neomake_python_enable_markers = ['flake8']

" rust


" ===== nerdtree =====
nnoremap <leader>n :NERDTree<CR>
" TODO function to auto-close when nerdtree is the only buffer left


" ===== transparency =====
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
