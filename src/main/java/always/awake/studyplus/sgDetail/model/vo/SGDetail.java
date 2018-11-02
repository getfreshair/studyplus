package always.awake.studyplus.sgDetail.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SGDetail implements Serializable {

	private int studyGroup_Code; // 그룹코드
	private int member_Code; // 그룹장코드
	private String member_NickName; // 그룹장닉네임
	private String studyGroup_Name; // 그룹명
	private int location_Code; // 지역 코드
	private String location_Name; // 지역 명
	private int studyGroup_GoalTime; // 목표 시간
	private int studyGroup_MaxNum; // 인원수
	private String studyGroup_Intro; // 그룹 소개
	private Date studyGroup_StDate; // 그룹 생성일
	private int studyGroup_Status; // 그룹 상태
	private Date studyGroup_EdDate; // 그룹 폐쇄일
	private int category_Code; // 카테고리 코드
	private String category_Name; // 카테고리 명
	private int studyGroup_OpenStatus; // 공개/비공개 여부
	private String studyGroup_Pwd; // 그룹 비밀번호
	
	private int groupTotalStudyTime; // 오늘 그룹의 총 공부량

	private int gr_Dates; // 오늘날짜 - 그룹 생성날짜
	private int gr_Mem_Count; // 현재 그룹 참여 인원 (DB를 바탕으로 도출 하는 필드)
	
	private int gr_Mem_Code; // 로그인유저 멤버코드
	private int gr_Day_Total; // 오늘 그룹 총 공부시간
	private int my_Day_Total; // 오늘 로그인유저 그룹내 총 공부시간
	private int gr_Fulfill_Mem_Cnt;	//목표시간 달성한 그룹원 수

	public SGDetail() {}

	public SGDetail(int studyGroup_Code, int member_Code, String member_NickName, String studyGroup_Name,
			int location_Code, String location_Name, int studyGroup_GoalTime, int studyGroup_MaxNum,
			String studyGroup_Intro, Date studyGroup_StDate, int studyGroup_Status, Date studyGroup_EdDate,
			int category_Code, String category_Name, int studyGroup_OpenStatus, String studyGroup_Pwd,
			int groupTotalStudyTime, int gr_Dates, int gr_Mem_Count, int gr_Mem_Code, int gr_Day_Total,
			int my_Day_Total, int gr_Fulfill_Mem_Cnt) {
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
		this.studyGroup_Status = studyGroup_Status;
		this.studyGroup_EdDate = studyGroup_EdDate;
		this.category_Code = category_Code;
		this.category_Name = category_Name;
		this.studyGroup_OpenStatus = studyGroup_OpenStatus;
		this.studyGroup_Pwd = studyGroup_Pwd;
		this.groupTotalStudyTime = groupTotalStudyTime;
		this.gr_Dates = gr_Dates;
		this.gr_Mem_Count = gr_Mem_Count;
		this.gr_Mem_Code = gr_Mem_Code;
		this.gr_Day_Total = gr_Day_Total;
		this.my_Day_Total = my_Day_Total;
		this.gr_Fulfill_Mem_Cnt = gr_Fulfill_Mem_Cnt;
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

	public int getStudyGroup_Status() {
		return studyGroup_Status;
	}

	public void setStudyGroup_Status(int studyGroup_Status) {
		this.studyGroup_Status = studyGroup_Status;
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

	public String getCategory_Name() {
		return category_Name;
	}

	public void setCategory_Name(String category_Name) {
		this.category_Name = category_Name;
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

	public int getGr_Dates() {
		return gr_Dates;
	}

	public void setGr_Dates(int gr_Dates) {
		this.gr_Dates = gr_Dates;
	}

	public int getGr_Mem_Count() {
		return gr_Mem_Count;
	}

	public void setGr_Mem_Count(int gr_Mem_Count) {
		this.gr_Mem_Count = gr_Mem_Count;
	}

	public int getGr_Mem_Code() {
		return gr_Mem_Code;
	}

	public void setGr_Mem_Code(int gr_Mem_Code) {
		this.gr_Mem_Code = gr_Mem_Code;
	}

	public int getGr_Day_Total() {
		return gr_Day_Total;
	}

	public void setGr_Day_Total(int gr_Day_Total) {
		this.gr_Day_Total = gr_Day_Total;
	}

	public int getMy_Day_Total() {
		return my_Day_Total;
	}

	public void setMy_Day_Total(int my_Day_Total) {
		this.my_Day_Total = my_Day_Total;
	}

	public int getGr_Fulfill_Mem_Cnt() {
		return gr_Fulfill_Mem_Cnt;
	}

	public void setGr_Fulfill_Mem_Cnt(int gr_Fulfill_Mem_Cnt) {
		this.gr_Fulfill_Mem_Cnt = gr_Fulfill_Mem_Cnt;
	}

	@Override
	public String toString() {
		return "SGDetail [studyGroup_Code=" + studyGroup_Code + ", member_Code=" + member_Code + ", member_NickName="
				+ member_NickName + ", studyGroup_Name=" + studyGroup_Name + ", location_Code=" + location_Code
				+ ", location_Name=" + location_Name + ", studyGroup_GoalTime=" + studyGroup_GoalTime
				+ ", studyGroup_MaxNum=" + studyGroup_MaxNum + ", studyGroup_Intro=" + studyGroup_Intro
				+ ", studyGroup_StDate=" + studyGroup_StDate + ", studyGroup_Status=" + studyGroup_Status
				+ ", studyGroup_EdDate=" + studyGroup_EdDate + ", category_Code=" + category_Code + ", category_Name="
				+ category_Name + ", studyGroup_OpenStatus=" + studyGroup_OpenStatus + ", studyGroup_Pwd="
				+ studyGroup_Pwd + ", groupTotalStudyTime=" + groupTotalStudyTime + ", gr_Dates=" + gr_Dates
				+ ", gr_Mem_Count=" + gr_Mem_Count + ", gr_Mem_Code=" + gr_Mem_Code + ", gr_Day_Total=" + gr_Day_Total
				+ ", my_Day_Total=" + my_Day_Total + ", gr_Fulfill_Mem_Cnt=" + gr_Fulfill_Mem_Cnt + "]";
	}
	
}