" .vimrc
" Ver 1.02

if &compatible
  set nocompatible
endif

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
scriptencoding utf-8
set bomb

" set runtimepath+=$HOME/.vim,$HOME/.vim/after
set runtimepath+=$HOME/.vim

"set t_Co=256        " 256色化
set t_Co=16         " 16色化


"------------------------------------------------
" dein.vim
let s:dein_dir = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim')
if filereadable(s:dein_dir )

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

    "------------------------------
    " Theme
    call dein#add('altercation/vim-colors-solarized')

    "------------------------------
    " Editor
    call dein#add('sgur/vim-editorconfig')
    call dein#add('tyru/caw.vim')

    "------------------------------
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
" ColorsShemeの設定
set t_Co=16         " 16色化

let g:solarized_contrast="high"
"let g:solarized_visibility="high"
let g:solarized_termcolors=16
"let g:solarized_termcolors=256
let g:solarized_italic=0

colorscheme solarized

" 対応する括弧が視認し難いのでカラーを上書き
hi MatchParen ctermfg=160 ctermbg=238
" hi MatchParen guifg=blue guibg=blue

endif   " dein


"------------------------------------------------
" ファイル
set fileformat=unix                      " 改行コードを設定する

" 新規ファイルの場合最初の改行コードが使われます
set fileformats=mac,dos,unix            " 改行コードの自動認識

set confirm                             " 保存されていないファイルがある場合は事前に保存確認
set hidden                              " 保存されていないファイルがある場合でも別のファイルを開けるようにする
set autoread                            " 外部でファイルが変更された場合は読み直す
set nobackup                            " ファイル保存時にバックアップファイルを作らない
set noswapfile                          " ファイル編集中にスワップファイルを作らない
set shellslash                          " Windowsでディレクトリパスの区切り文字に'/'を使えるようにする
set autochdir                           " カレントディレクトリを開いたファイルのディレクトリへ移動する

"------------------------------------------------
" 一般
set history=50                          " コマンド、検索パターンの履歴保存数
set nowrap                              " テキストの折り返しはしない
set shortmess+=I                        " 起動時のメッセージを表示しない
set visualbell t_vb=                    " ビープ音もフラッシュもしない

"------------------------------------------------
" 検索
set incsearch                           " インクリメンタルサーチを行う
set ignorecase                          " 大文字と小文字を区別しない
set smartcase                           " 大文字と小文字が混在した場合は区別する
set wrapscan                            " 検索が最後尾まで到達したら先頭へ戻る

"------------------------------------------------
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

"------------------------------------------------
" QuickFix
autocmd QuickFixCmdPost *grep* cwindow  " vimgrepの検索結果を常にQuickFixに開く

"------------------------------------------------
" tags
set tags=./.tags;,./tags;               " タグファイルを親ディレクトリに向かって検索

"------------------------------------------------
" 装飾
set number                              " 行番号を表示
set notitle                             " タイトルを表示しない
set ruler                               " カーソルが何行目の何列目に置かれているかを表示する
set showcmd                             " 入力中のコマンドをステータスに表示する
set nolist                              " タブや改行などの不可視文字を表示しない
set showmatch                           " 対応する括弧を強調表示
set matchpairs& matchpairs+=<:>         " 対応する括弧に<>を追加
set wildmenu                            " 補完候補をリスト表示
set laststatus=2                        " 常にステータス行を表示する
set cmdheight=1                         " コマンドラインの高さ

" set cursorline                          " カーソル行を強調表示する
set nocursorline                          " カーソル行を強調表しない
" 挿入モード時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

"------------------------------------------------
" フォント
"set guifont=Consolas:h13
"set guifontwide=MeiryoKe_Console:h12
"set linespace=2                         " 行間の指定

"------------------------------------------------
" シンタックスハイライト
"if &t_Co > 2 || has('gui_running')
"let hoge = confirm("gui", "y")
    syntax enable                       " シンタックスハイライトを有効にする
    set hlsearch                        " 検索文字列をハイライトする
"endif

set background=dark

"------------------------------------------------
" マウス
set mouse=a                             " どのモードでもマウスを使えるようにする
set nomousefocus                        " マウスの移動でフォーカスを自動的に切り替えない
set mousehide                           " 入力時にマウスポインタを隠す


"------------------------------------------------
" key remap
" Insert Modeで<Esc>にマッピングしてkenaiはいけない

" Escの反応を…
" set notimeout
" set ttimeout
" set timeoutlen=1000

set timeout timeoutlen=1000 ttimeoutlen=50

"----------------------------
" Normal & Visual
"noremap

"----------------------------
" Command & Insert
" noremap!

"----------------------------
" Normal Mode
" カーソル位置から行末までコピー
nnoremap Y y$

"----------------------------
" Insert Mode
inoremap <Right> <Right>

inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-D> <Delete>
inoremap <C-K> <Esc><Right>d$a

"----------------------------
" CommandLine Mode
" cnoremap


"------------------------------------------------
"function! s:Func(flg)
function! CLI_CommonSettings()
    " echo a:flg
    " echo "CLI_CommonSettings()"

	" カーソルを変更
    if $TERM != 'screen'
        let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
        let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
        let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
        let &t_te .= "\e[0 q"  " termcap モードから抜ける
        " iTerm2
        " let &t_SI = "\e]50;CursorShape=1\x7"
        " let &t_EI = "\e]50;CursorShape=0\x7"
    else
        " echo "screen"

        " Screen
        let &t_SI .= "\eP\e[5 q\e\\"
        let &t_EI .= "\eP\e[1 q\e\\"
        let &t_ti .= "\eP\e[1 q\e\\"
        let &t_te .= "\eP\e[0 q\e\\"

        " let &t_SI .= "\eP\e[?7727h\e\\"
        " let &t_EI .= "\eP\e[?7727l\e\\"
        " inoremap <special> <Esc>O[ <Esc>

        " let &t_ti .= "\e[?7727h"
        " let &t_te .= "\e[?7727l"
        " noremap <special> <Esc>O[ <Esc>
        " noremap! <special> <Esc>O[ <Esc>
    endif


endfunction


"------------------------------------------------
" win32
if has('win32')
	if has('gui_running')
		" GUI
		set guioptions-=m
		set guioptions-=T
		set columns=181		" ウィンドウの幅
		set lines=41		" ウィンドウの高さ
		winpos 54 135		" ウィンドウの位置
	endif
endif


"------------------------------------------------
" win32unix
if has('win32unix')
    call CLI_CommonSettings()
endif

"------------------------------------------------
" mac
" MEMO: macOSのターミナルはunixになります。
if has('mac')
endif


"------------------------------------------------
" unix
" macOX, Z2
" let a1 = confirm(system("uname"), "y")
" let a1 = confirm($TERM, "y")
if has('unix')
    " echo 'unix'
    call CLI_CommonSettings()
endif


" let a1 = confirm(, "y")
if $TERM == 'screen'
    " call s:Func("hoge")
    "call CLI_CommonSettings()
endif


"------------------------------------------------
" iPad Pro 用
if system("uname -m") =~? '^arm*'
  "echo system("uname -m")

  "----------------------------
  " 2
  map  " <S-@>
  map! " <S-@>
  " 6
  map  & <S-^>
  map! & <S-^>
  " 7
  map  ' <S-&>
  map! ' <S-&>
  " 8
  map  ( <S-*>
  map! ( <S-*>
  " 9
  map  ) <S-(><S-)>
  map! ) <S-(><S-)>

  " 0
  "map  <S-0> <S-)>
  "map! <s-0> <S-)>
  " -
  map  = <S-_>
  map! = <S-_>
  " ^
  map  ^ <S-=>
  map! ^ <S-=>
  map  ~ <S-+>
  map! ~ <S-+>

  " @
  map  @ <S-[>
  map! @ <S-[>
  map  ` <S-{>
  map! ` <S-{>
  " [
  map  [ <S-]>
  map! [ <S-]>
  map  { <S-}>
  map! { <S-}>

  " れ
  map  + <S-:>
  map! + <S-:>
  " け
  map  : <S-'>
  map! : <S-'>
  map  * <S-">
  map! * <S-">
  " む
  "map  ] <LF>
  "map! ] <LF>

  " ろ
  "map _ <S>

endif

"echo system("uname -a")
"echo system("uname -m")
"echo $TERM


"------------------------------------------------
" ローカル設定
if filereadable(expand($HOME.'/.vimrc_local'))
    source $HOME/.vimrc_local
endif


