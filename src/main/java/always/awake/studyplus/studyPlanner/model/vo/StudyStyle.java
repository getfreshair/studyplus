package always.awake.studyplus.studyPlanner.model.vo;

import java.io.Serializable;

public class StudyStyle implements Serializable{
	private int studyStyleCode;
	private int memberCode;
	private int studyStyleEnrollDate;
	private int studyStyleActivity;
	private int studyStyleDeliberate;
	private int studyStyleSensibility;
	private int studyStyleIntuitive;
	private int studyStylePerspective;
	private int studyStyleLanguage;
	private int studyStyleSequential;
	private int studyStyleWhole;
	
	public StudyStyle(int studyStyleCode, int memberCode, int studyStyleEnrollDate, int studyStyleActivity,
			int studyStyleDeliberate, int studyStyleSensibility, int studyStyleIntuitive, int studyStylePerspective,
			int studyStyleLanguage, int studyStyleSequential, int studyStyleWhole) {
		super();
		this.studyStyleCode = studyStyleCode;
		this.memberCode = memberCode;
		this.studyStyleEnrollDate = studyStyleEnrollDate;
		this.studyStyleActivity = studyStyleActivity;
		this.studyStyleDeliberate = studyStyleDeliberate;
		this.studyStyleSensibility = studyStyleSensibility;
		this.studyStyleIntuitive = studyStyleIntuitive;
		this.studyStylePerspective = studyStylePerspective;
		this.studyStyleLanguage = studyStyleLanguage;
		this.studyStyleSequential = studyStyleSequential;
		this.studyStyleWhole = studyStyleWhole;
	}

	public int getStudyStyleCode() {
		return studyStyleCode;
	}

	public void setStudyStyleCode(int studyStyleCode) {
		this.studyStyleCode = studyStyleCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getStudyStyleEnrollDate() {
		return studyStyleEnrollDate;
	}

	public void setStudyStyleEnrollDate(int studyStyleEnrollDate) {
		this.studyStyleEnrollDate = studyStyleEnrollDate;
	}

	public int getStudyStyleActivity() {
		return studyStyleActivity;
	}

	public void setStudyStyleActivity(int studyStyleActivity) {
		this.studyStyleActivity = studyStyleActivity;
	}

	public int getStudyStyleDeliberate() {
		return studyStyleDeliberate;
	}

	public void setStudyStyleDeliberate(int studyStyleDeliberate) {
		this.studyStyleDeliberate = studyStyleDeliberate;
	}

	public int getStudyStyleSensibility() {
		return studyStyleSensibility;
	}

	public void setStudyStyleSensibility(int studyStyleSensibility) {
		this.studyStyleSensibility = studyStyleSensibility;
	}

	public int getStudyStyleIntuitive() {
		return studyStyleIntuitive;
	}

	public void setStudyStyleIntuitive(int studyStyleIntuitive) {
		this.studyStyleIntuitive = studyStyleIntuitive;
	}

	public int getStudyStylePerspective() {
		return studyStylePerspective;
	}

	public void setStudyStylePerspective(int studyStylePerspective) {
		this.studyStylePerspective = studyStylePerspective;
	}

	public int getStudyStyleLanguage() {
		return studyStyleLanguage;
	}

	public void setStudyStyleLanguage(int studyStyleLanguage) {
		this.studyStyleLanguage = studyStyleLanguage;
	}

	public int getStudyStyleSequential() {
		return studyStyleSequential;
	}

	public void setStudyStyleSequential(int studyStyleSequential) {
		this.studyStyleSequential = studyStyleSequential;
	}

	public int getStudyStyleWhole() {
		return studyStyleWhole;
	}

	public void setStudyStyleWhole(int studyStyleWhole) {
		this.studyStyleWhole = studyStyleWhole;
	}

	@Override
	public String toString() {
		return "StudyStyle [studyStyleCode=" + studyStyleCode + ", memberCode=" + memberCode + ", studyStyleEnrollDate="
				+ studyStyleEnrollDate + ", studyStyleActivity=" + studyStyleActivity + ", studyStyleDeliberate="
				+ studyStyleDeliberate + ", studyStyleSensibility=" + studyStyleSensibility + ", studyStyleIntuitive="
				+ studyStyleIntuitive + ", studyStylePerspective=" + studyStylePerspective + ", studyStyleLanguage="
				+ studyStyleLanguage + ", studyStyleSequential=" + studyStyleSequential + ", studyStyleWhole="
				+ studyStyleWhole + "]";
	}
	
	
}
