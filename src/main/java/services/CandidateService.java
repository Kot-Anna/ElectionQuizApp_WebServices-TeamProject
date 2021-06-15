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
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoS;
import model.Candidate;

@Path("/candidateservice")
public class CandidateService 
{

	DaoS dao = new DaoS();
	
//	private
	@POST
	@Path("/add")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response addCandidate(Candidate c) 
	{
		return dao.addCandidate(c);
	}
	
//	private
	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateCandidate(Candidate c) 
	{
		return dao.updateCandidate(c);
	}
	
//	private
	@DELETE
	@Path("/delete/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteCandidate(@PathParam("id") int id) 
	{
		return dao.deleteCandidate(id);
	}
	
//	public
	@GET
	@Path("/read/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readCandidate (@PathParam("id") int id) 
	{
		return dao.readCandidate(id);
	}
	
//	public
	@GET
	@Path("/readbyref/{refnum}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readCandidateByRef(@PathParam("refnum") String refnum) 
	{
		return dao.readCandidateByRef(refnum);
	}
	
//	public
	@Path("/readalladmin")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response readAllCandidateAdmin() 
	{
		return dao.readAllCandidate();
	}
	
	
//	public
	@Path("/readall")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response readAllCandidate() 
	{
		return readAllCandidateAdmin();
	}
}
