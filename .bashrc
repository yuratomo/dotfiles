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

# �J�����g�f�B���N�g�����N���b�v�{�[�h��
function gd()
{
	tmp=${PWD/\//}
	echo ${tmp/\//:\/} | clip.exe
}

# �N���b�v�{�[�h���J�����g�f�B���N�g����
function sd()
{
	tmp=`cat /dev/clipboard`
	cd $tmp
}

# ����違����[
#  gal �����̃p�X�Ɉړ�
#  gar �E���̃p�X�Ɉړ�
#  gap �J�����g���p�X�Ɉړ�
#  gao �����p�X�Ɉړ�
alias gal='cd "`afxams Extract \\$L`"'
alias gar='cd "`afxams Extract \\$R`"'
alias gap='cd "`afxams Extract \\$P`"'
alias gao='cd "`afxams Extract \\$O`"'

# ���違���[
#  sal �����̃p�X���J�����g�p�X��
#  sar �E���̃p�X���J�����g�p�X��
#  sap �J�����g���p�X���J�����g�p�X��
#  sao �����p�X���J�����g�p�X��
alias sal='afxams Exec \&EXCD -L"$PWD/"'
alias sar='afxams Exec \&EXCD -R"$PWD/"'
alias sap='afxams Exec \&EXCD -P"$PWD/"'
alias sao='afxams Exec \&EXCD -O"$PWD/"'

# ����w�őI�𒆂̃t�@�C�������ϐ��ɂ����
alias gas='set GAS=`afxams Extract \\$MF`'
