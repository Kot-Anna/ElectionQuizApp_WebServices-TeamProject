# Read Me
## Team project for WebServices Class

### Team:
- Cihan Erenler
- Anna Kot
- Rachmad Fauzan
- Roman Konstantinov

### Used:
- HTML/JSP
- CSS
- Java
- MySQL
- JPA
- RESTful web services

### Project Description:
An App allowing a voter to check which of the avaiable candidates is best suited for his political views.

#### PROJECT ASSUMPTIONS:
- Field interviewers will be send to collect information from candidates, which then will be inserted to the App by admins.
-Few people with admin role will be able to manage the application (add/edit/delete questions and candidates).
- Admin data is stored in the database and inserted there directly by a person managing the system.
- Anyone visiting the website is able the take a quiz and see matching candidates.


#### PROJECT DETAILS:
##### Candidate:
- Candidate information is stored in the candidate table in the database.
-All information displayed on the View  regarding candidates is fetched from the database 
- The above applies to deleting and editing as well.- Functions such as adding, deleting and editng are only avaibale for the admin after logging in.
- Upon creating a candidate it is also required from admin to enter their anwers in the separate form.
- Candidates answers are stored in the answer table in the database (correlated with candidate id and question id)
- Candidates to whom answers were not assigned are automatically deleted from the database.
- Upon deleting the candidate all related information in the answer table is also being deleted.
FOREIGN KEY (can_id) REFERENCES candidate (id) ON DELETE CASCADE


##### Questions:
- Questions are stored in the question table in the database.
- All information displayed on the View  regarding questions is fetched from the database.
- The above applies to deleting and editing as well (corresponding methods created in the Model).
- Functions such as adding, deleting and editng are only avaibale for the admin after logging in.
- Upon creating a new questions answers for the existing candidates are randomized and inserted into answer table in the database.
- Upon deleting the question all related information in the answer table is also being deleted.
FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE


##### Voter:
- Voter's information is not stored anywhere (any visitor can take the test without his data being stored in the database)
- Voter's answers are collected from provided form using javascript and passed to related Controller (named calculate).
- Voter's answers are matched with the candidate's answers.
- Point system was implemented to calculate the highest matching Candidates. The points are assigned based on the difference between Voter's and Candidate's answers (0 difference = 100%, 1 point difference = 75% and so on).
- After completing the quiz the calculation is done by a controller and top 3 result is displayed on the following page.
- Voter can compare his answers to the top 3 matched candidates


##### Login:
- admin can log in using his email and password
- password is encrypted upon entering in the log in form and its encrypted value is also stored in the database
- New session is created for each logged in admin


## Steps to follow to use
1. Change the config file for the database in src/main/java/META-IF/persistance.xml
	Current database info: 
	URL:	jdbc:mysql://localhost:3306/vaalikone
	USER:	root
	Password:	Password1
2. Change the file upload/edit path in src/main/java => dao => DaoC.java inside the constructor. Variable name: "uploadPath".
3. To use the app as an admin, use the following credentials:

	ADMIN LOGIN INFO
	USER:	anna@anna.anna
	Password:	Password1
	
	or
	
	USER:	cihan@cihan.cihan
	Password:	Password1