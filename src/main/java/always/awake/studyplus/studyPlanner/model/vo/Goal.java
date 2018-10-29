package always.awake.studyplus.studyPlanner.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Goal implements Serializable {
	private int goalCode;			// 목표 코드
	private int memberCode;			// 회원 코드
	private String memberNickName;	// 회원 닉네임
	private Date goalEnrollDate;	// 목표 일
	private String goalContent;		// 목표
	private int goalType;			// 목표 종류
	private int goalGoalAmount;		// 목표량
	private int goalAchieveAmount;	// 달성량
	private String gaolISBN;		// ISBN
	private int goalDivision;		// 분류
	
	public Goal() { }

	public Goal(int goalCode, int memberCode, String memberNickName, Date goalEnrollDate, String goalContent,
			int goalType, int goalGoalAmount, int goalAchieveAmount, String gaolISBN, int goalDivision) {
		super();
		this.goalCode = goalCode;
		this.memberCode = memberCode;
		this.memberNickName = memberNickName;
		this.goalEnrollDate = goalEnrollDate;
		this.goalContent = goalContent;
		this.goalType = goalType;
		this.goalGoalAmount = goalGoalAmount;
		this.goalAchieveAmount = goalAchieveAmount;
		this.gaolISBN = gaolISBN;
		this.goalDivision = goalDivision;
	}

	public int getGoalCode() {
		return goalCode;
	}

	public void setGoalCode(int goalCode) {
		this.goalCode = goalCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public Date getGoalEnrollDate() {
		return goalEnrollDate;
	}

	public void setGoalEnrollDate(Date goalEnrollDate) {
		this.goalEnrollDate = goalEnrollDate;
	}

	public String getGoalContent() {
		return goalContent;
	}

	public void setGoalContent(String goalContent) {
		this.goalContent = goalContent;
	}

	public int getGoalType() {
		return goalType;
	}

	public void setGoalType(int goalType) {
		this.goalType = goalType;
	}

	public int getGoalGoalAmount() {
		return goalGoalAmount;
	}

	public void setGoalGoalAmount(int goalGoalAmount) {
		this.goalGoalAmount = goalGoalAmount;
	}

	public int getGoalAchieveAmount() {
		return goalAchieveAmount;
	}

	public void setGoalAchieveAmount(int goalAchieveAmount) {
		this.goalAchieveAmount = goalAchieveAmount;
	}

	public String getGaolISBN() {
		return gaolISBN;
	}

	public void setGaolISBN(String gaolISBN) {
		this.gaolISBN = gaolISBN;
	}

	public int getGoalDivision() {
		return goalDivision;
	}

	public void setGoalDivision(int goalDivision) {
		this.goalDivision = goalDivision;
	}

	@Override
	public String toString() {
		return "Goal [goalCode=" + goalCode + ", memberCode=" + memberCode + ", memberNickName=" + memberNickName
				+ ", goalEnrollDate=" + goalEnrollDate + ", goalContent=" + goalContent + ", goalType=" + goalType
				+ ", goalGoalAmount=" + goalGoalAmount + ", goalAchieveAmount=" + goalAchieveAmount + ", gaolISBN="
				+ gaolISBN + ", goalDivision=" + goalDivision + "]";
	}
	
	
}