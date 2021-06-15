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
import model.Candidate;

/**
 * 
 * Servlet responsible for displaying questions to the voter
 *
 */
@WebServlet("/voterQuestions")
public class voterQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoC dao = null;

	@Override
	public void init() {
		dao = new DaoC();
	}

	public voterQuestions() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Question> q = new ArrayList<>();
		
		
		q = dao.readAllQuestion();
		
		
		request.setAttribute("size", q.size());
		request.setAttribute("questions", q);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/questions.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
