package always.awake.studyplus.admin.model.vo;

import java.sql.Date;

public class Banner {
	
	private int pr_Code;
	private String pr_Company;
	private String pr_Title;
	private String pr_Link;
	private int pr_Order;
	private int pr_Type;
	private String pr_Contractmoney;
	private int category_Code;
	private String pr_StartDate;
	private String pr_EndDate;
	private Files files;
	private String pr_ClickMoney;
	
	public Banner() {}

	public Banner(int pr_Code, String pr_Company, String pr_Title, String pr_Link, int pr_Order, int pr_Type,
			String pr_Contractmoney, int category_Code, String pr_StartDate, String pr_EndDate, Files files,
			String pr_ClickMoney) {
		super();
		this.pr_Code = pr_Code;
		this.pr_Company = pr_Company;
		this.pr_Title = pr_Title;
		this.pr_Link = pr_Link;
		this.pr_Order = pr_Order;
		this.pr_Type = pr_Type;
		this.pr_Contractmoney = pr_Contractmoney;
		this.category_Code = category_Code;
		this.pr_StartDate = pr_StartDate;
		this.pr_EndDate = pr_EndDate;
		this.files = files;
		this.pr_ClickMoney = pr_ClickMoney;
	}

	public int getPr_Code() {
		return pr_Code;
	}

	public void setPr_Code(int pr_Code) {
		this.pr_Code = pr_Code;
	}

	public String getPr_Company() {
		return pr_Company;
	}

	public void setPr_Company(String pr_Company) {
		this.pr_Company = pr_Company;
	}

	public String getPr_Title() {
		return pr_Title;
	}

	public void setPr_Title(String pr_Title) {
		this.pr_Title = pr_Title;
	}

	public String getPr_Link() {
		return pr_Link;
	}

	public void setPr_Link(String pr_Link) {
		this.pr_Link = pr_Link;
	}

	public int getPr_Order() {
		return pr_Order;
	}

	public void setPr_Order(int pr_Order) {
		this.pr_Order = pr_Order;
	}

	public int getPr_Type() {
		return pr_Type;
	}

	public void setPr_Type(int pr_Type) {
		this.pr_Type = pr_Type;
	}

	public String getPr_Contractmoney() {
		return pr_Contractmoney;
	}

	public void setPr_Contractmoney(String pr_Contractmoney) {
		this.pr_Contractmoney = pr_Contractmoney;
	}

	public int getCategory_Code() {
		return category_Code;
	}

	public void setCategory_Code(int category_Code) {
		this.category_Code = category_Code;
	}

	public String getPr_StartDate() {
		return pr_StartDate;
	}

	public void setPr_StartDate(String pr_StartDate) {
		this.pr_StartDate = pr_StartDate;
	}

	public String getPr_EndDate() {
		return pr_EndDate;
	}

	public void setPr_EndDate(String pr_EndDate) {
		this.pr_EndDate = pr_EndDate;
	}

	public Files getFiles() {
		return files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public String getPr_ClickMoney() {
		return pr_ClickMoney;
	}

	public void setPr_ClickMoney(String pr_ClickMoney) {
		this.pr_ClickMoney = pr_ClickMoney;
	}

	@Override
	public String toString() {
		return "Banner [pr_Code=" + pr_Code + ", pr_Company=" + pr_Company + ", pr_Title=" + pr_Title + ", pr_Link="
				+ pr_Link + ", pr_Order=" + pr_Order + ", pr_Type=" + pr_Type + ", pr_Contractmoney=" + pr_Contractmoney
				+ ", category_Code=" + category_Code + ", pr_StartDate=" + pr_StartDate + ", pr_EndDate=" + pr_EndDate
				+ ", files=" + files + ", pr_ClickMoney=" + pr_ClickMoney + "]";
	}

	
}
