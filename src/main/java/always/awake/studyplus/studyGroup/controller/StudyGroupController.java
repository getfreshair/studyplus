package always.awake.studyplus.studyGroup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

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
	
	@RequestMapping(value="studyGroupSelectJoinSGList.sg")
	public @ResponseBody String studyGroupSelectJoinSGList(@RequestParam("member_Code")int member_Code) {
		
		return "JoinSGList";
	}
	
	@RequestMapping(value="studyGroupSelectRecommendSGList.sg")
	public @ResponseBody String studyGroupSelectRecommendSGList(@RequestParam("member_Code")int member_Code) {
		
		return "Recommend";
	}
	
	@RequestMapping(value="insertStudyGroup.sg")
	public String insertStudyGroup(Model model, StudyGroup studygroup, Files files, HttpServletRequest request) {
		System.out.println("studygroup" + studygroup);
		System.out.println("files" + files);
		
		return "studyGroup/studyGroupMain";
	}
}
