package services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import dao.DaoS;
import model.Question;

@Path("/questionservice")
public class QuestionService {
	DaoS dao = new DaoS();

//	private
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response addQuestion(Question q) {
		System.out.println("This is our parameter: " + q.getQuestionRef());
		return dao.addQuestion(q);
	}

//	private
	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateQuestion(Question q) {
		return dao.updateQuestion(q);
	}

//	private	
	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteQuestion(@PathParam("id") int id) {
		return dao.deleteQuestion(id);
	}

//	public
	@GET
	@Path("/read/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readQuestion(@PathParam("id") int id) {
		return dao.readQuestion(id);
	}
	
//	public
	@GET
	@Path("/read/{id}/answers")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readQuestionAnswers(@PathParam("id") int id) {
//		Question q = dao.readQuestion(id).readEntity(Question.class);
		
		return dao.readQuestionAnswers(id);
	}
	
//	public
	@GET
	@Path("/readbyanswerid/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readQuestionByAnswerID(@PathParam("id") int id) {
		return dao.readQuestionByAnswerID(id);
	}

//	public
	@Path("/readall")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response readAllQuestion() {
		return dao.readAllQuestion();
	}

}
