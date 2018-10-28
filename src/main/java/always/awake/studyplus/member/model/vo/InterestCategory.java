package always.awake.studyplus.member.model.vo;

public class InterestCategory implements java.io.Serializable{
	private int member_Code;
	private int category_Code;
	private String category_Name;
	
	public InterestCategory() {
		super();
	}

	public InterestCategory(int member_Code, int category_Code, String category_Name) {
		super();
		this.member_Code = member_Code;
		this.category_Code = category_Code;
		this.category_Name = category_Name;
	}

	public int getMember_Code() {
		return member_Code;
	}

	public void setMember_Code(int member_Code) {
		this.member_Code = member_Code;
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

	@Override
	public String toString() {
		return "InterestCategory [member_Code=" + member_Code + ", category_Code=" + category_Code + ", category_Name="
				+ category_Name + "]";
	}

}