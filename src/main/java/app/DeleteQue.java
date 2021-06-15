package app;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dao.DaoC;
import model.Question;

/**
 * Servlet implementation class DeleteQue
 * Responsible for deleting question
 */
@WebServlet("/DeleteQue")
public class DeleteQue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoC dao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteQue() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init() {
		dao = new DaoC();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Question q = new Question();

		String id = request.getParameter("id");
		q.setId(Integer.parseInt(id));
		if (dao.deleteQuestion(q, request.getSession())) {
			response.sendRedirect("/jsp/admin-questions");
		}
	}
}
