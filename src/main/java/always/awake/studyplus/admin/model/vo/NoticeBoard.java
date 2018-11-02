package always.awake.studyplus.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class NoticeBoard {
	private int notice_Code;
	private String notice_Title;
	private String notice_Content;
	private Date notice_Enrolldate;
	private Date notice_Deletedate;
	private int notice_Status;
	private int notice_Count;
	private int member_Code;
}
