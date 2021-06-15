
<%
	boolean isLoggedInNav = false;
	if (session.getAttribute("isLoggedIn") != null) {
		isLoggedInNav = (boolean) session.getAttribute("isLoggedIn");
	}
	
	if (isLoggedInNav) {
	%>
	<%@ include file="../html/admin-nav.html"%>
	<%
		} else {
	%>
	<%@ include file="../html/navbar.html"%>
	<%
		}
%>

