package always.awake.studyplus.block.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.block.model.service.BlockService;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;
import always.awake.studyplus.studyPlanner.model.vo.Goal;

@SessionAttributes("loginUser")
@Controller
public class blockController {

	@Autowired
	private BlockService bs;
	
	@RequestMapping("showBlockMain.bl")
	public String showBlockMain(HttpServletRequest requeest, Model model) {
		
		HashMap<String,Object> dataMap = 
				bs.selectStudyTimes(((Member)(requeest.getSession().getAttribute("loginUser"))).getMember_Code());
		model.addAttribute("dataMap", dataMap);
		return "block/blockMain";
	}
	
	@RequestMapping("blockTimesTempSave.bl")
	public void blockTimesTempSave(@RequestParam("todayStudyTime")String todayStudyTime,
								   @RequestParam("originTodayStudyTime")String originTodayStudyTime,
								   @RequestParam("groupList")String groupList,
								   @RequestParam("goalList")String goalList){
		System.out.println("오늘 공부 총량 : " + todayStudyTime);
		System.out.println("원래 공부 총량 : " + originTodayStudyTime);
		System.out.println(groupList);
		System.out.println(goalList);
	}
	
}
