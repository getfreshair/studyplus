package always.awake.studyplus.studyPlanner.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class StudyTime implements Serializable{
	
	private int studyTimeCode;
	private Date studyTimeDate;
	private int studyTimeTimezone;
	private int studyTimeStudyTime;
	private int studyTimeDivision;
	private int studyGroupCode;
	private int memberCode;
	
	public StudyTime() {}

	public StudyTime(int studyTimeCode, Date studyTimeDate, int studyTimeTimezone, int studyTimeStudyTime,
			int studyTimeDivision, int studyGroupCode, int memberCode) {
		super();
		this.studyTimeCode = studyTimeCode;
		this.studyTimeDate = studyTimeDate;
		this.studyTimeTimezone = studyTimeTimezone;
		this.studyTimeStudyTime = studyTimeStudyTime;
		this.studyTimeDivision = studyTimeDivision;
		this.studyGroupCode = studyGroupCode;
		this.memberCode = memberCode;
	}

	public int getStudyTimeCode() {
		return studyTimeCode;
	}

	public void setStudyTimeCode(int studyTimeCode) {
		this.studyTimeCode = studyTimeCode;
	}

	public Date getStudyTimeDate() {
		return studyTimeDate;
	}

	public void setStudyTimeDate(Date studyTimeDate) {
		this.studyTimeDate = studyTimeDate;
	}

	public int getStudyTimeTimezone() {
		return studyTimeTimezone;
	}

	public void setStudyTimeTimezone(int studyTimeTimezone) {
		this.studyTimeTimezone = studyTimeTimezone;
	}

	public int getStudyTimeStudyTime() {
		return studyTimeStudyTime;
	}

	public void setStudyTimeStudyTime(int studyTimeStudyTime) {
		this.studyTimeStudyTime = studyTimeStudyTime;
	}

	public int getStudyTimeDivision() {
		return studyTimeDivision;
	}

	public void setStudyTimeDivision(int studyTimeDivision) {
		this.studyTimeDivision = studyTimeDivision;
	}

	public int getStudyGroupCode() {
		return studyGroupCode;
	}

	public void setStudyGroupCode(int studyGroupCode) {
		this.studyGroupCode = studyGroupCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "StudyTime [studyTimeCode=" + studyTimeCode + ", studyTimeDate=" + studyTimeDate + ", studyTimeTimezone="
				+ studyTimeTimezone + ", studyTimeStudyTime=" + studyTimeStudyTime + ", studyTimeDivision="
				+ studyTimeDivision + ", studyGroupCode=" + studyGroupCode + ", memberCode=" + memberCode + "]";
	}
	
}
