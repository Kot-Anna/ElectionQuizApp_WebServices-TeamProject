package services;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dao.DaoS;
import model.Answer;
import model.Candidate;

@Path("/answerservice")
public class AnswerService {
	DaoS dao = new DaoS();
	
//	private
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response addAnswer(Answer a) 
	{
		return dao.addAnswer(a);
	}
	
//	admin
	@Path("/update")
	public String updateAnswer() {
		return "";
	}
	
//	admin
	@Path("/delete")
	public String deleteAnswer() {
		return "";
	}
	
//	public
	@Path("/read")
	public String readAnswer() {
		return "";
	}
	
//	public
	@Path("/readall")
	public String readAllAnswer() {
		return "";
	}
	
}
