package model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


/**
 * The persistent class for the answer database table.
 * 
 */
@Entity
@NamedQuery(name="Answer.findAll", query="SELECT a FROM Answer a")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property="@id", scope = Answer.class)
public class Answer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int answerId;

	private String answer;

	//bi-directional many-to-one association to Candidate
	@ManyToOne(fetch=FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JsonBackReference(value="candidate-obj")
	@JoinColumn(name="can_id")
	private Candidate candidate;

	//bi-directional many-to-one association to Question
	@ManyToOne(fetch=FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
//	@JsonBackReference(value="question-obj")
	@JoinColumn(name="question_id")
	private Question question;
	
	public Answer() {
	}

	public int getId() {
		return this.answerId;
	}

	public void setId(int id) {
		this.answerId = id;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Candidate getCandidate() {
		return this.candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}
	
	public String getAnswer_value(String answerNum) {
		String answer_value = "";
		switch(answerNum) {
		case "1": answer_value = "Strongly Disagree"; break;
		case "2": answer_value = "Disagree"; break;
		case "3": answer_value = "Neutral"; break;
		case "4": answer_value = "Agree"; break;
		case "5": answer_value = "Strongly Agree"; break;
		}
		return answer_value;
	}

}