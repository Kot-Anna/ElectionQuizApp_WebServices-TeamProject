package app;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.core.Response;

import dao.DaoC;
import model.Candidate;

/**
 * Servlet implementation class DeleteCan
 * Responsible for deleting candidate
 */
@WebServlet("/deleteCan")
public class DeleteCan extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	DaoC dao;
	
	@Override
	public void init() {
		dao = new DaoC();
	}

	public DeleteCan() 
	{
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Candidate c = new Candidate();
		String id = request.getParameter("id");
		c.setId(Integer.parseInt(id));
		if(dao.deleteCandidate(c, request.getSession())) 
		{
			System.out.println("candidate deleted");
		}
		response.sendRedirect("/readallcandidatesadmin");
	}
	
}
