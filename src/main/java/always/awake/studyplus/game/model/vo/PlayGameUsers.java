package always.awake.studyplus.game.model.vo;

import java.util.Date;

public class PlayGameUsers {
	private int user_Code;
	private String startgame_Time;
	private String location_Name; 
	private String member_Job;
	
	
	public PlayGameUsers() { }


	public PlayGameUsers(int user_Code, String startgame_Time, String location_Name, String member_Job) {
		super();
		this.user_Code = user_Code;
		this.startgame_Time = startgame_Time;
		this.location_Name = location_Name;
		this.member_Job = member_Job;
	}


	public int getUser_Code() {
		return user_Code;
	}


	public void setUser_Code(int user_Code) {
		this.user_Code = user_Code;
	}


	public String getStartgame_Time() {
		return startgame_Time;
	}


	public void setStartgame_Time(String startgame_Time) {
		this.startgame_Time = startgame_Time;
	}


	public String getLocation_Name() {
		return location_Name;
	}


	public void setLocation_Name(String location_Name) {
		this.location_Name = location_Name;
	}


	public String getMember_Job() {
		return member_Job;
	}


	public void setMember_Job(String member_Job) {
		this.member_Job = member_Job;
	}


	@Override
	public String toString() {
		return "PlayGameUsers [user_Code=" + user_Code + ", startgame_Time=" + startgame_Time + ", location_Name="
				+ location_Name + ", member_Job=" + member_Job + "]";
	}


	
}
