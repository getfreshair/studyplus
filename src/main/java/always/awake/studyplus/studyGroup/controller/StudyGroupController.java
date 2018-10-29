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
	public String searchGroupListPage() {
		return "studyGroup/groupListPart/studyGroupListBody";
	}
	
	@RequestMapping(value="studyGroupDetailPage.sg")
	public String studyGroupDetailPage() {
		return "studyGroupDetail/groupDetailPage";
	}
	
	@RequestMapping(value="studyGroupInsertPage.sg")
	public String studyGroupInsertPage() {
		return "studyGroup/groupInsertPart/groupInsertBody/studyGroupInsertBody";
	}
	
}
