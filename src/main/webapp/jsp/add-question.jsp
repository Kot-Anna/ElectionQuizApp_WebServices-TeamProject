<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Question"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>Edit/Add Question</title>

<link rel="stylesheet" href="style.css" />
<script defer src="/js/add-question.js"></script>
</head>
<body>
	<%@ include file="/jsp/dynamic-nav.jsp"%>
	<div class="add-question container flex-container">
		<div class="card">
			<a href="#" class="btn btn-back go-back"> <i
				class="fas fa-chevron-left"></i> Back
			</a>
			<c:if test="${requestScope.addNew == '1'}">
				<h1 class="title">Add Question</h1>
			</c:if>
			<c:if test="${requestScope.addNew == null}">
				<h1 class="title">Edit Question</h1>
			</c:if>
			<div class="underline"></div>

			<c:if test="${requestScope.addNew == '1'}">
				<form method="post" action="updateque" class="question-form">
					<input type="hidden" name="addNew" value="1" /> <input
						id="question-input" type="text" name="question" value="" />
					<button name="submit" type="submit" class="btn btn-thin">
						Submit</button>
				</form>
			</c:if>
			<c:if test="${requestScope.addNew == null}">
				<form method="post" action="updateque" class="question-form">
					<input type="hidden" name="id"
						value="<c:out value='${question.id}' />" /> <input
						id="question-input" type="text" name="question"
						value="<c:out value='${question.question}' />" />
					<button name="submit" type="submit" class="btn btn-thin">
						Submit</button>
				</form>
			</c:if>

		</div>
	</div>
	<!--  <div id="warning" class="danger fadein">
    Herkese selamler
    </div> -->


	<script src="/js/goBack.js"></script>
</body>
</html>
