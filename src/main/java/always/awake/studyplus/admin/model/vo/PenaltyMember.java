package always.awake.studyplus.admin.model.vo;


import java.sql.Date;

public class PenaltyMember implements  java.io.Serializable{
	private int member_Code;
	private String member_Id;
	private int block_Code;
	private Date block_StartDate;
	private Date block_EndDate;
	private String block_Reason;
	private int block_Status;
	
	public PenaltyMember() {
		super();
	}

	public PenaltyMember(int member_Code, String member_Id, int block_Code, Date block_StartDate, Date block_EndDate,
			String block_Reason, int block_Status) {
		super();
		this.member_Code = member_Code;
		this.member_Id = member_Id;
		this.block_Code = block_Code;
		this.block_StartDate = block_StartDate;
		this.block_EndDate = block_EndDate;
		this.block_Reason = block_Reason;
		this.block_Status = block_Status;
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

	public int getBlock_Code() {
		return block_Code;
	}

	public void setBlock_Code(int block_Code) {
		this.block_Code = block_Code;
	}

	public Date getBlock_StartDate() {
		return block_StartDate;
	}

	public void setBlock_StartDate(Date block_StartDate) {
		this.block_StartDate = block_StartDate;
	}

	public Date getBlock_EndDate() {
		return block_EndDate;
	}

	public void setBlock_EndDate(Date block_EndDate) {
		this.block_EndDate = block_EndDate;
	}

	public String getBlock_Reason() {
		return block_Reason;
	}

	public void setBlock_Reason(String block_Reason) {
		this.block_Reason = block_Reason;
	}

	public int getBlock_Status() {
		return block_Status;
	}

	public void setBlock_Status(int block_Status) {
		this.block_Status = block_Status;
	}

	@Override
	public String toString() {
		return "PenaltyMember [member_Code=" + member_Code + ", member_Id=" + member_Id + ", block_Code=" + block_Code
				+ ", block_StartDate=" + block_StartDate + ", block_EndDate=" + block_EndDate + ", block_Reason="
				+ block_Reason + ", block_Status=" + block_Status + "]";
	}
	
}
