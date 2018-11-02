package always.awake.studyplus.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class GroupBoard {
	private int groupboard_Code;
	private int member_Code;
	private String groupboard_Content;
	private Date groupboard_Postdate;
	private int groupboard_Type;
	private int groupboard_Status;
	private int studygroup_Code;
	private Date groupboard_Deldate;
	private int reply_Code;
	private Date reply_Date;
	private String reply_Content;
	private String studygroup_Name;
}
