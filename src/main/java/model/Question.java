package model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.util.List;


/**
 * The persistent class for the question database table.
 * 
 */
@Entity
@NamedQuery(name="Question.findAll", query="SELECT q FROM Question q")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property="@id", scope = Question.class)
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int questionId;

	@Lob
	private String question;

	@Column(name="question_ref")
	private String questionRef;

	//bi-directional many-to-one association to Answer
	@OneToMany(mappedBy="question", fetch=FetchType.LAZY, cascade = CascadeType.PERSIST)
//	@JsonManagedReference(value="question-obj")
	@JsonIgnore
	private List<Answer> answers;

	public Question() {
	}

	public int getId() {
		return this.questionId;
	}

	public void setId(int id) {
		this.questionId = id;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQuestionRef() {
		return this.questionRef;
	}

	public void setQuestionRef(String questionRef) {
		this.questionRef = questionRef;
	}

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Answer addAnswer(Answer answer) {
		getAnswers().add(answer);
		answer.setQuestion(this);

		return answer;
	}

	public Answer removeAnswer(Answer answer) {
		getAnswers().remove(answer);
		answer.setQuestion(null);

		return answer;
	}

}