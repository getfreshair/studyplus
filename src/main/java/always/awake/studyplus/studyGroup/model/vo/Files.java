package always.awake.studyplus.studyGroup.model.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Files implements java.io.Serializable{
	private MultipartFile studygroupThumbnailImg;
	private int files_Code;
	private int files_BoardType;
	private String files_OriginName;
	private String files_Name;
	private Date files_EnrollDate;
	private int files_Status;
	private Date files_DeleteDate;
	private int studygroup_Code;
	private int member_Code;
	private int pr_Code;
	private int groupboard_Code;
	private int files_Order;
	
	public Files() {
		super();
	}

	public Files(MultipartFile studygroupThumbnailImg, int files_Code, int files_BoardType, String files_OriginName,
			String files_Name, Date files_EnrollDate, int files_Status, Date files_DeleteDate, int studygroup_Code,
			int member_Code, int pr_Code, int groupboard_Code, int files_Order) {
		super();
		this.studygroupThumbnailImg = studygroupThumbnailImg;
		this.files_Code = files_Code;
		this.files_BoardType = files_BoardType;
		this.files_OriginName = files_OriginName;
		this.files_Name = files_Name;
		this.files_EnrollDate = files_EnrollDate;
		this.files_Status = files_Status;
		this.files_DeleteDate = files_DeleteDate;
		this.studygroup_Code = studygroup_Code;
		this.member_Code = member_Code;
		this.pr_Code = pr_Code;
		this.groupboard_Code = groupboard_Code;
		this.files_Order = files_Order;
	}

	public MultipartFile getStudygroupThumbnailImg() {
		return studygroupThumbnailImg;
	}

	public void setStudygroupThumbnailImg(MultipartFile studygroupThumbnailImg) {
		this.studygroupThumbnailImg = studygroupThumbnailImg;
	}

	public int getFiles_Code() {
		return files_Code;
	}

	public void setFiles_Code(int files_Code) {
		this.files_Code = files_Code;
	}

	public int getFiles_BoardType() {
		return files_BoardType;
	}

	public void setFiles_BoardType(int files_BoardType) {
		this.files_BoardType = files_BoardType;
	}

	public String getFiles_OriginName() {
		return files_OriginName;
	}

	public void setFiles_OriginName(String files_OriginName) {
		this.files_OriginName = files_OriginName;
	}

	public String getFiles_Name() {
		return files_Name;
	}

	public void setFiles_Name(String files_Name) {
		this.files_Name = files_Name;
	}

	public Date getFiles_EnrollDate() {
		return files_EnrollDate;
	}

	public void setFiles_EnrollDate(Date files_EnrollDate) {
		this.files_EnrollDate = files_EnrollDate;
	}

	public int getFiles_Status() {
		return files_Status;
	}

	public void setFiles_Status(int files_Status) {
		this.files_Status = files_Status;
	}

	public Date getFiles_DeleteDate() {
		return files_DeleteDate;
	}

	public void setFiles_DeleteDate(Date files_DeleteDate) {
		this.files_DeleteDate = files_DeleteDate;
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

	public int getPr_Code() {
		return pr_Code;
	}

	public void setPr_Code(int pr_Code) {
		this.pr_Code = pr_Code;
	}

	public int getGroupboard_Code() {
		return groupboard_Code;
	}

	public void setGroupboard_Code(int groupboard_Code) {
		this.groupboard_Code = groupboard_Code;
	}

	public int getFiles_Order() {
		return files_Order;
	}

	public void setFiles_Order(int files_Order) {
		this.files_Order = files_Order;
	}

	@Override
	public String toString() {
		return "Files [studygroupThumbnailImg=" + studygroupThumbnailImg + ", files_Code=" + files_Code
				+ ", files_BoardType=" + files_BoardType + ", files_OriginName=" + files_OriginName + ", files_Name="
				+ files_Name + ", files_EnrollDate=" + files_EnrollDate + ", files_Status=" + files_Status
				+ ", files_DeleteDate=" + files_DeleteDate + ", studygroup_Code=" + studygroup_Code + ", member_Code="
				+ member_Code + ", pr_Code=" + pr_Code + ", groupboard_Code=" + groupboard_Code + ", files_Order="
				+ files_Order + "]";
	}

}