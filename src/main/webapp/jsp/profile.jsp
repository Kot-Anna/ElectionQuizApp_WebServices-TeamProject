<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.DaoC"%>
<%@ page import="model.Candidate" %> 
<%@ page import="model.Answer" %>
<%@ page import="model.Question" %>
     
<%@ page import="java.util.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <title>Profile</title>
    <link rel="stylesheet" href="/jsp/style.css" />
  </head>
  <body>
    <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="container flex-container">
      <div class="card profile p-x-11">

       <a href="#" class="btn btn-back go-back">

          <i class="fas fa-chevron-left"></i>
          Back</a
        >
        <div class="profile-info">
          <div class="profile-img-wrapper">
            <img src="/img/${requestScope.profile.profilePic}" alt="prfile-img" />
          </div>
          <div class="profile-name-info">
            <div class="first-line">
              <h2>${requestScope.profile.fname} ${requestScope.profile.lname}</h2>
              <div class="firs-line-2">
              <h4><span class="age">Age :</span> ${requestScope.profile.age}</h4>         
              <h4>${requestScope.profile.profession}</h4>
              </div>
            </div>
            <div class="second-line">
              <h4>
                <i class="fas fa-map-marker"></i>
                ${requestScope.profile.city}
              </h4>
              <div class="party">${requestScope.profile.politicalParty}</div>
            </div>
          </div>
        </div>

        <div class="about-text-sec">
          <div class="about-text">
            <h2>About</h2>
            <p>
             ${requestScope.profile.about}
            </p>
          </div>
          <div class="why-text">
            <h2>Why did you became a candidate?</h2>
            <p>
              ${requestScope.profile.whyCandidate}
            </p>
          </div>
        </div>

        <h1 class="title">Questionnaire Answers</h1>
        <div class="underline"></div>

		<div class="questions">
		<%
		Candidate person = (Candidate)request.getAttribute("profile");
		List<Answer> list= person.getAnswers();
		
		for (int i = 0; list != null && i < list.size(); i++){
			int number = i+1;  
			Answer a = list.get(i);
			out.println("<div class='question'> <h2 class='index'>"+ number + "</h2> <p class = 'question-text' >" + a.getQuestion().getQuestion() +"</p> <div class='question-answer'>" + a.getAnswer_value(a.getAnswer()) +"</div> </div>");
		}
		%>
 		</div>
      </div>
    </div>

    <script src="/js/goBack.js"></script>

  </body>
</html>
