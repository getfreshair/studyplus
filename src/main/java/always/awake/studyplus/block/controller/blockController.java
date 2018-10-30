package always.awake.studyplus.block.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.block.model.service.BlockService;
import always.awake.studyplus.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class blockController {

	@Autowired
	private BlockService bs;
	
	@RequestMapping("showBlockMain.bl")
	public String showBlockMain(HttpServletRequest requeest, Model model) {
		
		HashMap<String,ArrayList<Object>> dataMap = bs.selectStudyTimes(
				((Member)(requeest.getSession().getAttribute("loginUser"))).getMember_Code());
		
		return "block/blockMain";
	}
	
}