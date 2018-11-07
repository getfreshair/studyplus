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
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.service.StudyGroupService;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.PageInfo;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

@Controller
public class StudyGroupController {
	@Autowired
	private StudyGroupService sgs;
	
	@RequestMapping(value="studygroupStatistics.sg")
	public ModelAndView studygroupStatistics(ModelAndView mv, @RequestParam(value="code")int code){
		mv.addObject("code", code);
		mv.setViewName("studyGroup/groupChartPart/SGChart");
		
		return mv;
	}
	
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
	public @ResponseBody List<Map<String, Object>> studyGroupSelectJoinSGList(ModelAndView mav, @RequestParam("member_Code")int member_Code) {
		try {
			return sgs.studyGroupSelectJoinSGList(member_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="studyGroupSelectRecommendSGList.sg")
	public @ResponseBody List<Map<String, Object>> studyGroupSelectRecommendSGList(@RequestParam("member_Code")int member_Code) {
		try {
			return sgs.studyGroupSelectRecommendSGList(member_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="studyGroupInSGRankingList.sg")
	public @ResponseBody List<Map<String, Object>> studyGroupInSGRankingList(@RequestParam("member_Code")int member_Code){
		try {
			return sgs.studyGroupInSGRankingList(member_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			
			return null;
		}
	} 
	
	@RequestMapping(value="studyGroupInSGLastBoardList.sg")
	public @ResponseBody List<Map<String, Object>> studyGroupInSGLastBoardList(@RequestParam("member_Code")int member_Code){
		try {
			return sgs.studyGroupInSGLastBoardList(member_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	@RequestMapping(value="studyGroupInSGMyBoardArea.sg")
	public @ResponseBody List<Map<String, Object>> studyGroupInSGMyBoardArea(@RequestParam("member_Code")int member_Code){
		try {
			return sgs.studyGroupInSGMyBoardArea(member_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	@RequestMapping(value="selectStudyGroupSGRTRankList.sg")
	public @ResponseBody List<Map<String, Object>> selectStudyGroupSGRTRankList(@RequestParam("category_Code")int category_Code){
		try {
			return sgs.selectStudyGroupSGRTRankList(category_Code);
		} catch (StudyGroupException e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	@RequestMapping(value="insertStudyGroup.sg")
	public String insertStudyGroup(Model model, @RequestParam("member_Code")int member_Code, StudyGroup studygroup, Files files, HttpServletRequest request) {
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
	public @ResponseBody List<Map<String, Object>> selectStudyGroupList(PageInfo pi) {
		List<Map<String, Object>> sgListAndPi = null;
		
		try {
			sgListAndPi = sgs.sgListAndPi(pi);
		} catch (StudyGroupException e) {
			e.printStackTrace();
		}
		
		return sgListAndPi;
	}
	
	@RequestMapping(value="selectSGCategoryChart.sg")
	public @ResponseBody List<Map<String, Object>> selectSGCategoryChart(
			@RequestParam(value="studygroup_Code")int studygroup_Code, @RequestParam(value="period")String period){
		return sgs.selectSGCategoryChart(studygroup_Code, period);
	}
	
	
	
}
