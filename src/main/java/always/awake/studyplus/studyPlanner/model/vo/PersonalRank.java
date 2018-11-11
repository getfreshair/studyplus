package always.awake.studyplus.studyPlanner.model.vo;

import java.sql.Date;

public class PersonalRank {

	private int rank;
	private Date rank_date;
	
	public PersonalRank() {
		super();
	}

	public PersonalRank(int rank, Date rank_date) {
		super();
		this.rank = rank;
		this.rank_date = rank_date;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public Date getRank_date() {
		return rank_date;
	}

	public void setRank_date(Date rank_date) {
		this.rank_date = rank_date;
	}

	@Override
	public String toString() {
		return "PesonalRank [rank=" + rank + ", rank_date=" + rank_date + "]";
	}
}
