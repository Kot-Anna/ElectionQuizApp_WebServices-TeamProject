<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <title>Compare</title>
    <link rel="stylesheet" href="/jsp/style.css" />
  </head>
  <body>
  <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="container">
      <div class="card statistics-card">
        <h1 class="title">Comapare Answers</h1>
        <div class="underline"></div>

       	<div class="question-list">
       	
       	 <div class="question-card">
          <div class="question-card-q compare-text">
            <h2 class="index">Question 1</h2>
            <p class="question-text compare-text">
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta
              aliquam recusandae ab, earum cum similique?
            </p>
          </div>
          <div class="compare-container">
            <div class="compare-inner">
              <h3 class="compare-candidate ">Your Answer</h3>
              <div class="compare-answer your-answer">Agree</div>
            </div>
            <div class="compare-inner compare-candidate-answer">
              <h3 class="compare-candidate">Bruce Wayne's Answer</h3>
              <div class="compare-answer can-answer">Agree</div>
            </div>
          </div>
        </div>
       	</div>
        
      </div>
    </div>
    <div class="compare-sidebar">
      <h3>Candidates</h3>
      <div class="compare-btn-container">
        <div class="compare-btn-wrap">
          <p>1</p>
          <button class="compare-btn compare-btn-active">Bruce Wayne</button>
        </div>
        <div class="compare-btn-wrap">
          <p>2</p>
          <button class="compare-btn">Superman</button>
        </div>
        <div class="compare-btn-wrap">
          <p>3</p>
          <button class="compare-btn">God Usopp</button>
        </div>
      </div>
    </div>
    <script src="/js/compare.js"></script>
  </body>
</html>
