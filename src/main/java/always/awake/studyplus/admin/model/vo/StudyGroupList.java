package always.awake.studyplus.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import always.awake.studyplus.studyGroup.model.vo.Files;
import lombok.Data;

@Data
@Component
public class StudyGroupList {
	private int studygroup_Code; 
	private int member_Code;
	private String studygroup_Name;
	private int location_Name;
	private int studygroup_Goaltime;
	private int studygroup_Maxnum;
	private String studygroup_Intro;
	private Date studygroup_Sdate;
	private int studygroup_Status;
	private Date studygroup_Eddate;
	private int category_name;
	private int studygroup_Openstatus;
	private String studygroup_Pwd;
	private Files studygroup_FIles;
	private int joingroup_Membercount;

}
