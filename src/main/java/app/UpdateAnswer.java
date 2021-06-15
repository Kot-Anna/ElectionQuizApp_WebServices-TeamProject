package app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoC;
import model.Question;
import model.Answer;
import model.Candidate;

/**
 * 
 * Servlet allowing a logged admin to change candidates answers
 *
 */
@WebServlet("/jsp/UpdateAnswer")
public class UpdateAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoC dao = new DaoC();

	public UpdateAnswer() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ref = request.getParameter("ref");
		String id = request.getParameter("id");
		int size = Integer.parseInt(request.getParameter("size"));

		List<Answer> answer = null;

		Candidate c = null;
		if (id != null) {
			System.out.println("Exists ID : " + id);
			c = dao.readCandidate(id);
			answer = c.getAnswers();

			for (int i = 0; i < answer.size(); i++) {
				Answer ans = answer.get(i);
				ans.setAnswer(request.getParameter(String.valueOf(i)));

				answer.set(i, ans);
			}
		} else {
			System.out.println("Exists refNum : " + ref);
			c = dao.readCandidateByRef(ref);
			answer = new ArrayList<Answer>();

			for (int i = 0; i < size; i++) {
				Answer ans = new Answer();
				Question q = dao
						.readQuestion(Integer.parseInt(request.getParameter("questionID".concat(String.valueOf(i)))));

				ans.setAnswer(request.getParameter(String.valueOf(i)));
				ans.setQuestion(q);
				answer.add(ans);
			}
		}

		c.setAnswers(answer);

		dao.updateCandidate(c, request.getSession());

		response.sendRedirect("/readallcandidatesadmin");
	}

}
