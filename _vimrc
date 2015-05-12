" vim:set ts=2 sts=2 sw=2 tw=0:
let &runtimepath = &runtimepath.',~/.vim'

call plug#begin('~/.vim/plugged')
Plug 'LeafCage/yankround.vim'
Plug 'majutsushi/tagbar'
Plug 'cohama/agit.vim'
Plug 'vimwiki/vimwiki'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mattn/calendar-vim'
Plug 'mattn/httpstatus-vim'
Plug 'Shougo/vinarise'
Plug 'Shougo/neosnippet'
Plug 'yuratomo/dotfiles'
Plug 'yuratomo/w3m.vim'
Plug 'yuratomo/weather.vim'
Plug 'yuratomo/vs.vim'
Plug 'yuratomo/dbg.vim'
Plug 'yuratomo/bg.vim'
Plug 'yuratomo/neon.vim'
Plug 'yuratomo/gmail.vim'
Plug 'yuratomo/gnews.vim'
Plug 'yuratomo/ltools.vim'
Plug 'yuratomo/winfiler'
Plug 'yuratomo/ildasm.vim'
Plug 'yuratomo/javap.vim'
Plug 'yuratomo/neosnippet-defines'
Plug 'yuratomo/dotnet-complete'
Plug 'yuratomo/cpp-api-complete'
Plug 'yuratomo/cpp-api-windows'
Plug 'yuratomo/cpp-api-ddk'
Plug 'yuratomo/java-api-complete'
Plug 'yuratomo/java-api-javax'
Plug 'yuratomo/java-api-org'
Plug 'yuratomo/java-api-sun'
Plug 'yuratomo/java-api-servlet2.3'
Plug 'yuratomo/java-api-android'
Plug 'yuratomo/java-api-junit'
Plug 'yuratomo/flex-api-complete'
Plug 'yuratomo/phpapi-complete'
Plug 'yuratomo/perl-api-complete'
Plug 'yuratomo/html5-complete'
Plug 'yuratomo/css3-complete'
Plug 'yuratomo/ant-complete'
call plug#end()

if has('win32') && executable('jvgrep')
  set grepprg=jvgrep
endif

"---------------------------------------------------------------------------
" setting
"---------------------------------------------------------------------------
set visualbell
set number
set list
set nowrap
set showcmd
set noet ts=4 sw=4
set noscrollbind
set listchars=tab:>\ ,extends:<,trail:_,eol:~
set smartindent
set wildmenu
set wildmode=list:longest
set formatoptions+=mM
set hidden
set autoread
set laststatus=2
set cmdheight=1
set nobackup
set noswapfile
set complete=.,w,b,u
set tags+=tags;
set concealcursor=n
set nocursorline
set completeopt=menuone
set helplang=ja,en
set shortmess& shortmess+=I
set textwidth=0
set statusline=%f%m%#S1#\ %<%{expand('%:p:h')}%=%#S2#\ 
let &statusline .= '%{exists("b:git_branch") ?  "[" . b:git_branch . "]" : ""}'
let &statusline .= "%6{(&fenc!=''?&fenc:&enc)}\ %#S3#%6{&ff}\ %#S4#%6{&ft}%#S5#%4l-%-3c"
set undodir=~/.vim/undo/
set pumheight=20


"---------------------------------------------------------------------------
" autocommand
"---------------------------------------------------------------------------
augroup MyAutoCmd
au!
au FileType vim        set sw=2 ts=2 sts=2 et
au FileType c,cpp      set sw=4 ts=4 sts=4 noet 
au FileType java       set sw=4 ts=4 sts=4 noet
au FileType cs         set sw=4 ts=4 sts=4 et   fmr=#region,#endregion fdm=marker
au FileType javascript set sw=2 ts=2 sts=2 et
au FileType html       set sw=2 ts=2 sts=2 et
au FileType xaml       set sw=4 ts=4 sts=4 et
au FileType xml        set sw=2 ts=2 sts=2 et
au FileType php        setl omnifunc=phpapi#complete
au FileType php        inoremap <expr> <c-down> phpapi#nextRef()
au FileType php        inoremap <expr> <c-up>   phpapi#prevRef()
au FileType perl       setl omnifunc=perlapi#complete
au FileType perl       inoremap <expr> <c-down> perlapi#nextRef()
au FileType perl       inoremap <expr> <c-up>   perlapi#prevRef()

au BufNewFile,BufRead *.build   setf ant
au BufNewFile,BufRead *.targets setf xml
au BufNewFile,BufRead *.config  setf xml
au BufNewFile,BufRead *.*proj   setf xml
au BufNewFile,BufRead *.as      setf java
au BufNewFile,BufRead *.mxml    setf xml
au BufNewFile,BufRead *.xaml    setf xaml

au BufNewFile,BufRead *.xaml    setl omnifunc=xaml#complete
"au BufNewFile,BufRead *.cs      setl omnifunc=dotnet#complete
au BufNewFile,BufRead *.cs      setl omnifunc=OmniSharp#Complete
"au BufNewFile,BufRead *.cs      inoremap <expr> <c-down> dotnet#nextRef()
"au BufNewFile,BufRead *.cs      inoremap <expr> <c-up>   dotnet#prevRef()
au BufNewFile,BufRead *.java    setl omnifunc=javaapi#complete
au BufNewFile,BufRead *.java    inoremap <expr> <c-down> javaapi#nextRef()
au BufNewFile,BufRead *.java    inoremap <expr> <c-up>   javaapi#prevRef()
au BufNewFile,BufRead *.as      setl omnifunc=flexapi#complete
au BufNewFile,BufRead *.as      inoremap <expr> <c-down> flexapi#nextRef()
au BufNewFile,BufRead *.as      inoremap <expr> <c-up>   flexapi#prevRef()
au BufNewFile,BufRead *.mxml    setl omnifunc=mxml#complete
au BufNewFile,BufRead *.cpp     setl omnifunc=cppapi#complete
au BufNewFile,BufRead *.c       setl omnifunc=cppapi#complete
au BufNewFile,BufRead *.h       setl omnifunc=cppapi#complete
au BufNewFile,BufRead *.html    setl omnifunc=html5#complete
au BufNewFile,BufRead *.html    inoremap <expr> <c-down> html5#nextRef()
au BufNewFile,BufRead *.html    inoremap <expr> <c-up>   html5#prevRef()
au BufNewFile,BufRead *.css     setl omnifunc=css3#complete
au BufNewFile,BufRead build.xml setl omnifunc=ant#complete

au Filetype xml,xaml,mxml,html inoremap <buffer> </ </<C-x><C-o>
au Filetype xml,xaml,mxml,html inoremap <buffer> " "<C-x><C-o>

try
  au CompleteDone *.php         call phpapi#showRef()
  au CompleteDone *.pl          call perlapi#showRef()
"  au CompleteDone *.cs          call dotnet#showRef()
  au CompleteDone *.java        call javaapi#showRef()
  au CompleteDone *.as          call flexapi#showRef()
  au CompleteDone *.cpp         call cppapi#showRef()
  au CompleteDone *.cc          call cppapi#showRef()
catch /.*/
endtry

au BufRead,BufEnter * call MapForQuickFix()
au BufNewFile,BufRead * setl completefunc=neosnippet#complete

au BufEnter * CdCurrent

" 最後に編集した位置に移動する
au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" シンタックスで補完する
au FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

augroup END

"if has("balloon_eval") && has("balloon_multiline") 
"  au BufNewFile,BufRead *.cs    setl bexpr=dotnet#balloon()
"  au BufNewFile,BufRead *.java  setl bexpr=javaapi#balloon()
"  au BufNewFile,BufRead *.cpp   setl bexpr=cppapi#balloon()
"  au BufNewFile,BufRead *.c     setl bexpr=cppapi#balloon()
"  au BufNewFile,BufRead *.h     setl bexpr=cppapi#balloon()
"  au BufNewFile,BufRead *.cs    setl ballooneval
"  au BufNewFile,BufRead *.java  setl ballooneval
"  au BufNewFile,BufRead *.cpp   setl ballooneval
"  au BufNewFile,BufRead *.c     setl ballooneval
"  au BufNewFile,BufRead *.h     setl ballooneval
"endif

"---------------------------------------------------------------------------
" keymaps
"---------------------------------------------------------------------------

" like a emacs
inoremap <c-f> <RIGHT>
inoremap <c-b> <LEFT>
inoremap <c-d> <DELETE>
inoremap <c-a> <HOME>
inoremap <c-e> <END>
cnoremap <c-p> <UP>
cnoremap <c-n> <DOWN>
cnoremap <c-f> <RIGHT>
cnoremap <c-b> <LEFT>
cnoremap <c-a> <HOME>
cnoremap <c-e> <END>
cnoremap <c-d> <DELETE>
cnoremap <C-K> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<CR>
cnoremap <c-v> <c-r>*
cnoremap <c-q> <c-f>

" turn off IME when leave insert mode
inoremap <ESC> <ESC>
inoremap <C-[> <ESC>

" quick nohlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" like a browser
nnoremap <space>   <C-D>M
nnoremap <s-space> <C-U>M

" like a visual studio
inoremap <expr> <c-y>   pumvisible()?"\<c-y>":"\<c-x>\<c-o>\<c-p>"
inoremap <expr> <CR>    pumvisible()?"\<c-y>":"\<c-g>u\<CR>"
inoremap <expr> <TAB>   pumvisible()?"\<c-n>":"\<TAB>"
inoremap <expr> <s-TAB> pumvisible()?"\<c-p>":"\<s-TAB>"
inoremap <c-space> <c-x><c-o><c-p>

if has('gui')
  " resize window
  nnoremap <A-n> :execute 'set lines=' . (&lines + 1)<CR>
  nnoremap <A-p> :execute 'set lines=' . (&lines - 1)<CR>
  nnoremap <A-f> :execute 'set columns=' . (&columns + 5)<CR>
  nnoremap <A-b> :execute 'set columns=' . (&columns - 5)<CR>

  " move window
  nnoremap <expr><A-j> MoveWindow(0,20)
  nnoremap <expr><A-k> MoveWindow(0,-20)
  nnoremap <expr><A-h> MoveWindow(-20,0)
  nnoremap <expr><A-l> MoveWindow(20,0)
  function! MoveWindow(w,h)
    silent redir => pos
      winpos
    redir end
    let parts = split(pos, "[: ,]")
    let w = parts[-4]
    let h = parts[-1]
    silent exec ':winpos ' . (w+a:w) . ' ' . (h+a:h)
  endfunction
endif

" like a windows clipboard (<c-c> and <c-v>)
vnoremap <c-c> "*y
if has("virtualedit")
  nnoremap <silent> <SID>Paste :call <SID>Paste()<CR>
  func! <SID>Paste()
    let ove = &ve
    set ve=all
    normal `^"+gPi
    let &ve = ove
  endfunc
  inoremap <script> <C-V> x<BS><Esc><SID>Pastegi
else
  inoremap <script> <C-V> x<Esc><SID>Paste"_s
endif

" neosnipet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory = '~/.vim/plugged/neosnippet-defines/snippets/'

" find word under the cursor
nnoremap + <right>?<c-r><c-w><cr><c-o><left>

" quick open xxx
nnoremap \ss :<c-u>EchoShell<RETURN>
nnoremap \ff :<c-u>WinFilerFind<RETURN>
nnoremap \vv :<c-u>QuickOpen vimrc<RETURN>
nnoremap \tt :<c-u>TagbarToggle<RETURN>
nnoremap \gg :<c-u>GrepRoot  *<LEFT><LEFT>
nnoremap \gc :<c-u>LgrepCancel<RETURN>
nnoremap \mm :<c-u>Lmru<RETURN>
nnoremap \oo :<c-u>Loutline<RETURN>
nnoremap \bb :<c-u>Lbookmark<RETURN>
nnoremap \ba :<c-u>LRegistBookmark<RETURN>
nnoremap \qq :<c-u>Lquick<RETURN>
nnoremap \gb :<c-u>GitBranch<RETURN>
nnoremap \gc :<c-u>GitCheckout 
nnoremap \gl :<c-u>GitLog<RETURN> 

command! -nargs=1 QuickOpen    :call QuickOpen(<f-args>)
let s:show_quick_mode = {
  \ 'shell' : { 'bufname':'dbg-1',      'cmd':':DbgShell'                 },
  \ 'filer' : { 'bufname':'Lfiler-1',   'cmd':':Lfiler'                   },
  \ 'vimrc' : { 'bufname':'_vimrc',     'cmd':'edit ' . expand('<sfile>') },
  \ }

nnoremap <F3> :GrepResult<RETURN>
nnoremap <F5> :<c-u>Back make<RETURN>

" 括弧を自動補完 (改造版)
"inoremap {{ {}<LEFT>
"inoremap [[ []<LEFT>
"inoremap (( ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 最後に編集したテキストを選択
nnoremap gc  `[v`]

" タグジャンプを使いやすく
nnoremap t  <Nop>
nnoremap tt  <C-]>
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
nnoremap tl  :<C-u>tags<CR>

"---------------------------------------------------------------------------
" Plugin settings
"---------------------------------------------------------------------------

" w3m
let g:w3m#homepage = 'http://www.google.co.jp/'

" gmail.vim
let g:gmail_user_name = 'yura.tomo@gmail.com'
let g:gmail_mailbox_trash = "[Gmail]/ゴミ箱"
"let g:gmail_show_log_window = 1

" ltools
let g:Lmru_max_count = 10000

" gnews
let g:gnews#url = [
  \ 'http://pipes.yahoo.com/pipes/pipe.run?_id=a1f4674ad9a307d54262ff8b600793f6&_render=json',
  \ ]

" vs.vim (WDK)
let g:vs_wdk_cond  = 'chk'
if has('win64')
  let g:vs_wdk_cpu = 'amd64'
  let g:vs_wdk_os  = 'WIN7'
else
  let g:vs_wdk_cpu = 'x86'
  let g:vs_wdk_os  = 'WXP'
endif

" ildasm
if has('win64')
  let dotnet4 = 'C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\'
elseif has('win32')
  let dotnet4 = 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\'
endif
if has('win32')
  let g:ildasm_assemblies = [
    \ dotnet4 . 'mscorlib.dll',
    \ dotnet4 . 'WindowsBase.dll',
    \ dotnet4 . 'PresentationCore.dll',
    \ dotnet4 . 'PresentationFramework.dll',
    \ dotnet4 . 'System.Core.dll',
    \ dotnet4 . 'System.dll',
    \ dotnet4 . 'System.Drawing.dll',
    \ dotnet4 . 'System.Net.dll',
    \ ]
endif

" javap.vim
let g:javap_defines = [
  \ { 'jar'     : $JAVA_HOME . '/jre/lib/rt.jar',
  \   'javadoc' : 'http://docs.oracle.com/javase/jp/6/api/%s.html' }, 
  \ { 'jar'     : 'c:\xampp\tomcat\lib\servlet-api.jar',
  \   'javadoc' : 'http://www.jajakarta.org/tomcat/servletapi/servletapi-4.0/docs-ja/%s.html' },
  \ { 'jar'     : $AXIS2_HOME . '/lib/axis2-kernel-1.6.1.jar',
  \   'javadoc' : 'http://axis.apache.org/axis2/java/core/api/%s.html' },
  \ { 'jar'     : $AXIS2_HOME . '/lib/log4j-1.2.15.jar',
  \   'javadoc' : 'http://logging.apache.org/log4j/1.2/apidocs/%s.html' },
  \ { 'jar'     : $ANDROID_HOME . 'sdk/platforms/android-19/android.jar',
  \   'javadoc' : 'http://developer.android.com/reference/%s.html' },
  \ ]

" Laltfile
let g:Laltfile_mapping = []
call add(g:Laltfile_mapping, {'SL.xaml$'        : '.xaml.cs'  } )
call add(g:Laltfile_mapping, {'\.xaml.cs$'      : 'WPF.xaml'  } )
call add(g:Laltfile_mapping, {'WPF.xaml$'       : 'SL.xaml'   } )
call add(g:Laltfile_mapping, {'.mxml$'          : 'Cntl.as'   } )
call add(g:Laltfile_mapping, {'Cntl.as$'        : '.mxml'     } )

" Lfiler
let g:loaded_netrwPlugin = "v140"

" dbg.vim
let g:dbg#command_mdbg = 
  \ 'C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\NETFX 4.0 Tools\mdbg.exe'

" java-api-complete
let g:javaapi#delay_dirs = [
  \ 'java-api-javax',
  \ 'java-api-org',
  \ 'java-api-sun',
  \ 'java-api-servlet2.3',
  \ 'java-api-android',
  \ ]

" cpp-api-complete
let g:cppapi#delay_dirs = [
  \ 'cpp-api-windows',
  \ 'cpp-api-ddk',
  \ ]

" jvgrep
let s:ignore_ext = [
  \ 'git', 'svn',
  \ 'o', 'obj', 'a', 'lib', 'so', 'dll', 'exe', 'bin', 
  \ 'suo', 'pdb', 'balm', 'tlog', 'cache', 'lref', 'resources', 'exe.config', 'trx', 'dat', 
  \ 'aps', 'pch', 'idb', 'dep', 'ilk', 'ncb', 'clw',
  \ 'g.cs', 'g.i.cs', 'designer.cs', 'class',
  \ 'swp', 'swo', 'bak']
let $JVGREP_EXCLUDE =
  \ join(map(
  \   copy(s:ignore_ext),
  \   '''\.'' . escape(v:val, ''\*+.?{}()[]^$-|/'') . ''$'''), '|')
  \   . '|tags'

" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50

"---------------------------------------------------------------------------
" Convenient scripts
"---------------------------------------------------------------------------

" バッファ変更時にカレントディレクトリに移動する
command! -nargs=0 CdCurrent :call CdCurrent()
function! CdCurrent()
  try
    cd %:p:h
  catch /.*/
  endtry
endfunc

" 2つの範囲のdiffをとる
command! -nargs=0 -range DiffClip <line1>, <line2>:call DiffClip('0')
function! DiffClip(reg) range
  exe "let @a=@" . a:reg
  exe a:firstline  . "," . a:lastline . "y b"
  new
  set buftype=nofile bufhidden=wipe
  put a
  diffthis
  vnew
  set buftype=nofile bufhidden=wipe
  put b
  diffthis 
endfunction

" 変更前と変更中のバッファのdiffをとる
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" タグファイル更新
command! -nargs=* -complete=dir UpdateTags  :call UpdateTags(<f-args>)
function! UpdateTags(...)
  let pwd  = expand('%:p:h')
  if a:0 == 0
    let path = GetRoot()
  else
    let path = a:1
  endif
  exe 'cd ' . path
  let ext = expand('%:p:e')
  if ext ==? 'php'
    silent exe ':!start /MIN ctags -ex -f %:p:h/tags --langmap="php:+.inc" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>' . path
  elseif ext ==? 'as'
    silent exe ":!start /MIN ctags -R --languages=actionscript " . path
  else
    silent exe ":!start /MIN ctags -R --cs-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q " . path
  endif
  exe 'cd ' . pwd
endfunction

" <c-r>rでルートディレクトリ補完
cnoremap <c-r>r <C-R>=GetRoot()<CR>

" sln/makefile/build.xmlなどがあるルートディレクトリ取得
let s:base_files = [
\ 'Makefile',
\ 'makefile',
\ 'build.xml',
\ '*.sln',
\ '*.mak',
\ ]
command! -nargs=* GrepRoot  :call GrepRoot(<f-args>)
function! GrepRoot(...)
  let root = GetRoot()
  if root == ''
    let path = '**/' . a:2
  else
    let path = root . '/**/' . a:2
  endif
  call Lgrep#do(a:1, path)
endfunction
function! GetRoot()
  let param = ''
  let find = 0
  let cnt = 10
  while cnt > 0
    let pwd  = expand('%:p:h' . param)
    if strlen(pwd) == 3
      break
    endif

    for f in s:base_files
      let file = expand(pwd . '/' . f)
      if filereadable(file)
        let find = 1
        break
      endif
    endfor
	if find == 1
	  break
	endif
    let param .= ':h'
    let cnt -= 1
  endwhile
  if find == 1
    return substitute(param, ':h', '..\', 'g')
  endif
  return ''
endfunction

" 簡易シェル
command! -nargs=* EchoShell  :call EchoShell(<f-args>)
function! EchoShell(...)
  let text = ''
  if a:0 > 0
    let text = a:1
  endif
  let cmd = input('>', text)
  if cmd != ''
    let res = system(cmd)
    redraw
    echo res
  endif
endfunction

" 現在時刻表示
command! -nargs=0 Now  : echo strftime("%Y/%b/%d %X")

" コマンドモードで現在バッファファイル名を補完
cnoremap <C-X> <C-R>=<SID>GetBufferFileName()<CR>
function! s:GetBufferFileName()
  let path = expand('%:p')
  return path
endfunction

" ビジュアルモード選択した部分を*で検索
vnoremap * "zy:let @/ = @z<CR>n

" クリップボードにカレントファイル名をコピー
command! -nargs=0 Gp let @* = expand('%:p')
cabbrev gp Gp

" クリップボードにカレントフォルダをコピー
command! -nargs=0 Gd let @* = expand('%:p:h')
cabbrev gd Gd

" クリップボードのファイルを開く
command! -nargs=0 Sd exec 'edit '. @*
cabbrev sd Sd

" クイック表示
function! QuickOpen(mode)
  if bufexists(s:show_quick_mode[a:mode].bufname)
    if bufname('%') == s:show_quick_mode[a:mode].bufname
      b #
    else
      exe 'b ' . s:show_quick_mode[a:mode].bufname
    endif
  else
    exec s:show_quick_mode[a:mode].cmd
  endif
endfunction

" 矩形選択のI,A
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')
function! s:force_blockwise_visual(next_key)
  if mode() ==# 'v'
    return "\<C-v>" . a:next_key
  elseif mode() ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else  " mode() ==# "\<C-v>"
    return a:next_key
  endif
endfunction

"カーソル行をBOLD、入力モードでBOLD解除、他のウィンドウでカーソル解除
if has('syntax')
  augroup InsertHook
    autocmd! InsertHook
    autocmd InsertEnter      * hi CursorLine guibg=NONE gui=NONE
    autocmd InsertLeave      * hi CursorLine guibg=NONE gui=BOLD
    autocmd InsertEnter      * hi CursorLineNr guifg=BLUE  guibg=WHITE gui=BOLD
    autocmd InsertLeave      * hi CursorLineNr guifg=WHITE guibg=BLUE  gui=NONE
    autocmd WinLeave         * setl nocursorline
    autocmd WinEnter,BufRead * setl cursorline
  augroup END
endif

" 今開いているウィンドウを新しいタブで開きなおす
command! OpenNewTab  :call OpenNewTab()
function! OpenNewTab()
  let l:f = expand("%:p")
  if winnr('$') != 1 || tabpagenr('$') != 1
    execute ":q"
    execute ":tabnew ".l:f
  endif
endfunction

" バックグラウンドでgrepさせる
command! -nargs=* Grep :call GrepNewWindow(<f-args>)
function! GrepNewWindow(...)
  let g:grep_base = expand('%:p:h')
  let g:grep_str  = a:000[0]
  exe ':!start cmd /c "jvgrep ' . join(a:000, ' ') . '" | tee ' . expand('~') . '/.grep_list'
  redraw
endfunction
command! -nargs=0 GrepResult :call GrepResult()
function! GrepResult()
  if exists('g:grep_base')
    exe 'cd "' . g:grep_base . '"'
    unlet g:grep_base
  else
    let bfile = expand("~") . "/.grep_base"
    if !filereadable(bfile)
      return
    endif
    let pwd = readfile(bfile)[0]
    exe 'cd "' . pwd . '/"'
  endif
  cfile ~/.grep_list
  cw
  call Lsearch#Clear()
  if exists('g:grep_str')
    call Lsearch#Search(g:grep_str)
    unlet g:grep_str
  endif
endfunction

" QuickFixウィンドウだけのマップ
function! MapForQuickFix()
  if &buftype=="quickfix"
    nnoremap <buffer> <s-j>  j<CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
    nnoremap <buffer> <s-k>  k<CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
    nnoremap <buffer> <s-CR> <CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
  endif
endfunction

" 別ウィンドウで開く
command! -nargs=0 OpenNewWindow :silent !start gvim %

" git branch => vim statusline
command! -nargs=0 GitBranch :call GitBranch()
function! GitBranch()
  let dir = expand('%:p:h')
  let branch = ""
  if isdirectory(dir)
    try
      let r = system('cd ' . dir . ' && git symbolic-ref HEAD 2> /dev/null')
      if r != "" && v:shell_error == 0
        let branch = split(r,"/")[-1][:-2]
        echo join(systemlist('git branch'), ' ')
      endif
    catch /.*/
    endtry
  endif
  let b:git_branch = branch
endfunction

" git checkout
command! -nargs=1 -complete=customlist,GitBranchList GitCheckout :call GitCheckout(<f-args>)
function! GitCheckout(branch)
  let res = system('git checkout ' . substitute(a:branch, '\*', '', ''))
  if v:shell_error == 0
    let b:git_branch = substitute(a:branch, '\*', '', '')
  else
	echo res
  endif
endfunction
function! GitBranchList(A, L, P)
  let items = []
  let branchees = systemlist('git branch')
  if v:shell_error != 0
    echo join(branchees, ' ')
    return []
  endif
  for item in branchees
    if item[2:] =~ '^'.a:A
      call add(items, substitute(item, ' ',  '', 'g'))
    endif
  endfor
  return items
endfunction

" git log
command! -nargs=0 GitLog :call GitLog()
function! GitLog()
  let lines = systemlist('git log --graph --shortstat --date=short --pretty=format:"%h %ad %an %s %d"')
  if v:shell_error == 0
    new +setl\ buftype=nofile\ bufhidden=delete\ noswf\ nowrap\ hidden\ nolist
    call setline(1,map(lines, 'iconv(v:val, "utf-8", &enc)'))
    setl nomodifiable
  else
    echo join(lines, ' ')
  endif
endfunction

finish

#---------------------------------------------------------------------------
# Manual Install
#---------------------------------------------------------------------------
# - git
#  http://code.google.com/p/msysgit/downloads/list
#

#---------------------------------------------------------------------------
# Tool Install
#---------------------------------------------------------------------------
# - vim
curl -fLo vim.zip http://files.kaoriya.net/goto/vim74w32
unzip vim.zip
mv vim74-kaoriya-win32 /c/vim
rm vim.zip
cd /c/vim

# - plug.vim
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
# - w3m
curl -fLo w3m.zip http://hp.vector.co.jp/authors/VA052357/w3m-0.5.3-mingw32.zip
unzip w3m.zip -x w3mbookmark.exe w3mhelperpanel.exe readme.txt
rm w3m.zip

# - diff
curl -fLo diff.zip http://gnuwin32.sourceforge.net/downlinks/diffutils-bin-zip.php
curl -fLo diff-dep.zip http://gnuwin32.sourceforge.net/downlinks/diffutils-dep-zip.php
unzip diff.zip bin/diff.exe
mv bin/diff.exe .
unzip diff-dep.zip bin/libiconv2.dll bin/libintl3.dll
mv bin/* .
rmdir bin
rm diff.zip
rm diff-dep.zip

# - ctags
curl -fLo ctags.zip http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ec58j2w32bin.zip
unzip ctags.zip ctags58j2bin/ctags.exe
mv ctags58j2bin/ctags.exe .
rmdir ctags58j2bin
rm ctags.zip

# - jvgrep
curl -fLo jvgrep.tar.gz https://github.com/downloads/mattn/jvgrep/jvgrep-win32-2.7.tar.gz
tar xzvf jvgrep.tar.gz
mv jvgrep-win32-2.7/* .
rmdir jvgrep-win32-2.7
rm jvgrep.tar.gz

# - ag
curl -fLo ag.exe https://kjkpub.s3.amazonaws.com/software/the_silver_searcher/rel/0.18.1-1129/ag.exe

# - dotfiles
mkdir -p ~/.vim/plugged
cd ~/.vim/plugged
git clone git://github.com/yuratomo/dotfiles.git
cd /c/vim
ln ~/.vim/plugged/dotfiles/_vimrc ~/_vimrc
ln ~/.vim/plugged/dotfiles/_gvimrc ~/_gvimrc
