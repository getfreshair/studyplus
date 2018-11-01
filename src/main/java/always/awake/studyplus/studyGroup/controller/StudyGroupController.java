package always.awake.studyplus.studyGroup.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.service.StudyGroupService;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

@Controller
public class StudyGroupController {
	@Autowired
	private StudyGroupService sgs;
	
	@RequestMapping(value="studyGroupMainPage.sg")
	public String studyGroupMainPage() {
		return "studyGroup/studyGroupMain";
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
	public String insertStudyGroup(Model model, @RequestParam("member_Code")int member_Code ,StudyGroup studygroup, Files files, HttpServletRequest request) {
		try {
			sgs.insertStudyGroup(studygroup, member_Code, files, request);
			
			return "redirect:studyGroupMainPage.sg";
		} catch (StudyGroupException e) {
			model.addAttribute("message", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="studyGroupListPage.sg")
	public String studyGroupListPage() {
		return "studyGroup/groupListPart/studyGroupListBody";
	}
	
	@RequestMapping(value="selectStudyGroupList.sg")
	public @ResponseBody List<Map<String, Object>> selectStudyGroupList(@RequestParam("searchSGName")String searchSGName, @RequestParam("currentPage")int currentPage) {
		List<Map<String, Object>> studyGroupList = null;
		
		try {
			studyGroupList = sgs.selectStudyGroupList(searchSGName);
		} catch (StudyGroupException e) {
			e.printStackTrace();
		}
		
		return studyGroupList;
	}
}
