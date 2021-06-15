<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <title>Add Candidate</title>
    <link rel="stylesheet" href="style.css" />
    <script defer src="/js/add-candidateform.js"></script>
  </head>
  <body>
    <%@ include file="/jsp/dynamic-nav.jsp" %>
    <div class="add-can container flex-container">
      <div class="card">
        <a href="#" class="btn btn-back">
          <i class="fas fa-chevron-left"></i>
          Back</a>
        <h1 class="title">Add Candidate</h1>
        <div class="underline"></div>
        <div class="add-img">
            <img class="output-img" src="http://www.ll-mm.com/images/placeholders/team-placeholder.jpg" alt="candidate" />
        </div>
            <form action="addCan" method="POST" enctype="multipart/form-data"  class="candidate-form">
                <label for="img-file" class="upload"></i>Add Picture</label>
                <input type="file" name="profile_pic" id="img-file">	
                <input type="text" name="fname" id="fname" placeholder="First Name"/>
                <input type="text" name="lname" id="lname" placeholder="Last Name"/>
                <input type="text" name="city" id="city" placeholder="City"/>
                <input type="number" name="age" id="age" placeholder="Age"/>
                <input type="text" name="profession" id="profession" placeholder="Profession"/>
                <input type="text" name="political_party" id="party" placeholder="Political party"/>
                <textarea name="why_candidate" id="why-can" placeholder="Why did you become a candidate?"></textarea>
                <textarea name="about" id="about" placeholder="About"></textarea>
                <button name = "submit" type="submit" class="btn btn-thin">Add Candidate</button>
            </form>
      </div>
    </div>

    <script src="/js/add-candidate.js"></script>
 <script src="/js/goBack.js"></script>
  </body>
</html>
