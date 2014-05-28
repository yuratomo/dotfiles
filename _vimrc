" vim:set ts=2 sts=2 sw=2 tw=0:
"---------------------------------------------------------------------------
" Manual Install
"---------------------------------------------------------------------------
"
" - git
"  http://code.google.com/p/msysgit/downloads/list
"
" - ctags
"  http://hp.vector.co.jp/authors/VA025040/
"
" - jvgrep
"  https://github.com/mattn/jvgrep/downloads
"
" - w3m
"  http://hp.vector.co.jp/authors/VA052357/w3m_w32.html
"
" - diff
"  http://gnuwin32.sourceforge.net/packages/diffutils.htm
"
"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------
" mkdir -p ~/.vim/bundle
" git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle.git
" cd ~/.vim/bundle
" git clone git://github.com/yuratomo/dotfiles.git
"
" (win 7)
" mklink ~\.ctags ~\.vim\bundle\dotfiles\.ctags
" mklink ~\_vimrc ~\.vim\bundle\dotfiles\_vimrc
" mklink ~\_gvimrc ~\.vim\bundle\dotfiles\_gvimrc
" mklink c:\vim\vimrc_local.vim .vim\bundle\dotfiles\vimrc_local.vim
" mklink c:\vim\gvimrc_local.vim .vim\bundle\dotfiles\gvimrc_local.vim
"

set nocompatible

try
  "filetype off
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()

  Bundle 'git://github.com/scrooloose/syntastic.git'
  Bundle 'git://github.com/majutsushi/tagbar.git'
  Bundle 'git://github.com/mattn/calendar-vim.git'
  Bundle 'git://github.com/mattn/excitetranslate-vim.git'
  Bundle 'git://github.com/mattn/webapi-vim.git'
  Bundle 'git://github.com/mattn/httpstatus-vim.git'
  Bundle 'git://github.com/Shougo/vinarise.git'
  Bundle 'git://github.com/Shougo/neosnippet.git'
  Bundle 'git://github.com/Shougo/vimproc.vim.git'
  Bundle 'git://github.com/vim-scripts/vimwiki.git'
  Bundle 'git://github.com/yuratomo/dotfiles.git'
  Bundle 'git://github.com/yuratomo/w3m.vim.git'
  Bundle 'git://github.com/yuratomo/weather.vim.git'
  Bundle 'git://github.com/yuratomo/vs.vim.git'
  Bundle 'git://github.com/yuratomo/dbg.vim.git'
  Bundle 'git://github.com/yuratomo/bg.vim.git'
  Bundle 'git://github.com/yuratomo/neon.vim.git'
  Bundle 'git://github.com/yuratomo/gmail.vim.git'
  Bundle 'git://github.com/yuratomo/gnews.vim.git'
  Bundle 'git://github.com/yuratomo/ltools.vim.git'
  Bundle 'git://github.com/yuratomo/winfiler.git'
  Bundle 'git://github.com/yuratomo/ildasm.vim.git'
  Bundle 'git://github.com/yuratomo/javap.vim.git'
  Bundle 'git://github.com/yuratomo/neosnippet-defines.git'
  Bundle 'git://github.com/yuratomo/dotnet-complete.git'
  Bundle 'git://github.com/yuratomo/cpp-api-complete.git'
  Bundle 'git://github.com/yuratomo/cpp-api-windows.git'
  Bundle 'git://github.com/yuratomo/cpp-api-ddk.git'
  Bundle 'git://github.com/yuratomo/java-api-complete.git'
  Bundle 'git://github.com/yuratomo/java-api-javax.git'
  Bundle 'git://github.com/yuratomo/java-api-org.git'
  Bundle 'git://github.com/yuratomo/java-api-sun.git'
  Bundle 'git://github.com/yuratomo/java-api-servlet2.3.git'
  Bundle 'git://github.com/yuratomo/java-api-android.git'
  Bundle 'git://github.com/yuratomo/java-api-junit.git'
  Bundle 'git://github.com/yuratomo/flex-api-complete.git'
  Bundle 'git://github.com/yuratomo/phpapi-complete.git'
  Bundle 'git://github.com/yuratomo/perl-api-complete.git'
  Bundle 'git://github.com/yuratomo/html5-complete.git'
  Bundle 'git://github.com/yuratomo/css3-complete.git'
  Bundle 'git://github.com/yuratomo/ant-complete.git'

  filetype plugin indent on
catch /.*/
endtry

if has('win32') && executable('jvgrep')
  set grepprg=jvgrep\ --exclude\ \\.g\\.i\\.cs$\|\\.git$\|\\.svn$\|\\.o$\|\\.obj$\|\\.exe$\|\\.pdb$\|\\.dll$\|\\.ncb$\|\\.exp$\|\\.lib$\|\\.bak$\|^Debug$\|^Release$
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
set completeopt=menuone
set helplang=ja,en
set shortmess& shortmess+=I
set textwidth=0
set statusline=%f%m%#S1#\ %<%{expand('%:p:h')}%=%#S2#\ %6{(&fenc!=''?&fenc:&enc)}\ %#S3#%6{&ff}\ %#S4#%6{&ft}%#S5#%4l-%-3c


"---------------------------------------------------------------------------
" autocommand
"---------------------------------------------------------------------------
au FileType vim        set sw=2 ts=2 sts=2 et
au FileType c,cpp      set sw=4 ts=4 sts=4 noet 
au FileType java       set sw=4 ts=4 sts=4 noet fmr={,} fdm=marker
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
au BufNewFile,BufRead *.cs      setl omnifunc=dotnet#complete
au BufNewFile,BufRead *.cs      inoremap <expr> <c-down> dotnet#nextRef()
au BufNewFile,BufRead *.cs      inoremap <expr> <c-up>   dotnet#prevRef()
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
"au BufNewFile,BufRead *.css     setl omnifunc=csscomplete#CompleteCSS

augroup xaml
  au!
  autocmd Filetype xml,xaml,mxml,html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype xml,xaml,mxml,html inoremap <buffer> " "<C-x><C-o>
augroup END

try
  au CompleteDone *.php         call phpapi#showRef()
  au CompleteDone *.pl          call perlapi#showRef()
  au CompleteDone *.cs          call dotnet#showRef()
  au CompleteDone *.java        call javaapi#showRef()
  au CompleteDone *.as          call flexapi#showRef()
  au CompleteDone *.cpp         call cppapi#showRef()
  au CompleteDone *.cc          call cppapi#showRef()
catch /.*/
endtry

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
cnoremap <c-w> <c-f>

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
let g:neosnippet#snippets_directory = '~/.vim/bundle/neosnippet-defines/snippets/'
au BufNewFile,BufRead * setl completefunc=neosnippet#complete

" find word under the cursor
"nnoremap + <right>?<c-r><c-w><cr><c-o><left>

" quick open xxx
nnoremap \ss :<c-u>QuickOpen shell<RETURN>
nnoremap \ff :<c-u>QuickOpen filer<RETURN>
nnoremap \vv :<c-u>QuickOpen vimrc<RETURN>
nnoremap \tt :<c-u>TagbarToggle<RETURN>
nnoremap \gg :<c-u>Back grep  *<LEFT><LEFT>
nnoremap <F5> :<c-u>Back make<RETURN>

command! -nargs=1 QuickOpen    :call QuickOpen(<f-args>)
let s:show_quick_mode = {
  \ 'shell' : { 'bufname':'dbg-1',      'cmd':':DbgShell'                 },
  \ 'filer' : { 'bufname':'Lfiler-1',   'cmd':':Lfiler'                   },
  \ 'vimrc' : { 'bufname':'_vimrc',     'cmd':'edit ' . expand('<sfile>') },
  \ }

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

" javap
let g:javap_defines = [
  \ { 'jar'     : $JAVA_HOME . '/jre/lib/rt.jar',
  \   'javadoc' : 'http://docs.oracle.com/javase/jp/6/api/%s.html' }, 
  \ { 'jar'     : 'c:\xampp\tomcat\lib\servlet-api.jar',
  \   'javadoc' : 'http://www.jajakarta.org/tomcat/servletapi/servletapi-4.0/docs-ja/%s.html' },
  \ { 'jar'     : $AXIS2_HOME . '/lib/axis2-kernel-1.6.1.jar',
  \   'javadoc' : 'http://axis.apache.org/axis2/java/core/api/%s.html' },
  \ { 'jar'     : $AXIS2_HOME . '/lib/log4j-1.2.15.jar',
  \   'javadoc' : 'http://logging.apache.org/log4j/1.2/apidocs/%s.html' },
  \ { 'jar'     : $ANDROID_HOME . '/libs/android.jar',
  \   'javadoc' : 'http://developer.android.com/reference/%s.html' },
  \ ]

" jscomplete-vim
autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']

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
let g:dbg#command_mdbg= 'C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\NETFX 4.0 Tools\mdbg.exe'

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

" colorise
"let g:colorizer_startup = 1

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
autocmd BufEnter * CdCurrent

" 最後に編集した位置に移動する
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" シンタックスで補完する
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

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
function! UpdateTags(arg)
  let pwd  = expand('%:p:h')
  exe 'cd '.a:arg
  let ext = expand('%:p:e')
  if ext ==? 'php'
    silent exe ':!start /MIN ctags -ex -f %:p:h/tags --langmap="php:+.inc" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>' . a:arg
  elseif ext ==? 'as'
    silent exe ":!start /MIN ctags -R --languages=actionscript " . a:arg
  else
    silent exe ":!start /MIN ctags -R --cs-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q " . a:arg
  endif
  exe 'cd '.pwd
endfunction

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
"if has('syntax')
"  augroup InsertHook
"    autocmd! InsertHook
"    autocmd InsertEnter      * hi CursorLine guibg=NONE gui=NONE
"    autocmd InsertLeave      * hi CursorLine guibg=NONE gui=BOLD
"    autocmd InsertEnter      * hi CursorLineNr guifg=BLUE  guibg=WHITE gui=BOLD
"    autocmd InsertLeave      * hi CursorLineNr guifg=WHITE guibg=BLUE  gui=NONE
"    autocmd WinLeave         * set nocursorline
"    autocmd WinEnter,BufRead * set cursorline
"  augroup END
"endif

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
  let opt = '--exclude .g.i.cs$^|\.git$^|\.svn$^|.o$^|.obj$^|.exe$^|.pdb$^|.dll$^|.ncb$^|.exp$^|.lib$^|.bak$^|^Debug$^|^Release$'
  exe ':!start cmd /c "jvgrep ' . opt . ' ' . join(a:000, ' ') . '" | tee ' . expand('~') . '/.grep_list'
  "silent exe ':!start gvim -c "vimgrep ' . join(a:000, ' ') . '" -c cw -c "res 30" -c "set nowrap" -- ' . expand('%:p:h')
endfunction

"nnoremap <F3> :<c-u>exe 'cd ' . g:grep_base<RETURN>:<c-u>cfile ~/.grep_list \| cw<RETURN>:<c-u>exe 'LSearch ' . g:grep_str<RETURN>
nnoremap <F3> :GrepResult<RETURN>
command! -nargs=0 GrepResult :call GrepResult()
function! GrepResult()
  exe 'cd "' . g:grep_base . '"'
  cfile ~/.grep_list
  cw
  call Lsearch#Clear()
  call Lsearch#Search(g:grep_str)
endfunction

" QuickFixウィンドウだけのマップ
au BufRead,BufEnter * call MapForQuickFix()
function! MapForQuickFix()
  if &buftype=="quickfix"
    nnoremap <buffer> <s-j>  j<CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
    nnoremap <buffer> <s-k>  k<CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
    nnoremap <buffer> <s-CR> <CR>:<c-U>LflagClear<CR>:<c-U>Lflag<CR>:<c-u>wincmd p<CR>
  endif
endfunction

" 別ウィンドウで開く
command! -nargs=0 OpenNewWindow :silent !start gvim %

