:if search('<+CURSOR+>')
:  execute 'normal! "_da>'
:endif
:echo '1: skelton'
:echo '2: class'
:let no = input("select number:")
:if no == "2"
:  call append(line('.')-1, 'class <+file+>')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '	public <+file+>()')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '}')
:endif
:%s/<+FILE+>/\=toupper(expand('%:t:r'))/geI
:%s/<+file+>/\=expand('%:t:r')/geI
:%s/<+DATE+>/\=strftime('%Y-%m-%d')/ge
#ifndef __<+FILE+>__
#define __<+FILE+>__

<+CURSOR+>
#endif // __<+FILE+>__
