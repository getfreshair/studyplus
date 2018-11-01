package always.awake.studyplus.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Member implements java.io.Serializable{
	private int member_Code;
	private String member_Id;
	private String member_Pwd;
	private String member_Nickname;
	private Date member_EnrollDate;
	private int member_Status;
	private int member_Class;
	private String member_Introduction;
	private int member_Age;
	private String member_Job;
	private String member_Gender;
	private int location_Code;
	private String member_Phone;
	private String member_SMSConfirmation;
	private Files files;
	private ArrayList<InterestCategory> category_Name;
	private Date loginrecord_Date;
	
	public Member() {
		super();
	};
	
	public Member(int member_Code, String member_Id, String member_Pwd, String member_Nickname, Date member_EnrollDate,
			int member_Status, int member_Class, String member_Introduction, int member_Age, String member_Job,
			String member_Gender, int location_Code, String member_Phone, String member_SMSConfirmation, Files files,
			ArrayList<InterestCategory> category_Name, Date loginrecord_Date) {
		super();
		this.member_Code = member_Code;
		this.member_Id = member_Id;
		this.member_Pwd = member_Pwd;
		this.member_Nickname = member_Nickname;
		this.member_EnrollDate = member_EnrollDate;
		this.member_Status = member_Status;
		this.member_Class = member_Class;
		this.member_Introduction = member_Introduction;
		this.member_Age = member_Age;
		this.member_Job = member_Job;
		this.member_Gender = member_Gender;
		this.location_Code = location_Code;
		this.member_Phone = member_Phone;
		this.member_SMSConfirmation = member_SMSConfirmation;
		this.files = files;
		this.category_Name = category_Name;
		this.loginrecord_Date = loginrecord_Date;
	}

	@Override
	public String toString() {
		return "Member [member_Code=" + member_Code + ", member_Id=" + member_Id + ", member_Pwd=" + member_Pwd
				+ ", member_Nickname=" + member_Nickname + ", member_EnrollDate=" + member_EnrollDate
				+ ", member_Status=" + member_Status + ", member_Class=" + member_Class + ", member_Introduction="
				+ member_Introduction + ", member_Age=" + member_Age + ", member_Job=" + member_Job + ", member_Gender="
				+ member_Gender + ", location_Code=" + location_Code + ", member_Phone=" + member_Phone
				+ ", member_SMSConfirmation=" + member_SMSConfirmation + ", files=" + files + ", category_Name="
				+ category_Name + ", loginrecord_Date=" + loginrecord_Date + "]";
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


	public String getMember_Pwd() {
		return member_Pwd;
	}


	public void setMember_Pwd(String member_Pwd) {
		this.member_Pwd = member_Pwd;
	}


	public String getMember_Nickname() {
		return member_Nickname;
	}


	public void setMember_Nickname(String member_Nickname) {
		this.member_Nickname = member_Nickname;
	}


	public Date getMember_EnrollDate() {
		return member_EnrollDate;
	}


	public void setMember_EnrollDate(Date member_EnrollDate) {
		this.member_EnrollDate = member_EnrollDate;
	}


	public int getMember_Status() {
		return member_Status;
	}


	public void setMember_Status(int member_Status) {
		this.member_Status = member_Status;
	}


	public int getMember_Class() {
		return member_Class;
	}


	public void setMember_Class(int member_Class) {
		this.member_Class = member_Class;
	}


	public String getMember_Introduction() {
		return member_Introduction;
	}


	public void setMember_Introduction(String member_Introduction) {
		this.member_Introduction = member_Introduction;
	}


	public int getMember_Age() {
		return member_Age;
	}


	public void setMember_Age(int member_Age) {
		this.member_Age = member_Age;
	}


	public String getMember_Job() {
		return member_Job;
	}


	public void setMember_Job(String member_Job) {
		this.member_Job = member_Job;
	}


	public String getMember_Gender() {
		return member_Gender;
	}


	public void setMember_Gender(String member_Gender) {
		this.member_Gender = member_Gender;
	}


	public int getLocation_Code() {
		return location_Code;
	}


	public void setLocation_Code(int location_Code) {
		this.location_Code = location_Code;
	}


	public String getMember_Phone() {
		return member_Phone;
	}


	public void setMember_Phone(String member_Phone) {
		this.member_Phone = member_Phone;
	}


	public String getMember_SMSConfirmation() {
		return member_SMSConfirmation;
	}


	public void setMember_SMSConfirmation(String member_SMSConfirmation) {
		this.member_SMSConfirmation = member_SMSConfirmation;
	}


	public Files getFiles() {
		return files;
	}


	public void setFiles(Files files) {
		this.files = files;
	}


	public ArrayList<InterestCategory> getCategory_Name() {
		return category_Name;
	}


	public void setCategory_Name(ArrayList<InterestCategory> category_Name) {
		this.category_Name = category_Name;
	}


	public Date getLoginrecord_Date() {
		return loginrecord_Date;
	}


	public void setLoginrecord_Date(Date loginrecord_Date) {
		this.loginrecord_Date = loginrecord_Date;
	}


	
}