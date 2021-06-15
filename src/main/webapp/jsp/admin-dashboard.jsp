<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="container flex-container full-container">
      <div class="card dashboard">
        <h1 class="title">Admin Dashboard</h1>
        <div class="underline"></div>
        <div class="btn-dashboard">
          <a href="/readallcandidatesadmin" class="btn btn-thin">Candidates</a>
          <a href="admin-questions" class="btn btn-thin">Questions</a>
        </div>
      </div>
    </div>
  </body>
</html>
