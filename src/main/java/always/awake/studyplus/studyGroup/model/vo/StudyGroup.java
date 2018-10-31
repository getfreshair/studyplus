package always.awake.studyplus.studyGroup.model.vo;

import java.sql.Date;

public class StudyGroup implements java.io.Serializable{
	private int studygroup_Code; 
	private int member_Code;
	private String studygroup_Name;
	private int location_Code;
	private int studygroup_Goaltime;
	private int studygroup_Maxnum;
	private String studygroup_Intro;
	private Date studygroup_Sdate;
	private int studygroup_Status;
	private Date studygroup_Eddate;
	private int category_Code;
	private int studygroup_Openstatus;
	private String studygroup_Pwd;
	private Files studygroup_FIles;
	
	public StudyGroup() {}

	public StudyGroup(int studygroup_Code, int member_Code, String studygroup_Name, int location_Code,
			int studygroup_Goaltime, int studygroup_Maxnum, String studygroup_Intro, Date studygroup_Sdate,
			int studygroup_Status, Date studygroup_Eddate, int category_Code, int studygroup_Openstatus,
			String studygroup_Pwd, Files studygroup_FIles) {
		super();
		this.studygroup_Code = studygroup_Code;
		this.member_Code = member_Code;
		this.studygroup_Name = studygroup_Name;
		this.location_Code = location_Code;
		this.studygroup_Goaltime = studygroup_Goaltime;
		this.studygroup_Maxnum = studygroup_Maxnum;
		this.studygroup_Intro = studygroup_Intro;
		this.studygroup_Sdate = studygroup_Sdate;
		this.studygroup_Status = studygroup_Status;
		this.studygroup_Eddate = studygroup_Eddate;
		this.category_Code = category_Code;
		this.studygroup_Openstatus = studygroup_Openstatus;
		this.studygroup_Pwd = studygroup_Pwd;
		this.studygroup_FIles = studygroup_FIles;
	}

	public int getStudygroup_Code() {
		return studygroup_Code;
	}

	public void setStudygroup_Code(int studygroup_Code) {
		this.studygroup_Code = studygroup_Code;
	}

	public int getMember_Code() {
		return member_Code;
	}

	public void setMember_Code(int member_Code) {
		this.member_Code = member_Code;
	}

	public String getStudygroup_Name() {
		return studygroup_Name;
	}

	public void setStudygroup_Name(String studygroup_Name) {
		this.studygroup_Name = studygroup_Name;
	}

	public int getLocation_Code() {
		return location_Code;
	}

	public void setLocation_Code(int location_Code) {
		this.location_Code = location_Code;
	}

	public int getStudygroup_Goaltime() {
		return studygroup_Goaltime;
	}

	public void setStudygroup_Goaltime(int studygroup_Goaltime) {
		this.studygroup_Goaltime = studygroup_Goaltime;
	}

	public int getStudygroup_Maxnum() {
		return studygroup_Maxnum;
	}

	public void setStudygroup_Maxnum(int studygroup_Maxnum) {
		this.studygroup_Maxnum = studygroup_Maxnum;
	}

	public String getStudygroup_Intro() {
		return studygroup_Intro;
	}

	public void setStudygroup_Intro(String studygroup_Intro) {
		this.studygroup_Intro = studygroup_Intro;
	}

	public Date getStudygroup_Sdate() {
		return studygroup_Sdate;
	}

	public void setStudygroup_Sdate(Date studygroup_Sdate) {
		this.studygroup_Sdate = studygroup_Sdate;
	}

	public int getStudygroup_Status() {
		return studygroup_Status;
	}

	public void setStudygroup_Status(int studygroup_Status) {
		this.studygroup_Status = studygroup_Status;
	}

	public Date getStudygroup_Eddate() {
		return studygroup_Eddate;
	}

	public void setStudygroup_Eddate(Date studygroup_Eddate) {
		this.studygroup_Eddate = studygroup_Eddate;
	}

	public int getCategory_Code() {
		return category_Code;
	}

	public void setCategory_Code(int category_Code) {
		this.category_Code = category_Code;
	}

	public int getStudygroup_Openstatus() {
		return studygroup_Openstatus;
	}

	public void setStudygroup_Openstatus(int studygroup_Openstatus) {
		this.studygroup_Openstatus = studygroup_Openstatus;
	}

	public String getStudygroup_Pwd() {
		return studygroup_Pwd;
	}

	public void setStudygroup_Pwd(String studygroup_Pwd) {
		this.studygroup_Pwd = studygroup_Pwd;
	}

	public Files getStudygroup_FIles() {
		return studygroup_FIles;
	}

	public void setStudygroup_FIles(Files studygroup_FIles) {
		this.studygroup_FIles = studygroup_FIles;
	}

	@Override
	public String toString() {
		return "StudyGroup [studygroup_Code=" + studygroup_Code + ", member_Code=" + member_Code + ", studygroup_Name="
				+ studygroup_Name + ", location_Code=" + location_Code + ", studygroup_Goaltime=" + studygroup_Goaltime
				+ ", studygroup_Maxnum=" + studygroup_Maxnum + ", studygroup_Intro=" + studygroup_Intro
				+ ", studygroup_Sdate=" + studygroup_Sdate + ", studygroup_Status=" + studygroup_Status
				+ ", studygroup_Eddate=" + studygroup_Eddate + ", category_Code=" + category_Code
				+ ", studygroup_Openstatus=" + studygroup_Openstatus + ", studygroup_Pwd=" + studygroup_Pwd
				+ ", studygroup_FIles=" + studygroup_FIles + "]";
	}

}
