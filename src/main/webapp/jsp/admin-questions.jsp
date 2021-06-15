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
    <link rel="stylesheet" href="style.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <title>Admin Questions</title>
  </head>
  <body>
    <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="admin-pages container flex-container">
      <div class="card">
        <div class="admin-header">
          <h1 class="title">Questions</h1>
          <div class="underline"></div>
          <div class="admin btn-wrapper">
            <a href="admin-dashboard.jsp" class="btn btn-thin">Back</a>
            <a href="/jsp/ReadToUpdateQue?addNew=1" class="btn btn-thin">Add Question</a>
          </div>
        </div>
        <div class="admin-content">
        <c:forEach var="question" items="${requestScope.listQuestion}" varStatus="counter">
          <div class="question question-ad">
            <h2 class="index">${counter.index+1}</h2> 
            <p class="question-text">
              ${question.getQuestion()}
            </p>
            <div class="edit-buttons">
              <a href="/jsp/ReadToUpdateQue?id=${question.getId()}" class="edit-btn question-btn">
                <i class="fas fa-pen"></i>
              </a>
              <a href="/DeleteQue?id=<c:out value='${question.getId()}' />" class="delete-btn question-btn">
                <i class="fas fa-trash-alt"></i>
              </a>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </body>
</html>
