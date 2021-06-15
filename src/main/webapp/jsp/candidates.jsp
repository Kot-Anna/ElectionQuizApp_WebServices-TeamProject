<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="model.Candidate" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
    
    <title>Candidates</title>
    <link rel="stylesheet" href="/jsp/style.css" />
  </head>
	<body>
	
	    <%@ include file="/jsp/dynamic-nav.jsp" %>
	     <div class="candidates container">
	      	<div class="card">
	      <h1 class="title">Candidates</h1>
	      <div class="underline"></div>
			  <c:forEach var="candidate" items="${requestScope.candidateList}" >
			      <div class="candidates-wrapper">
				   <a href="/ShowProfile?id=${candidate.getId()}">
				          <div class="can-card">
				            <div class="img-wrap">
				              <img src="/img/${candidate.getProfilePic()}" alt="candidate" />
				            </div>
				            
				            <div class="can-content">
				              <div class="can-name-info">
				                <h3>${candidate.getFname()} ${candidate.getLname()}</h3>
				                <h4><span class="age">Age :</span> ${candidate.getAge()}</h4>
				                <h4>
				                  <i class="fas fa-map-marker"></i>
				                  ${candidate.getCity()}
				                </h4>
				              </div>
				              <div class="party admin-can-party">${candidate.getPoliticalParty()}</div>
				              <div class="short-about">
				              <c:set var = "string2" value = "${fn:substring(candidate.getAbout(), 0, 201)}" />
								${string2}...
				              </div>
				            </div>
				          </div>
						</a>
					</div>
				</c:forEach>
				</div>
	      </div>
	      <div class="scroll"><i class="fas fa-arrow-up"></i></div>
	      <script src="/js/scrollUp.js"></script>
</body>
</html>
