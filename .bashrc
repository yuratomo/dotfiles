alias ls='ls -FCa --color'
alias ll='ls -FCa --color -l'
alias vim='vim.exe -cur_console:h0'
alias gitdiff='git difftool --tool=vimdiff --no-prompt'
alias bashrc='vim ~/.bashrc'

# jvgrep and tee
function gre()
{
	tmp=${PWD/\//}
	echo ${tmp/\//:\/} > ~/.grep_base
	jvgrep $* | tee ~/.grep_list
}

# カレントディレクトリをクリップボードに
function gd()
{
	tmp=${PWD/\//}
	echo ${tmp/\//:\/} | clip.exe
}

# クリップボードをカレントディレクトリに
function sd()
{
	tmp=`cat /dev/clipboard`
	cd $tmp
}

# ぎゃる＆ぎゃー
#  gal 左窓のパスに移動
#  gar 右窓のパスに移動
#  gap カレント窓パスに移動
#  gao 他窓パスに移動
alias gal='cd "`afxams Extract \\$L`"'
alias gar='cd "`afxams Extract \\$R`"'
alias gap='cd "`afxams Extract \\$P`"'
alias gao='cd "`afxams Extract \\$O`"'

# さる＆さー
#  sal 左窓のパスをカレントパスに
#  sar 右窓のパスをカレントパスに
#  sap カレント窓パスをカレントパスに
#  sao 他窓パスをカレントパスに
alias sal='afxams Exec \&EXCD -L"$PWD/"'
alias sar='afxams Exec \&EXCD -R"$PWD/"'
alias sap='afxams Exec \&EXCD -P"$PWD/"'
alias sao='afxams Exec \&EXCD -O"$PWD/"'

# あふwで選択中のファイルを環境変数にいれる
alias gas='set GAS=`afxams Extract \\$MF`'

