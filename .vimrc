
"set nocompatible

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
scriptencoding utf-8
set bomb

set runtimepath+=$HOME/.vim,$HOME/.vim/after

"----------------------------
" dein.vim

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim')
let s:dein_plugin_dir = expand('~/.vim/dein/plugin')

"set runtimepath+=s:dein_dir
execute 'set runtimepath^=' . s:dein_dir

"let g:vim_jsx_pretty_enable_jsx_highlight = 0
let g:vim_jsx_pretty_colorful_config = 1 " default 0

if dein#load_state(s:dein_plugin_dir)
    call dein#begin(s:dein_plugin_dir)

    " プラグインを変更したらvimから下のコマンドを実行
    " :call dein#install()

    call dein#add(s:dein_dir)
    call dein#add('Shougo/neocomplete.vim')

    call dein#add('altercation/vim-colors-solarized')

    " Editor
    call dein#add('sgur/vim-editorconfig')
    call dein#add('tyru/caw.vim')

    " Syntax files
    call dein#add('ekalinin/Dockerfile.vim')
    " js React JSX
    "call dein#add('othree/yajs.vim')
    call dein#add('pangloss/vim-javascript')
    call dein#add('maxmellon/vim-jsx-pretty')
    "call dein#add('othree/javascript-libraries-syntax.vim')
    "call dein#add('othree/es.next.syntax.vim')

    call dein#end()
    call dein#save_state()
endif

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

"----------------------------
" ファイル
set fileformats=dos,unix,mac            " 改行コードの自動認識
set fileformat=dos                      " 改行コードを設定する
set confirm                             " 保存されていないファイルがある場合は事前に保存確認
set hidden                              " 保存されていないファイルがある場合でも別のファイルを開けるようにする
set autoread                            " 外部でファイルが変更された場合は読み直す
set nobackup                            " ファイル保存時にバックアップファイルを作らない
set noswapfile                          " ファイル編集中にスワップファイルを作らない
set shellslash                          " Windowsでディレクトリパスの区切り文字に'/'を使えるようにする
set autochdir                           " カレントディレクトリを開いたファイルのディレクトリへ移動する

"----------------------------
" 一般
set history=50                          " コマンド、検索パターンの履歴保存数
"set t_Co=256                            " 256色化
set t_Co=16                            " 256色化
set nowrap                              " テキストの折り返しはしない
set shortmess+=I                        " 起動時のメッセージを表示しない
set visualbell t_vb=                    " ビープ音もフラッシュもしない

"----------------------------
" 検索
set incsearch                           " インクリメンタルサーチを行う
set ignorecase                          " 大文字と小文字を区別しない
set smartcase                           " 大文字と小文字が混在した場合は区別する
set wrapscan                            " 検索が最後尾まで到達したら先頭へ戻る

"----------------------------
" 編集
set smarttab                            " 
" set noexpandtab                         " タブをスペースに展開しない
set expandtab							" タブをスペースにする
set tabstop=4                           " タブ幅
set shiftwidth=4                        " オートインデントの幅
set backspace=indent,eol,start          " バックスペースでインデントや改行を削除できるようにする
set cindent                             " Cの自動インデントを有効化する
set cinoptions=:0,g0                    " インデントスタイルを設定
set nrformats-=octal                    " <C-a>,<C-x>の際に8進数を無効にする
set ambiwidth=double                    " □や○の文字があってもカーソル位置がずれないようにする
if has('win32')
    set iminsert=0                      " 挿入モード時のデフォルトのIMEの挙動を設定
    set imsearch=-1                     " iminsertに合わせる
endif
set lazyredraw                          " マクロなどの途中経過を再描画しない
set formatoptions+=mM                   " 日本語の行の連結時には空白を入力しない
augroup CustomFileType 
    autocmd!
    autocmd FileType * setlocal formatoptions-=t formatoptions+=rol
augroup END

"----------------------------
" QuickFix
autocmd QuickFixCmdPost *grep* cwindow  " vimgrepの検索結果を常にQuickFixに開く

"----------------------------
" tags
set tags=./.tags;,./tags;               " タグファイルを親ディレクトリに向かって検索

"----------------------------
" 装飾
set number                              " 行番号を表示
"set cursorline                          " カーソル行を強調表示する
set notitle                             " タイトルを表示しない
set ruler                               " カーソルが何行目の何列目に置かれているかを表示する
set showcmd                             " 入力中のコマンドをステータスに表示する
set nolist                              " タブや改行などの不可視文字を表示しない
set showmatch                           " 対応する括弧を強調表示
set matchpairs& matchpairs+=<:>         " 対応する括弧に<>を追加
set wildmenu                            " 補完候補をリスト表示
set laststatus=2                        " 常にステータス行を表示する
set cmdheight=1                         " コマンドラインの高さ

"----------------------------
" フォント
"set guifont=Consolas:h13
"set guifontwide=MeiryoKe_Console:h12
"set linespace=2                         " 行間の指定

"----------------------------
" シンタックスハイライト
"if &t_Co > 2 || has('gui_running')
"let hoge = confirm("gui", "y")
    syntax enable                       " シンタックスハイライトを有効にする
    set hlsearch                        " 検索文字列をハイライトする
"endif

set background=dark


"----------------------------
" マウス
set mouse=a                             " どのモードでもマウスを使えるようにする
set nomousefocus                        " マウスの移動でフォーカスを自動的に切り替えない
set mousehide                           " 入力時にマウスポインタを隠す


"----------------------------
" ローカル設定
if filereadable(expand($HOME.'/.vimrc_local'))
    source $HOME/.vimrc_local
endif

