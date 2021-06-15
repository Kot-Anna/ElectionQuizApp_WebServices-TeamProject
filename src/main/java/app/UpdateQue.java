package app;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


import dao.DaoC;
import model.Question;

/**
 * 
 * Servlet allowing logged in admin to change a question text or add a new
 * question
 *
 */
@WebServlet("/jsp/updateque")
public class UpdateQue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoC dao;

	public UpdateQue() {
		super();

	}

	@Override
	public void init() {
		dao = new DaoC();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String text = request.getParameter("question");

		if (request.getParameter("addNew") != null) {
			Question q = new Question();
			q.setQuestion(text);
			q.setQuestionRef(String.valueOf(new Timestamp(System.currentTimeMillis()).getTime()));

			Response addQuestion = dao.addQuestion(q, request.getSession());
			int qid = addQuestion.readEntity(Question.class).getId();
			
			if (addQuestion.getStatus() == 200) {
				response.sendRedirect("/randomAnswers?qid=" + qid);
				return;
			}
		} else {
			Question q = new Question();
			q.setId(Integer.parseInt(id));
			q.setQuestion(text);

			if (dao.updateQuestion(q, request.getSession())) {
				response.sendRedirect("/jsp/admin-questions");
			}
		}

	}

}
