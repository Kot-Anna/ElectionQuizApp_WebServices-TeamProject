<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="/jsp/style.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <title>Document</title>
  </head>
  <body>
  <%@ include file="/jsp/dynamic-nav.jsp" %>

    <section class="container">
      <div class="card ask-to-candidate">
        <h1 class="title">Ask the Candidates</h1>
        <div class="underline"></div>
        <div class="ask-question">
          <h2 class="question-title">Question:</h2>
          <p class="ask-question-text">
            ${requestScope.question.getQuestion()}
          </p>
          <form action="/jsp/admin-questions" class="ask-candidate-form">
          <button type="submit" class="btn btn-blue btn-thin ask-candidate-btn btn-disabled" disabled>
            Submit Answers
          </button>
        </form>
        </div>
        <section class="ask-answers">
        
        <c:forEach var="can" items="${requestScope.cans}">
        	<div class="ask-answer" data-answer="${can.answer}">
            <div class="ask-answer-img-wrap">
              <img src="/img/${can.pic}" alt="candidate" />
            </div>
            <div class="thinking-part">
              <div>
                <span class="thinking-text">Thinking</span>
              <div class="thinking-dots">
                <div class="dot dot-1"></div>
                <div class="dot dot-2"></div>
                <div class="dot dot-3"></div>
              </div>
              <i class="fas fa-check"></i>
              <div class="question-answer">Disagree</div>
              </div>
            </div>
          </div>
        </c:forEach>
          </div>
        </section>
      </div>
    </section>

    <script src="/js/thinking.js"></script>
  </body>
</html>
