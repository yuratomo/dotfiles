:if search('<+CURSOR+>')
:  execute 'normal! "_da>'
:endif
:echo '1: skelton'
:echo '2: class'
:echo '3: main'
:let no = input("select number:")
:if no == "2"
:  call append(line('.')-1, '<+file+>::<+file+>')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '}')
:  call append(line('.')-1, ' ')
:  call append(line('.')-1, '<+file+>::~<+file+>')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '}')
:elseif no == "3"
:  call append(line('.')-1, 'int main(int argc, char* argv[])')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '	int ret = 0;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	return ret;')
:  call append(line('.')-1, '}')
:endif
:%s/<+file+>/\=expand('%:t:r')/geI
:%s/<+DATE+>/\=strftime('%Y-%m-%d')/ge
#include "<+file+>.h"

<+CURSOR+>
