package app;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoC;
import model.Question;

/**
 * Servlet implementation class CandidateQuestion
 * 
 */
@WebServlet("/jsp/candidate-question")
public class CandidateQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoC dao = null;
	
	public void init() 
	{
		dao = new DaoC();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ref = request.getParameter("ref");
		
		ArrayList<Question> q = dao.readAllQuestion();
		
		request.setAttribute("ref", ref);
		request.setAttribute("questions", q);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/candidate-question.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
