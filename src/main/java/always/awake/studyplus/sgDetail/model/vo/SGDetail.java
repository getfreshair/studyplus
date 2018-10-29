package always.awake.studyplus.sgDetail.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SGDetail implements Serializable {
   
   private int studyGroup_Code ;      // 그룹코드
   private int member_Code ;          // 그룹장코드
   private String member_NickName ;    // 그룹장닉네임
   private String studyGroup_Name;       // 그룹명
   private int location_Code;         // 지역 코드
   private String location_Name;      // 지역 명
   private int studyGroup_GoalTime;      // 목표 시간
   private int studyGroup_MaxNum;      // 인원수
   private String studyGroup_Intro;    // 그룹 소개
   private Date studyGroup_StDate;      // 그룹 생성일
   private int syudyGroup_Status;      // 그룹 상태
   private Date studyGroup_EdDate;      // 그룹 폐쇄일
   private int category_Code;         // 카테고리 코드
   private String categroy_Name;      // 카테고리 명
   private int studyGroup_OpenStatus;   // 공개/비공개 여부
   private String studyGroup_Pwd;      // 그룹 비밀번호
   private int groupTotalStudyTime   ;      // 오늘 그룹의 총 공부량
   
   public SGDetail() { }

	public SGDetail(int studyGroup_Code, int member_Code, String member_NickName, String studyGroup_Name, int location_Code,
			String location_Name, int studyGroup_GoalTime, int studyGroup_MaxNum, String studyGroup_Intro,
			Date studyGroup_StDate, int syudyGroup_Status, Date studyGroup_EdDate, int category_Code, String categroy_Name,
			int studyGroup_OpenStatus, String studyGroup_Pwd, int groupTotalStudyTime) {
		super();
		this.studyGroup_Code = studyGroup_Code;
		this.member_Code = member_Code;
		this.member_NickName = member_NickName;
		this.studyGroup_Name = studyGroup_Name;
		this.location_Code = location_Code;
		this.location_Name = location_Name;
		this.studyGroup_GoalTime = studyGroup_GoalTime;
		this.studyGroup_MaxNum = studyGroup_MaxNum;
		this.studyGroup_Intro = studyGroup_Intro;
		this.studyGroup_StDate = studyGroup_StDate;
		this.syudyGroup_Status = syudyGroup_Status;
		this.studyGroup_EdDate = studyGroup_EdDate;
		this.category_Code = category_Code;
		this.categroy_Name = categroy_Name;
		this.studyGroup_OpenStatus = studyGroup_OpenStatus;
		this.studyGroup_Pwd = studyGroup_Pwd;
		this.groupTotalStudyTime = groupTotalStudyTime;
	}
	
	public int getStudyGroup_Code() {
		return studyGroup_Code;
	}
	
	public void setStudyGroup_Code(int studyGroup_Code) {
		this.studyGroup_Code = studyGroup_Code;
	}
	
	public int getMember_Code() {
		return member_Code;
	}
	
	public void setMember_Code(int member_Code) {
		this.member_Code = member_Code;
	}
	
	public String getMember_NickName() {
		return member_NickName;
	}
	
	public void setMember_NickName(String member_NickName) {
		this.member_NickName = member_NickName;
	}
	
	public String getStudyGroup_Name() {
		return studyGroup_Name;
	}
	
	public void setStudyGroup_Name(String studyGroup_Name) {
		this.studyGroup_Name = studyGroup_Name;
	}
	
	public int getLocation_Code() {
		return location_Code;
	}
	
	public void setLocation_Code(int location_Code) {
		this.location_Code = location_Code;
	}
	
	public String getLocation_Name() {
		return location_Name;
	}
	
	public void setLocation_Name(String location_Name) {
		this.location_Name = location_Name;
	}
	
	public int getStudyGroup_GoalTime() {
		return studyGroup_GoalTime;
	}
	
	public void setStudyGroup_GoalTime(int studyGroup_GoalTime) {
		this.studyGroup_GoalTime = studyGroup_GoalTime;
	}
	
	public int getStudyGroup_MaxNum() {
		return studyGroup_MaxNum;
	}
	
	public void setStudyGroup_MaxNum(int studyGroup_MaxNum) {
		this.studyGroup_MaxNum = studyGroup_MaxNum;
	}
	
	public String getStudyGroup_Intro() {
		return studyGroup_Intro;
	}
	
	public void setStudyGroup_Intro(String studyGroup_Intro) {
		this.studyGroup_Intro = studyGroup_Intro;
	}
	
	public Date getStudyGroup_StDate() {
		return studyGroup_StDate;
	}
	
	public void setStudyGroup_StDate(Date studyGroup_StDate) {
		this.studyGroup_StDate = studyGroup_StDate;
	}
	
	public int getSyudyGroup_Status() {
		return syudyGroup_Status;
	}
	
	public void setSyudyGroup_Status(int syudyGroup_Status) {
		this.syudyGroup_Status = syudyGroup_Status;
	}
	
	public Date getStudyGroup_EdDate() {
		return studyGroup_EdDate;
	}
	
	public void setStudyGroup_EdDate(Date studyGroup_EdDate) {
		this.studyGroup_EdDate = studyGroup_EdDate;
	}
	
	public int getCategory_Code() {
		return category_Code;
	}
	
	public void setCategory_Code(int category_Code) {
		this.category_Code = category_Code;
	}
	
	public String getCategroy_Name() {
		return categroy_Name;
	}
	
	public void setCategroy_Name(String categroy_Name) {
		this.categroy_Name = categroy_Name;
	}
	
	public int getStudyGroup_OpenStatus() {
		return studyGroup_OpenStatus;
	}
	
	public void setStudyGroup_OpenStatus(int studyGroup_OpenStatus) {
		this.studyGroup_OpenStatus = studyGroup_OpenStatus;
	}
	
	public String getStudyGroup_Pwd() {
		return studyGroup_Pwd;
	}
	
	public void setStudyGroup_Pwd(String studyGroup_Pwd) {
		this.studyGroup_Pwd = studyGroup_Pwd;
	}
	
	public int getGroupTotalStudyTime() {
		return groupTotalStudyTime;
	}
	
	public void setGroupTotalStudyTime(int groupTotalStudyTime) {
		this.groupTotalStudyTime = groupTotalStudyTime;
	}
	
	@Override
	public String toString() {
		return "SGDetail [studyGroup_Code=" + studyGroup_Code + ", member_Code=" + member_Code + ", member_NickName="
				+ member_NickName + ", studyGroup_Name=" + studyGroup_Name + ", location_Code=" + location_Code
				+ ", location_Name=" + location_Name + ", studyGroup_GoalTime=" + studyGroup_GoalTime
				+ ", studyGroup_MaxNum=" + studyGroup_MaxNum + ", studyGroup_Intro=" + studyGroup_Intro
				+ ", studyGroup_StDate=" + studyGroup_StDate + ", syudyGroup_Status=" + syudyGroup_Status
				+ ", studyGroup_EdDate=" + studyGroup_EdDate + ", category_Code=" + category_Code + ", categroy_Name="
				+ categroy_Name + ", studyGroup_OpenStatus=" + studyGroup_OpenStatus + ", studyGroup_Pwd=" + studyGroup_Pwd
				+ ", groupTotalStudyTime=" + groupTotalStudyTime + "]";
	}

   
}