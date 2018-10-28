package always.awake.studyplus.studyGroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class StudyGroupController {
	@RequestMapping(value="studyGroupMainPage.sg")
	public String studyGroupMainPage() {
		return "studyGroup/studyGroupMain";
	}
	
	@RequestMapping(value="searchGroupListPage.sg")
	public String searchGroupList() {
		return "studyGroup/groupListPart/studyGroupListBody";
	}
}
