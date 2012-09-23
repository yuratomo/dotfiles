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
"  http://www.daionet.gr.jp/~knok/software/misc/
"
" - diff
"  http://gnuwin32.sourceforge.net/packages/diffutils.htm
"
"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------
" cd ~/.vim
" git clone git://github.com/gmarik/vundle.git
" cd ~/.vim/bundle
" git clone git://github.com/yuratomo/dotfiles.git
"
" (win 7)
" mklink ~\_vimrc ~\.vim\bundle\dotfiles\_vimrc
" mklink ~\_gvimrc ~\.vim\bundle\dotfiles\_gvimrc
" mklink c:\vim\vimrc_local.vim .vim\bundle\dotfiles\vimrc_local.vim
" mklink c:\vim\gvimrc_local.vim .vim\bundle\dotfiles\gvimrc_local.vim
"
" (win xp)
" cd ~
" fsutil hardlink create _vimrc  .vim/bundle/dotfiles/_vimrc
" fsutil hardlink create _gvimrc .vim/bundle/dotfiles/_gvimrc
" fsutil hardlink create c:/vim/vimrc_local.vim .vim/bundle/dotfiles/vimrc_local.vim
" fsutil hardlink create c:/vim/gvimrc_local.vim .vim/bundle/dotfiles/gvimrc_local.vim
"

set nocompatible

try
  filetype off
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()

  Bundle 'git://github.com/majutsushi/tagbar.git'
  Bundle 'git://github.com/vim-scripts/OmniCppComplete.git'
  Bundle 'git://github.com/teramako/jscomplete-vim.git'
  Bundle 'git://github.com/shawncplus/phpcomplete.vim.git'
  Bundle 'git://github.com/mattn/calendar-vim.git'
  Bundle 'git://github.com/vim-scripts/vimwiki'
  Bundle 'git://github.com/Shougo/vimshell.git'
  Bundle 'git://github.com/Shougo/vimproc.git'
  Bundle 'git://github.com/Shougo/vinarise.git'
  Bundle 'git://github.com/yuratomo/dotfiles.git'
  Bundle 'git://github.com/yuratomo/w3m.vim.git'
  Bundle 'git://github.com/yuratomo/vs.vim.git'
  Bundle 'git://github.com/yuratomo/dbg.vim.git'
  Bundle 'git://github.com/yuratomo/bg.vim.git'
  Bundle 'git://github.com/yuratomo/neon.vim.git'
  Bundle 'git://github.com/yuratomo/gmail.vim.git'
  Bundle 'git://github.com:yuratomo/ltools.vim.git'
  Bundle 'git://github.com:yuratomo/ildasm.vim.git'
  Bundle 'git://github.com:yuratomo/dotnet-complete.git'
  Bundle 'git://github.com:yuratomo/cpp-api-complete.git'
  Bundle 'git://github.com:yuratomo/java-api-complete.git'

  "Bundle 'git://github.com/tpope/vim-fugitive.git'
  "Bundle 'git://github.com/msanders/snipmate.vim.git'
  "Bundle 'git://github.com/vim-scripts/colorsel.vim.git'
  "Bundle 'git://github.com/vim-scripts/phpcomplete.vim.git'
  "Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
  "Bundle 'git://github.com/basyura/TweetVim.git'
  "Bundle 'git://github.com/basyura/twibill.vim.git'
  "Bundle 'git://github.com/tyru/open-browser.vim.git'
  "Bundle 'git://github.com/vim-scripts/CmdlineCompl.vim.git'
  "Bundle 'git://github.com/mattn/gist-vim.git'
  "Bundle 'git://github.com/vim-scripts/vcscommand.vim.git'
  "Bundle 'git://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git'
  "Bundle 'git://github.com/mattn/webapi-vim'
  "Bundle 'git://github.com/garbas/vim-snipmate.git'
  "Bundle 'git://github.com/MarcWeber/vim-addon-mw-utils.git'
  "Bundle 'git://github.com/tomtom/tlib_vim.git'
  "Bundle 'git://github.com/honza/snipmate-snippets.git'
  "Bundle 'git://github.com:yuratomo/snipmate-win-snippets.git'
  "Bundle 'git://github.com/vim-scripts/MultipleSearch.git'
  "Bundle 'git://github.com/yuratomo/exdict.vim.git'

  filetype plugin indent on
catch /.*/
endtry

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
set tags+=../../tags,../tags,./tags;
set concealcursor=n
set completeopt=menuone
set helplang=ja,en
set shortmess& shortmess+=I
filetype indent plugin on

"---------------------------------------------------------------------------
" autocommand
"---------------------------------------------------------------------------
au FileType vim        set sw=2 ts=2 sts=2 et
au FileType c,cpp      set sw=4 ts=4 sts=4 noet
au FileType java       set sw=4 ts=4 sts=4 noet
au FileType cs         set sw=4 ts=4 sts=4 et
au FileType javascript set sw=2 ts=2 sts=2 et
au FileType html       set sw=2 ts=2 sts=2 et
au BufNewFile,BufRead *.build   setf ant
au BufNewFile,BufRead *.targets setf xml
au BufNewFile,BufRead *.config  setf xml
au BufNewFile,BufRead *.*proj   setf xml
au BufNewFile,BufRead *.xaml    setf xml
au BufNewFile,BufRead *.xaml    setl omnifunc=xaml#complete
au BufNewFile,BufRead *.cs      setl omnifunc=cs#complete
au BufNewFile,BufRead *.cs      setl bexpr=cs#baloon()
au BufNewFile,BufRead *.cs      setl ballooneval
au BufNewFile,BufRead *.java    setl omnifunc=javaapi#complete
au BufNewFile,BufRead *.java    setl bexpr=java#apiballoon()
au BufNewFile,BufRead *.java    setl ballooneval
au BufNewFile,BufRead *.cpp     setl omnifunc=cppapi#complete
au BufNewFile,BufRead *.cpp     setl bexpr=cppapi#balloon()
au BufNewFile,BufRead *.cpp     setl ballooneval
au BufNewFile,BufRead *.c       setl omnifunc=cppapi#complete
au BufNewFile,BufRead *.c       setl bexpr=cppapi#balloon()
au BufNewFile,BufRead *.c       setl ballooneval

"---------------------------------------------------------------------------
" keymap
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

" like a browser
nnoremap <space>   <C-D>M
nnoremap <s-space> <C-U>M

" like a visual studio
inoremap <expr> <c-y>   pumvisible()?"\<c-y>":"\<c-x>\<c-o>\<c-p>"
inoremap <expr> <CR>    pumvisible()?"\<c-y>":"\<c-g>u\<CR>"
inoremap <expr> <TAB>   pumvisible()?"\<c-n>":"\<TAB>"
inoremap <expr> <s-TAB> pumvisible()?"\<c-p>":"\<s-TAB>"
inoremap <c-space> <c-x><c-o><c-p>

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

"---------------------------------------------------------------------------
" Plugin settings
"---------------------------------------------------------------------------

" w3m
let g:w3m#homepage = 'http://www.google.co.jp/'

" vs.vim (WDK)
let g:vs_wdk_cond = 'chk'
let g:vs_wdk_cpu  = 'x86'
let g:vs_wdk_os   = 'WXP'

" ildasm
let g:ildasm_assemblies = [
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\mscorlib.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\WindowsBase.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\PresentationCore.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\PresentationFramework.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\System.Core.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\System.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\System.Drawing.dll',
  \ 'C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\Profile\Client\System.Net.dll',
  \ ]

" jscomplete-vim
autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']

" Laltfile
let g:Laltfile_mapping = []
call add(g:Laltfile_mapping, {'SL.xaml$'        : '.xaml.cs'  } )
call add(g:Laltfile_mapping, {'\.xaml.cs$'      : 'WPF.xaml'  } )
call add(g:Laltfile_mapping, {'WPF.xaml$'       : 'SL.xaml'   } )

" cppapi-complete
let g:cppapi_pre_omnifunc = 'omni#cpp#complete#Main'
let g:cppapi_ignore_files = [ 'mfc' ]

"---------------------------------------------------------------------------
" Convenient scripts
"---------------------------------------------------------------------------

" バッファ変更時にカレントディレクトリに移動する
command! -nargs=0 CdCurrent cd %:p:h
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
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis |
wincmd p | diffthis

" タグファイル更新
command! -nargs=* -complete=dir UpdateTags  :call UpdateTags(<f-args>)

function! UpdateTags(arg)
  let pwd  = expand('%:p:h')
  exe 'cd '.a:arg
  silent exe ":!start /MIN ctags -R --c++-kinds=+p --fields=+iaS --extra=+q " . a:arg
  exe 'cd '.pwd
endfunction

command! -nargs=* -complete=dir PhpTags     :call PhpTags(<f-args>)
function! PhpTags(arg)
  let pwd  = expand('%:p:h')
  exe 'cd '.a:arg
  silent exe ":!start /MIN ctags -ex -f %:p:h/tags --langmap="php:+.inc" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>' . a:arg
  exe 'cd '.pwd
endfunction

command! -nargs=* -complete=dir FlexTags    :call FlexTags(<f-args>)
function! FlexTags(arg)
  let pwd  = expand('%:p:h')
  exe 'cd '.a:arg
  silent exe ":!start /MIN ctags -R --options=" . $vim . "\\vimfiles\astags "  . a:arg
  exe 'cd '.pwd
endfunction

" コマンドモードで現在バッファファイル名を補完
cnoremap <C-X> <C-R>=<SID>GetBufferFileName()<CR>
function! s:GetBufferFileName()
  let path = expand('%:p')
  return path
endfunction

" ステータス拡張
set statusline=%<%f\%{FileTime()}%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P%=%{CurTime()} 
fu! FileTime() 
  let ext=tolower(expand("%:e")) 
  let fname=tolower(expand('%<')) 
  let filename=fname . '.' . ext 
  let msg="" 
  let msg=msg." ".strftime("[Modified %Y/%b/%d %H:%M:%S]",getftime(filename)) 
  return msg 
endf 
fu! CurTime() 
  let ftime="" 
  let ftime=ftime." ".strftime("[%y/%b/%d %H:%M:%S]") 
  return ftime 
endf 

" ビジュアルモード選択した部分を*で検索
vnoremap * "zy:let @/ = @z<CR>n

