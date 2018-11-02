package always.awake.studyplus.admin.model.vo;

import java.sql.Date;

public class DispauseBoard implements java.io.Serializable{
	
	private int member_Code;
	private String member_Id;
	private String member_Nickname;
	private String member_Gender;
	private String member_Phone;
	private int member_SMSConfirmation;
	private String loginrecord_Date;
	private int member_Status;
	
	public DispauseBoard() {
		super();
	}

	public DispauseBoard(int member_Code, String member_Id, String member_Nickname, String member_Gender,
			String member_Phone, int member_SMSConfirmation, String loginrecord_Date, int member_Status) {
		super();
		this.member_Code = member_Code;
		this.member_Id = member_Id;
		this.member_Nickname = member_Nickname;
		this.member_Gender = member_Gender;
		this.member_Phone = member_Phone;
		this.member_SMSConfirmation = member_SMSConfirmation;
		this.loginrecord_Date = loginrecord_Date;
		this.member_Status = member_Status;
	}

	public int getMember_Code() {
		return member_Code;
	}

	public void setMember_Code(int member_Code) {
		this.member_Code = member_Code;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getMember_Nickname() {
		return member_Nickname;
	}

	public void setMember_Nickname(String member_Nickname) {
		this.member_Nickname = member_Nickname;
	}

	public String getMember_Gender() {
		return member_Gender;
	}

	public void setMember_Gender(String member_Gender) {
		this.member_Gender = member_Gender;
	}

	public String getMember_Phone() {
		return member_Phone;
	}

	public void setMember_Phone(String member_Phone) {
		this.member_Phone = member_Phone;
	}

	public int getMember_SMSConfirmation() {
		return member_SMSConfirmation;
	}

	public void setMember_SMSConfirmation(int member_SMSConfirmation) {
		this.member_SMSConfirmation = member_SMSConfirmation;
	}

	public String getLoginrecord_Date() {
		return loginrecord_Date;
	}

	public void setLoginrecord_Date(String loginrecord_Date) {
		this.loginrecord_Date = loginrecord_Date;
	}

	public int getMember_Status() {
		return member_Status;
	}

	public void setMember_Status(int member_Status) {
		this.member_Status = member_Status;
	}

	@Override
	public String toString() {
		return "DispauseBoard [member_Code=" + member_Code + ", member_Id=" + member_Id + ", member_Nickname="
				+ member_Nickname + ", member_Gender=" + member_Gender + ", member_Phone=" + member_Phone
				+ ", member_SMSConfirmation=" + member_SMSConfirmation + ", loginrecord_Date=" + loginrecord_Date
				+ ", member_Status=" + member_Status + "]";
	}
	
}
