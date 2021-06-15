<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Vaalikone</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<link rel="stylesheet" href="jsp/style.css" />
</head>
<body>
	<header id="main-header">
		<%@ include file="/jsp/home-nav.jsp" %>
		
		<div class="container flex-container flex-container-y">
			<div class="header-content">
				<h1>Find Your Candidate</h1>
				<h3>For the upcoming election</h3>
				<div class="btn-wrapper">
					<a href="/readallcandidates" class="btn">See Candidates</a> <a
						href="/voterQuestions" class="btn">Take Test</a>
				</div>
			</div>
		</div>
	</header>
	
	<script type="text/javascript">
		sessionStorage.clear();
	</script>
</body>
</html>
