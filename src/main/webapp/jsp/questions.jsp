<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="model.Question"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/jsp/style.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<title>Questions</title>
</head>
<body>
	<%@ include file="/jsp/dynamic-nav.jsp"%>
	<div class="question-page container flex-container full-container">
		<div class="card progress-card">
			<div class="progress-bar">
				<div class="bar"></div>
			</div>
			<div class="wrapper-content"
				data-questions="<%String qtext = "";
ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");

for (int i = 0; i < questions.size(); i++) {
	if (i == questions.size() - 1) {
		qtext += questions.get(i).getQuestion();
	} else {
		qtext += questions.get(i).getQuestion() + "%";
	}
}

out.println(qtext);%>">
				<div class="title">
					<h1>
						Question <span class="question-index">1</span>/<span
							class="total-num">20</span>
					</h1>

				</div>
				<div class="wrapper-question">
					<!-- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit
            amet egestas leo, et condimentum tortor? -->
				</div>
				<form action="/calculate" method="post" id="qustions-form" name="quesiton-form">
					<input class="answersArr" type="hidden" name="answersArr">
					<div class="wrapper-answer">
						<div class="answer">
							<ul>
								<li><input type="radio" name="score" id="strongly-disagree"
									value="1" /> <label for="strongly-disagree">Strongly
										Disagree</label></li>
								<li><input type="radio" name="score" id="disagree"
									value="2" /> <label for="disagree">Disagree</label></li>
								<li><input type="radio" name="score" id="neutral" value="3"
									checked /> <label for="neutral">Neutral</label></li>
								<li><input type="radio" name="score" id="agree" value="4" />
									<label for="agree">Agree</label></li>
								<li><input type="radio" name="score" id="strongly-agree"
									value="5" /> <label for="strongly-agree">Strongly
										Agree</label></li>
							</ul>
						</div>
					</div>
					<div class="wrapper-btn">
						<a href="javascript:void(0)" id="prev"
							class="btn btn-thin btn-blue">Prev</a> 
							<a
							href="javascript:void(0)" id="next" class="btn btn-thin btn-blue">Next</a>
						<input id="submitBtn" type="submit" value="Submit"
							class="btn btn-thin btn-blue" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="small-q-container">
	<h4>Question Navigation</h4>
		<div class="small-q-wrap">
		<!-- <div class="small-q" data-small="">1</div> -->
		</div>
		<button class="small-submit">Submit Answers</button>
	</div>

	<script src="../js/quesitons.js"></script>
</body>
</html>
