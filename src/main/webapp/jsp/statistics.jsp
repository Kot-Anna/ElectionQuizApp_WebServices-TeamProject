<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Statistics</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<link rel="stylesheet" href="/jsp/style.css" />
</head>
<body>
	<%@ include file="/jsp/dynamic-nav.jsp"%>
	<div class="container">
		<div class="card statistics-card">
			<h1 class="title">Statistics of the questions</h1>
			<div class="underline"></div>

			<c:forEach var="s" items="${requestScope.questions}" varStatus="loop">

				<div class="question-card"
					data-val="${requestScope.statistics.get(loop.index)}">
					<div class="question-card-q">
						<h2 class="index">
							<a
								href="/respondents?index=${loop.index+1}?id=${requestScope.questions.get(loop.index).getId()}">Question
								${loop.index + 1}</a>
						</h2>
						<p class="question-text">${s.getText()}</p>
					</div>
					<div class="chart">
						<div class="chart-wrap">
							<div class="first-part">Strongly Disagree</div>
							<div class="progress">
								<div id="strongly-disagree" class="p-bar"></div>
							</div>
							<div class="last-part">
								<span class="num">23</span>
								<div class="cans">
								<c:forEach var="cann" items="${requestScope.cans.get(loop.index).get(0)}">
									<div class="can">
										<div class="img-wrap">
											<img alt="can" src="${cann.getProfile_pic()}">
										</div>
										<h3>${cann.getFname()} ${cann.getLname()}</h3>
									</div>
								</c:forEach>
								</div>

							</div>
						</div>
						<div class="chart-wrap">
							<div class="first-part">Disagree</div>
							<div class="progress">
								<div id="disagree" class="p-bar"></div>
							</div>
							<div class="last-part">
								<span class="num">23</span>
								<div class="cans">
									<c:forEach var="cann" items="${requestScope.cans.get(loop.index).get(1)}">
									<div class="can">
										<div class="img-wrap">
											<img alt="can" src="${cann.getProfile_pic()}">
										</div>
										<h3>${cann.getFname()} ${cann.getLname()}</h3>
									</div>
								</c:forEach>
								</div>

							</div>
						</div>
						<div class="chart-wrap">
							<div class="first-part">Neutral</div>
							<div class="progress">
								<div id="neutral" class="p-bar"></div>
							</div>
							<div class="last-part">
								<span class="num">23</span>
								<div class="cans">
									<c:forEach var="cann" items="${requestScope.cans.get(loop.index).get(2)}">
									<div class="can">
										<div class="img-wrap">
											<img alt="can" src="${cann.getProfile_pic()}">
										</div>
										<h3>${cann.getFname()} ${cann.getLname()}</h3>
									</div>
								</c:forEach>
								</div>

							</div>
						</div>
						<div class="chart-wrap">
							<div class="first-part">Agree</div>
							<div class="progress">
								<div id="agree" class="p-bar"></div>
							</div>
							<div class="last-part">
								<span class="num">23</span>
								<div class="cans">
									<c:forEach var="cann" items="${requestScope.cans.get(loop.index).get(3)}">
									<div class="can">
										<div class="img-wrap">
											<img alt="can" src="${cann.getProfile_pic()}">
										</div>
										<h3>${cann.getFname()} ${cann.getLname()}</h3>
									</div>
								</c:forEach>
								</div>

							</div>
						</div>
						<div class="chart-wrap">
							<div class="first-part">Strongly Agree</div>
							<div class="progress">
								<div id="strongly-agree" class="p-bar"></div>
							</div>
							<div class="last-part">
								<span class="num">23</span>
								<div class="cans">
									<c:forEach var="cann" items="${requestScope.cans.get(loop.index).get(4)}">
									<div class="can">
										<div class="img-wrap">
											<img alt="can" src="${cann.getProfile_pic()}">
										</div>
										<h3>${cann.getFname()} ${cann.getLname()}</h3>
									</div>
								</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="scroll">
		<i class="fas fa-arrow-up"></i>
	</div>
	<script src="/js/statistics.js"></script>
	<script src="/js/scrollUp.js"></script>
</body>
</html>
