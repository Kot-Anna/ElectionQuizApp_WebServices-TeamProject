package filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class ClientFilter
 */

@WebFilter(dispatcherTypes = {
		DispatcherType.REQUEST, 
		DispatcherType.FORWARD, 
		DispatcherType.INCLUDE, 
		DispatcherType.ERROR
}
, urlPatterns = {
		"/jsp/addCan",
		"/jsp/candidate-question",
		"/deleteCan",
		"/DeleteQue",
		"/randomAnswers",
		"/readallcandidatesadmin",
		"/jsp/ReadToUpdateAnswer",
		"/readToUpdateCan",
		"/jsp/ReadToUpdateQue",
		"/jsp/admin-questions",
		"/jsp/UpdateAnswer",
		"/updateCan",
		"/jsp/updateque",
		"/jsp/admin-dashboard.jsp",
		"/jsp/add-candidate.jsp",
		"/jsp/add-question.jsp",
		"/jsp/admin-candidate.jsp",
		"/jsp/admin-questions.jsp",
		"/jsp/askToCandidates.jsp",
		"/jsp/candidate-question.jsp",
		"/jsp/change-answer.jsp",
		"/jsp/update-candidate.jsp"
		})

public class ClientFilter implements Filter {
	
	/**
     * Default constructor. 
     */
    public ClientFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session=((HttpServletRequest)request).getSession(false);
		Boolean isLoggedIn=false;
		
		try {
			isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
		} catch (Exception e) {
		}
		
		if (!isLoggedIn) {
			((HttpServletResponse) response).sendRedirect("/index.jsp");
			return;
		} else {
			long maxAge = 45*60; //45 minutes
			setSessionMaxAge(session, maxAge);
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	/**
	 * Define the session max age here in seconds. This will trigger session.invalidate() when the defined age reached.
	 * @param session pass the session object here
	 * @param maxAge pass the max age in seconds. Ex: 45 (it means the session will last for 45 seconds)
	 */
	private static void setSessionMaxAge(HttpSession session, Long maxAge) {
		long creationTime = Long.parseLong((String)session.getAttribute("creationTime"));
		long lastTime = session.getLastAccessedTime();
		long age = lastTime - creationTime;
//			System.out.println("Age : " + age); 
		age = age/1000;
		
		if(age >= maxAge) {
			session.invalidate();
		}
		
//		System.out.println("lasttime : " + new Date(creationTime));
//		System.out.println("creationtime : " + new Date(lastTime));
//		System.out.println("Age : " + age);
//		System.out.println("maxAge : " + maxAge);
	}
	
}