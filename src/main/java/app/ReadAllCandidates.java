package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.core.GenericType;

import dao.DaoC;
import model.Candidate;

/**
 * Servlet implementation class ReadAllCandidates
 */
@WebServlet("/readallcandidates")
public class ReadAllCandidates extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoC dao = new DaoC();
    
    public ReadAllCandidates() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		List<Candidate> candidateList = dao.readAllCandidate();
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/candidates.jsp");
		request.setAttribute("candidateList", candidateList);
		rd.forward(request, response);	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}
}
