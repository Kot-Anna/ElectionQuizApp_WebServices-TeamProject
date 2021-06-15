<%
			boolean isLoggedIn = false;
		if (session.getAttribute("isLoggedIn") != null) {
			isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
		}

		if (isLoggedIn) {
		%>
		<nav class="main-nav">
			<a href="/index.jsp"><i class="fas fa-home"></i>Home</a>
			<a href="/jsp/admin-dashboard.jsp"><i class="fas fa-clipboard-check"></i>Dashboard</a>
<!-- 			<a href="/Statistics"><i class="fas fa-chart-line"></i>Statistics</a> -->
			<a href="/logout"><i class="fas fa-sign-in-alt"></i>Log Out</a>
		</nav>
		<%
			} else {
		%>
		<nav class="main-nav">
			<a href="/index.jsp"><i class="fas fa-home"></i>Home</a>
<!-- 			<a href="/Statistics"><i class="fas fa-chart-line"></i>Statistics</a> -->
			<a href="/login"><i class="fas fa-sign-in-alt"></i>Admin Login</a>
		</nav>
		<%
			}
%>