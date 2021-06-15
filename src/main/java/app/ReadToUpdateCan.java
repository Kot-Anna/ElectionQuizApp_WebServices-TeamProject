package app;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoC;
import model.Candidate;

/**
 * 
 * Displays candidate info for the admin, can be edited
 *
 */
	
	@WebServlet("/readToUpdateCan")
	public class ReadToUpdateCan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoC dao;
	public void init() {
	dao=new DaoC();
	}
	
		public ReadToUpdateCan() {
		super();
	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Candidate c = dao.readCandidate(id);
		
		request.setAttribute("profile", c);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/update-candidate.jsp");
		rd.forward(request, response);
	}



}