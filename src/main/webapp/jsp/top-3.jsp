<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="model.Candidate" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/jsp/style.css" />
    <title>Top 3 Candidates</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  </head>
  <body>
    <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="container flex-container full-container">
      <div class="card top3-card">
        <div class="title">Top 3 Candidates</div>
        <div class="underline"></div>
        <div class="top-3">
          <div class="top-wrap" data-name="${requestScope.top.get(1).getFname()} ${requestScope.top.get(1).getLname()}" data-list="${requestScope.list[1]}">
            <div class="rank">2</div>
            <div class="circle" data-val="${requestScope.per.get(1)}">
              <div class="circle-half second"></div>
              <div class="circle-half second"></div>
              <div class="half"></div>
              <div class="circle-img">
                <a href="/ShowProfile?id=${requestScope.top.get(1).getId()}"
                  ><img src="/img/${requestScope.top.get(1).getProfilePic()}" alt="profile-img"
                /></a>
                <span class="per">0%</span>
              </div>
            </div>
            <h2>${requestScope.top.get(1).getFname()} ${requestScope.top.get(1).getLname()}</h2>
            <div class="party">${requestScope.top.get(1).getPoliticalParty()}</div>
          </div>
          <div class="top-wrap" data-name="${requestScope.top.get(0).getFname()} ${requestScope.top.get(0).getLname()}" data-list="${requestScope.list[0]}">
            <div class="rank">1</div>
            <div class="circle" data-val="${requestScope.per.get(0)}">
              <div class="circle-half"></div>
              <div class="circle-half"></div>
              <div class="half"></div>
              <div class="circle-img">
                <a href="/ShowProfile?id=${requestScope.top.get(0).getId()}"
                  ><img src="/img/${requestScope.top.get(0).getProfilePic()}" alt="profile-img"
                /></a>
                <span class="per">0%</span>
              </div>
            </div>
            <h2 class="top-name">${requestScope.top.get(0).getFname()} ${requestScope.top.get(0).getLname()}</h2>
            <div class="party">${requestScope.top.get(0).getPoliticalParty()}</div>
          </div>
          <div class="top-wrap" data-name="${requestScope.top.get(2).getFname()} ${requestScope.top.get(2).getLname()}" data-list="${requestScope.list[2]}">
            <div class="rank">3</div>
            <div class="circle" data-val="${requestScope.per.get(2)}">
              <div class="circle-half third"></div>
              <div class="circle-half third"></div>
              <div class="half"></div>
              <div class="circle-img">
                <a href="/ShowProfile?id=${requestScope.top.get(2).getId()}"
                  ><img src="/img/${requestScope.top.get(2).getProfilePic()}" alt="profile-img"
                /></a>
                <span class="per">0%</span>
              </div>
            </div>
            <h2>${requestScope.top.get(2).getFname()} ${requestScope.top.get(2).getLname()}</h2>
            <div class="party">${requestScope.top.get(2).getPoliticalParty()}</div>
          </div>
        </div>
        <div class="btn-container">
          <a href="/jsp/compare.jsp" class="btn">Compare Answers</a>
          <a href="/voterQuestions" class="btn take-again">Retake Test</a>
        </div>
        <!-- <a href="" class="see-compare">Compare Answers</a> -->
      </div>
    </div>

    <script src="../js/top3.js"></script>
  </body>
</html>
