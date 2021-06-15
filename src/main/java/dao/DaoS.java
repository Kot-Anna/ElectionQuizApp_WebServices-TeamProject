package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import model.Admin;
import model.Answer;
import model.Candidate;
import model.Question;

public class DaoS {
	private final EntityManagerFactory emf;
	private final EntityManager em;

	public DaoS() {
		emf = Persistence.createEntityManagerFactory("Vaalikone");
		em = emf.createEntityManager();
	}

//	Question Start
	public Response addQuestion(Question q) {
		em.clear();
		em.getTransaction().begin();
		em.persist(q);// The actual insertion line
		em.getTransaction().commit();
		if (q.equals(em.find(Question.class, q.getId()))) {
			return Response.ok(q).build();
		} else {
			return Response.status(409).build();
		}
	}

	public Response updateQuestion(Question q) {
		em.clear();
		Question que = em.find(Question.class, q.getId());
		if (que != null) {
			em.getTransaction().begin();
			em.merge(q);
			em.getTransaction().commit();
			return Response.ok().build();
		}
		return Response.status(409).build();
	}

	public Response deleteQuestion(int id) {
		em.clear();
		em.getTransaction().begin();
		Question q = em.find(Question.class, id);
		if (q != null) {
			em.remove(q);// The actual delete
			em.getTransaction().commit();
			return Response.ok().build();
		}
		em.getTransaction().commit();
		return Response.status(409).build();
	}

	public Response readQuestion(int id) {
		em.clear();
		em.getTransaction().begin();
		Question q = em.find(Question.class, id);
		em.getTransaction().commit();
		if (q != null) {
			return Response.ok(q).build();
		}
		return Response.status(409).build();
	}
	
	public Response readQuestionByAnswerID(int id) {
		em.clear();
		em.getTransaction().begin();
		Answer a = em.find(Answer.class, id);
		Question q = em.find(Question.class, a.getQuestion().getId());
		em.getTransaction().commit();
		if (q != null) {
			return Response.ok(q).build();
		}
		return Response.status(409).build();
	}

	public Response readQuestionAnswers(int id) {
		em.clear();
		em.getTransaction().begin();
		Question q = em.find(Question.class, id);
		em.getTransaction().commit();
		if (q != null) {
			List<Answer> a = q.getAnswers();
			return Response.ok(a).build();
		}
		return Response.status(409).build();
	}

	public Response readAllQuestion() {
		List<Question> list = em.createQuery("select a from Question a").getResultList();

		if (list == null) {
			return Response.status(404).build();
		}
		return Response.ok(list).build();
	}
// Question End
	
	
	
//	Candidate Start
	
	public Response addCandidate(Candidate c) {
		em.clear();
		em.getTransaction().begin();
		em.persist(c);// The actual insertion line
		em.getTransaction().commit();
		if (c.equals(em.find(Candidate.class, c.getId()))) {
			return Response.ok().build();
		} else {
			return Response.status(409).build();
		}
	}
	
	public Response updateCandidate(Candidate c) {
		em.clear();
		Candidate can = em.find(Candidate.class, c.getId());
		if (can != null) {
			em.getTransaction().begin();
			em.merge(c);
			em.getTransaction().commit();
			return Response.ok().build();
		}
		return Response.status(409).build();
	}

	public Response deleteCandidate(int id) {
		em.clear();
		em.getTransaction().begin();
		Candidate c = em.find(Candidate.class, id);
		if (c != null) {
			em.remove(c);// The actual delete
			em.getTransaction().commit();
			return Response.ok().build();
		}
		em.getTransaction().commit();
		return Response.status(409).build();
	}

	public Response readCandidate(int id) {
		em.clear();
		em.getTransaction().begin();
		Candidate c = em.find(Candidate.class, id);
		em.getTransaction().commit();
		if (c != null) {
			return Response.ok(c).build();
		}
		return Response.status(409).build();
	}
	
	public Response readCandidateByRef(String refnum) {
		em.getTransaction().begin();
		Candidate c = (Candidate) em.createQuery("SELECT c from Candidate c where c.refNum = "+refnum).getSingleResult();
		em.getTransaction().commit();
		if (c != null) {
			return Response.ok(c).build();
		}
		return Response.status(409).build();
	}

	public Response readAllCandidate() {
		List<Candidate> list = em.createQuery("select a from Candidate a").getResultList();
		if (list == null) {
			return Response.status(404).build();
		}
		for (Candidate c : list) {
			if (c.getAnswers().isEmpty()) {
				System.out.println("no answers:" + c.getFname());
				list.remove(c);
				deleteCandidate(c.getId());
				break;
			}
		}
		return Response.ok(list).build();
	}
	
//	Candidate End

//	Auth Start
	public Response login(Admin adm) {
		List<Admin> a = null;
		em.getTransaction().begin();
		a = em.createQuery("SELECT a from Admin a WHERE a.pwd='"+adm.getPwd()+"' AND a.email='"+adm.getEmail()+"'").getResultList();
		em.getTransaction().commit();
		
		if (a.size() == 1) {
			return Response.ok().build();
		} else {
			return Response.status(Status.UNAUTHORIZED).entity(adm).build();
		}
	}
//	Auth End	
	
//	Answer start
	public Response addAnswer(Answer a) {
		em.clear();
		em.getTransaction().begin();
		em.persist(a);// The actual insertion line
		em.getTransaction().commit();
		if (a.equals(em.find(Answer.class, a.getId()))) {
			return Response.ok().build();
		} else {
			return Response.status(409).build();
		}
	}

//	public Response readAnswersByQuestionId(int id) {
//		List<Answer> answers = null;
//		em.getTransaction().begin();
//		answers = em.createQuery("select a from Answer a join Question q on a.question.id ='"+id+"'", Answer.class).getResultList();
//		em.getTransaction().commit();
//		return Response.ok(answers).build();
//	}
	
}
