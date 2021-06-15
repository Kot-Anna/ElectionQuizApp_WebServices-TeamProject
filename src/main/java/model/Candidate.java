package model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.List;


/**
 * The persistent class for the candidate database table.
 * 
 */
@Entity
@NamedQuery(name="Candidate.findAll", query="SELECT c FROM Candidate c")
public class Candidate implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Lob
	private String about;

	private int age;

	private String city;

	private String fname;

	private String lname;

	@Column(name="political_party")
	private String politicalParty;

	private String profession;

	@Lob
	@Column(name="profile_pic")
	private String profilePic;

	@Column(name="ref_num")
	private String refNum;

	@Lob
	@Column(name="why_candidate")
	private String whyCandidate;

	//bi-directional many-to-one association to Answer
	@OneToMany(mappedBy="candidate", fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonManagedReference(value="candidate-obj")
	private List<Answer> answers;

	public Candidate() {
	}

	public Candidate(String about, int age, String city, String fname, String lname, String politicalParty,
			String profession, String profilePic, String whyCandidate) {
		super();
		this.about = about;
		this.age = age;
		this.city = city;
		this.fname = fname;
		this.lname = lname;
		this.politicalParty = politicalParty;
		this.profession = profession;
		this.profilePic = profilePic;
		this.whyCandidate = whyCandidate;
		this.refNum = String.valueOf(new Timestamp(System.currentTimeMillis()).getTime());
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAbout() {
		return this.about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPoliticalParty() {
		return this.politicalParty;
	}

	public void setPoliticalParty(String politicalParty) {
		this.politicalParty = politicalParty;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfilePic() {
		return this.profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRefNum() {
		return this.refNum;
	}

	public void setRefNum(String refNum) {
		this.refNum = refNum;
	}

	public String getWhyCandidate() {
		return this.whyCandidate;
	}

	public void setWhyCandidate(String whyCandidate) {
		this.whyCandidate = whyCandidate;
	}

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Answer addAnswer(Answer answer) {
		getAnswers().add(answer);
		answer.setCandidate(this);

		return answer;
	}

	public Answer removeAnswer(Answer answer) {
		getAnswers().remove(answer);
		answer.setCandidate(null);

		return answer;
	}

}