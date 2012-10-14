:if search('<+CURSOR+>')
:  execute 'normal! "_da>'
:endif
:%s/<+file+>/\=expand('%:t:r')/geI
:%s/<+DATE+>/\=strftime('%Y-%m-%d')/ge
#include "<+file+>.h"

<+CURSOR+>
