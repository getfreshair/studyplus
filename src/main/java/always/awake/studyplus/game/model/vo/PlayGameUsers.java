package always.awake.studyplus.game.model.vo;

import java.util.Date;

public class PlayGameUsers {
	private int user_Code;
	private String startgame_Time;
	private String division; 
	private String div_Value;
	
	
	public PlayGameUsers() { }


	public PlayGameUsers(int user_Code, String startgame_Time, String division, String div_Value) {
		super();
		this.user_Code = user_Code;
		this.startgame_Time = startgame_Time;
		this.division = division;
		this.div_Value = div_Value;
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


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public String getDiv_Value() {
		return div_Value;
	}


	public void setDiv_Value(String div_Value) {
		this.div_Value = div_Value;
	}


	@Override
	public String toString() {
		return "PlayGameUsers [user_Code=" + user_Code + ", startgame_Time=" + startgame_Time + ", division=" + division
				+ ", div_Value=" + div_Value + "]";
	}
	
	
}
