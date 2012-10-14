:if search('<+CURSOR+>')
:  execute 'normal! "_da>'
:endif
:echo '1: Normal Class'
:echo '2: Servlet'
:echo '3: Filter'
:let no = input("select number:")
:if no == "1"
:  call append(line('.')-1, 'package xxx;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '/**')
:  call append(line('.')-1, ' * <+CURSOR+>')
:  call append(line('.')-1, ' * @date <+DATE+>')
:  call append(line('.')-1, ' */')
:  call append(line('.')-1, 'public class <+file+>')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * コンストラクタ')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	public <+file+>()')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '}')
:elseif no == "2"
:  call append(line('.')-1, 'package xxx;')
:  call append(line('.')-1, 'import java.io.*;')
:  call append(line('.')-1, 'import java.net.*;')
:  call append(line('.')-1, 'import javax.servlet.*;')
:  call append(line('.')-1, 'import javax.servlet.http.*;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'public class <+file+> extends HttpServlet')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Initializes the servlet.')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	public void init(ServletConfig config) throws ServletException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '		super.init(config);')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Destroys the servlet.')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	public void destroy() {')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Processes requests for both HTTP <code>GET</code> and')
:  call append(line('.')-1, '	 * <code>POST</code> methods.')
:  call append(line('.')-1, '	 * @param request servlet request')
:  call append(line('.')-1, '	 * @param response servlet response')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	protected void processRequest(HttpServletRequest request, HttpServletResponse response)')
:  call append(line('.')-1, '		throws ServletException, java.io.IOException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '		response.setContentType("text/html;charset=UTF-8");')
:  call append(line('.')-1, '		java.io.PrintWriter out = response.getWriter();')
:  call append(line('.')-1, '		out.println("");')
:  call append(line('.')-1, '		out.close();')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Handles the HTTP <code>GET</code> method.')
:  call append(line('.')-1, '	 * @param request servlet request')
:  call append(line('.')-1, '	 * @param response servlet response')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	protected void doGet(HttpServletRequest request, HttpServletResponse response)')
:  call append(line('.')-1, '		throws ServletException, java.io.IOException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '		processRequest(request, response);')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Handles the HTTP <code>POST</code> method.')
:  call append(line('.')-1, '	 * @param request servlet request')
:  call append(line('.')-1, '	 * @param response servlet response')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	protected void doPost(HttpServletRequest request, HttpServletResponse response)')
:  call append(line('.')-1, '		throws ServletException, java.io.IOException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '		processRequest(request, response);')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	/**')
:  call append(line('.')-1, '	 * Returns a short description of the servlet.')
:  call append(line('.')-1, '	 */')
:  call append(line('.')-1, '	public String getServletInfo()')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '		return "Short description";')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '}')
:elseif no == "3"
:  call append(line('.')-1, 'package xxx;')
:  call append(line('.')-1, 'import java.io.*;')
:  call append(line('.')-1, 'import javax.servlet.*;')
:  call append(line('.')-1, 'import javax.servlet.http.*;')
:  call append(line('.')-1, '')
:  call append(line('.')-1, 'public class ExFilterServlet implements Filter')
:  call append(line('.')-1, '{')
:  call append(line('.')-1, '	public void init(FilterConfig conf) throws ServletException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	public void destroy()')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '	public void doFilter(ServletRequest req,')
:  call append(line('.')-1, '			ServletResponse res, FilterChain chain)')
:  call append(line('.')-1, '		throws ServletException, IOException')
:  call append(line('.')-1, '	{')
:  call append(line('.')-1, '')
:  call append(line('.')-1, '		chain.doFilter(req, res);')
:  call append(line('.')-1, '	}')
:  call append(line('.')-1, '}')
:endif
:%s/<+file+>/\=expand('%:t:r')/geI
:%s/<+DATE+>/\=strftime('%Y-%m-%d')/ge
























