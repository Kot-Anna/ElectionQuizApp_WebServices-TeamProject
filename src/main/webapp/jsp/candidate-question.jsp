<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>   
<%@ page import="model.Question" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<title>Add Question</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<%@ include file="/jsp/dynamic-nav.jsp"%>
	<div class="can-question container flex-container">
		<div class="card">
			<a href="add-candidate.jsp" class="btn btn-back"> <i
				class="fas fa-chevron-left"></i> Back
			</a>
			<h1 class="title">Candidate's answers</h1>
			<div class="underline"></div>
			<form method="post" action="UpdateAnswer" class="question-form">
			<input type="hidden" name="ref" value="${requestScope.ref}" />
			<input type="hidden" name="size" value="${requestScope.questions.size()}" />
			
			<c:forEach var="que" items="${requestScope.questions}" varStatus="counter">
				<section>
					<div class="question">
						<input type="hidden" name="questionID${counter.index}" value="${que.id}" />
						<h2 class="index">${counter.index+1}</h2>
						<p class="question-text">${que.question}</p>
					</div>
					<div class="answer">
						<ul> 
							<li><input type="radio" name="${counter.index}" id="strongly-disagree"
								value="1" /> <label for="strongly-disagree">Strongly Disagree</label></li>
							<li><input type="radio" name="${counter.index}" id="disagree" value="2" />
								<label for="disagree">Disagree</label></li>
							<li><input type="radio" name="${counter.index}" id="neutral" value="3"
								checked /> <label for="neutral">Neutral</label></li>
							<li><input type="radio" name="${counter.index}" id="agree" value="4" />
								<label for="agree">Agree</label></li>
							<li><input type="radio" name="${counter.index}" id="strongly-agree"
								value="5" /> <label for="strongly-agree">Strongly Agree</label></li>
						</ul>
					</div>
				</section>
			</c:forEach>
			<div class="canque-btnwrap">
				<button name="submit-can-question" type="submit"
					class="btn btn-thin">Submit</button>
			</div>

			</form>

			


		</div>
	</div>
</body>
</html>
