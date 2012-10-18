:if search('<+CURSOR+>')
:  execute 'normal! "_da>'
:endif
:echo '1: Class Library'
:echo '2: Window'
:echo '3: UserControl'
:echo '4: Application'
:echo '5: Program'
:let no = input("select number:")
:if no == "1"
:  call append(line('.')-1, 'using System;')
:  call append(line('.')-1, 'using System.Collections.Generic;')
:  call append(line('.')-1, 'using System.Linq;')
:  call append(line('.')-1, 'using System.Text;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'namespace xxx')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '    public class <+file+>')
:  call append(line('.')-1, '    {')
:  call append(line('.')-1, '    }')
:  call append(line('.')-1, '}')
:elseif no == "2"
:  call append(line('.')-1, 'using System;')
:  call append(line('.')-1, 'using System.Collections.Generic;')
:  call append(line('.')-1, 'using System.Linq;')
:  call append(line('.')-1, 'using System.Text;')
:  call append(line('.')-1, 'using System.Windows;')
:  call append(line('.')-1, 'using System.Windows.Controls;')
:  call append(line('.')-1, 'using System.Windows.Data;')
:  call append(line('.')-1, 'using System.Windows.Documents;')
:  call append(line('.')-1, 'using System.Windows.Input;')
:  call append(line('.')-1, 'using System.Windows.Media;')
:  call append(line('.')-1, 'using System.Windows.Media.Imaging;')
:  call append(line('.')-1, 'using System.Windows.Navigation;')
:  call append(line('.')-1, 'using System.Windows.Shapes;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'namespace xxx')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '    /// <summary>')
:  call append(line('.')-1, '    /// <+file+>.xaml �̑��ݍ�p���W�b�N')
:  call append(line('.')-1, '    /// </summary>')
:  call append(line('.')-1, '    public partial class <+file+> : Window')
:  call append(line('.')-1, '    {')
:  call append(line('.')-1, '        public <+file+>()')
:  call append(line('.')-1, '        {')
:  call append(line('.')-1, '            InitializeComponent();')
:  call append(line('.')-1, '        }')
:  call append(line('.')-1, '    }')
:  call append(line('.')-1, '}')
:elseif no == "3"
:  call append(line('.')-1, 'using System;')
:  call append(line('.')-1, 'using System.Collections.Generic;')
:  call append(line('.')-1, 'using System.Linq;')
:  call append(line('.')-1, 'using System.Text;')
:  call append(line('.')-1, 'using System.Windows;')
:  call append(line('.')-1, 'using System.Windows.Controls;')
:  call append(line('.')-1, 'using System.Windows.Data;')
:  call append(line('.')-1, 'using System.Windows.Documents;')
:  call append(line('.')-1, 'using System.Windows.Input;')
:  call append(line('.')-1, 'using System.Windows.Media;')
:  call append(line('.')-1, 'using System.Windows.Media.Imaging;')
:  call append(line('.')-1, 'using System.Windows.Navigation;')
:  call append(line('.')-1, 'using System.Windows.Shapes;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'namespace xxx')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '    /// <summary>')
:  call append(line('.')-1, '    /// <+file+>.xaml �̑��ݍ�p���W�b�N')
:  call append(line('.')-1, '    /// </summary>')
:  call append(line('.')-1, '    public partial class <+file+> : UserControl')
:  call append(line('.')-1, '    {')
:  call append(line('.')-1, '        public <+file+>()')
:  call append(line('.')-1, '        {')
:  call append(line('.')-1, '            InitializeComponent();')
:  call append(line('.')-1, '        }')
:  call append(line('.')-1, '    }')
:  call append(line('.')-1, '}')
:elseif no == "4"
:  call append(line('.')-1, 'using System;')
:  call append(line('.')-1, 'using System.Collections.Generic;')
:  call append(line('.')-1, 'using System.Configuration;')
:  call append(line('.')-1, 'using System.Data;')
:  call append(line('.')-1, 'using System.Linq;')
:  call append(line('.')-1, 'using System.Windows;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'namespace xxx')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '    /// <summary>')
:  call append(line('.')-1, '    /// <+file+>.xaml �̑��ݍ�p���W�b�N')
:  call append(line('.')-1, '    /// </summary>')
:  call append(line('.')-1, '    public partial class <+file+> : Application')
:  call append(line('.')-1, '    {')
:  call append(line('.')-1, '    }')
:  call append(line('.')-1, '}')
:elseif no == "5"
:  call append(line('.')-1, 'using System;')
:  call append(line('.')-1, 'using System.Collections.Generic;')
:  call append(line('.')-1, 'using System.Linq;')
:  call append(line('.')-1, 'using System.Windows.Forms;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'namespace xxx')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '    static class <+file+>')
:  call append(line('.')-1, '    {')
:  call append(line('.')-1, '        /// <summary>')
:  call append(line('.')-1, '        /// �A�v���P�[�V�����̃��C�� �G���g�� �|�C���g�ł��B')
:  call append(line('.')-1, '        /// </summary>')
:  call append(line('.')-1, '        [STAThread]')
:  call append(line('.')-1, '        static void Main()')
:  call append(line('.')-1, '        {')
:  call append(line('.')-1, '            Application.EnableVisualStyles();')
:  call append(line('.')-1, '            Application.SetCompatibleTextRenderingDefault(false);')
:  call append(line('.')-1, '            Application.Run(new Form1());')
:  call append(line('.')-1, '        }')
:  call append(line('.')-1, '    }')
:  call append(line('.')-1, '}')
:endif
:%s/<+file+>/\=expand('%:t:r')/geI
:%s/<+DATE+>/\=strftime('%Y-%m-%d')/ge
