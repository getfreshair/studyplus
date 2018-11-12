package always.awake.studyplus.need.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.need.model.service.NeedService;
import always.awake.studyplus.need.model.vo.Need;

@Controller
public class NeedController {

	@Autowired
	NeedService ns;
	
	// 새싹 정보 가져오기
	@RequestMapping(value="selectNeedData.nd")
	public @ResponseBody Need selectNeedData(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		Need need = ns.selectNeedData(member_Code);
		
		return need;
	} 

	@RequestMapping(value="insertWater.nd")
	public @ResponseBody void insertWater(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		String water = request.getParameter("water");
		
		ns.insertWater(member_Code, water);
		
		Need need = ns.selectNeedData(member_Code);
		
		if((need.getLv())*100 <= need.getExp()) {
			
			ns.updateLv(member_Code, need.getLv()+1);
		}
	} 
	
	@RequestMapping(value="initNeed")
	public @ResponseBody void initNeed(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		ns.initNeed(member_Code);
		ns.initGiveLove(member_Code);
	} 
}
