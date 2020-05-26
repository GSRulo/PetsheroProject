package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FilterController implements Filter {
	private HttpServletRequest httpRequest;
	private static final String[] DoPaths = {
            "/auth", "/cadastrar", "/enviarContato"
    };
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain ) throws IOException, ServletException {
		httpRequest = (HttpServletRequest) request;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		if( 	session.getAttribute("usuario") != null
				|| doPermissions()
				|| req.getRequestURI().endsWith("login.jsp")
				|| req.getRequestURI().endsWith("contato.jsp")
				|| req.getRequestURI().endsWith("sobre.jsp")
				|| req.getRequestURI().endsWith("cadastrar.jsp")
				|| req.getRequestURI().endsWith("sobreFora.jsp")
				|| req.getServletPath().startsWith("/assets/")
				) {
			chain.doFilter(request, response);
		}else {
			res.sendRedirect("login.jsp");
		}
	}
	
	private boolean doPermissions() {
        String requestURL = httpRequest.getRequestURL().toString();
 
        for (String loginRequiredURL : DoPaths) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }
 
        return false;
    }
	
	public void destroy() {
    }
 
    public void init(FilterConfig fConfig) throws ServletException {
    }
	
}
