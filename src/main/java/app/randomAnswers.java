package app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoC;
import model.Answer;
import model.Candidate;
import model.Question;

/**
 * 
 * Adding random answers to newly created question for existing candidates
 *
 */
@WebServlet("/randomAnswers")
public class randomAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoC dao = null;

	@Override
	public void init() {
		dao = new DaoC();
	}

	public randomAnswers() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("qid"));
		Question q = dao.readQuestion(id);
		ArrayList<Candidate> candidates = dao.readAllCandidate();
		List<Answer> answers = dao.readQuestionAnswers(id);
		ArrayList<HashMap<String,String>> cans = new ArrayList<HashMap<String,String>>();

//		if the newly added question does not have any answers
		if (answers.size() == 0) {
			for (Candidate c : candidates) {
				HashMap<String,String> can = new HashMap<String, String>();
				Answer a = new Answer();
				a.setQuestion(q);
				a.setAnswer(randomAnswer());
				c.addAnswer(a);
				
				can.put("answer", a.getAnswer());			
				can.put("pic", c.getProfilePic());
				cans.add(can);
				if(dao.updateCandidate(c, request.getSession())) {
				}
			}			
		} else {
			for (Candidate c : candidates) {
				HashMap<String,String> can = new HashMap<String, String>();
				
				for (Answer a : c.getAnswers()) {
					if(a.getQuestion().getId() == id) {
						can.put("answer", a.getAnswer());			
						break;
					}
				}
				
				can.put("pic", c.getProfilePic());
				cans.add(can);
			}		
		}
		request.setAttribute("question", q);
		request.setAttribute("cans", cans);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/askToCandidates.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private static String randomAnswer() {
		String randomAnswer = String.valueOf((int) Math.floor(Math.random() * 5 + 1));
		return randomAnswer;
	}

}
