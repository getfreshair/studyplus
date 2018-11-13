package always.awake.studyplus.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.member.model.exception.LoginException;
import always.awake.studyplus.member.model.exception.MemberException;
import always.awake.studyplus.member.model.service.MemberService;
import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.need.model.vo.Need;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="studyPlannerMain.me")
	public String goMain() {
		return "studyPlanner/studyPlanner";
	}
	
	@RequestMapping(value="logoutMain.me")
	public String logoutMain() {
		
		return "main/main";
	}
	
	@RequestMapping(value="insertMemberPage.me")
	public String insertMemberPage() {
		return "member/insertMemberPage";
	}
	@RequestMapping(value="goAdmin.me")
	public String goAdmin() {
		return "admin/home";
	}
	
	@RequestMapping(value="insertMember.me")
	public String insertMember(Model model, Member m, Files files, @RequestParam(value="category_Code", required=false)ArrayList<String> category_Code, HttpServletRequest request) {
		if(ms.insertMember(m, files, category_Code, request) > 0) {
			return "redirect:logoutMain.me";
		}else {
			model.addAttribute("회원 가입을 실패 했어요.!");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value = "logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:logoutMain.me";
	}
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(@ModelAttribute Member m, Model model) {
		try {
			Member loginUser = ms.login(m);			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("loginUser", loginUser);
			
			int result = ms.insertMemberHistory(map);
			
			model.addAttribute("loginUser", loginUser);
			
			if(loginUser.getMember_Class()==0) {
				return "redirect:studyPlannerMainPage.sp";				
			}else {
				return "redirect:goAdmin.me";
			}
			
		} catch (LoginException e) {
			model.addAttribute("message", e.getMessage());
			
			return "common/errorPage"; 
		}
	}
	
	@RequestMapping(value="questionPage.me")
	public String questionPage() {
		return "common/question";
	}
	
	@RequestMapping(value="questionAnalysis.me")
	public ModelAndView questionAnalysis(@RequestParam(value="sentence")String sentence){
		ModelAndView mv = new ModelAndView();
	    
	    ms.checkSentence(sentence);
	    
		/*mv.addObject("reSentence", reSentence);*/
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping(value="insertGift.me")
	public @ResponseBody void insertGift(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		ms.insertGift(member_Code);
	}
	
	@RequestMapping(value="selectUserIdAndNick.me")
	public ModelAndView selectUserIdAndNick(@RequestParam(value="member_Id")String member_Id, @RequestParam(value="member_Nickname")String member_Nickname){
		ModelAndView mv = new ModelAndView();
		
		Map<String, Integer> checkVal = null;
		
		try {
			checkVal = ms.selectUserIdAndNick(member_Id, member_Nickname);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		mv.addObject("checkVal", checkVal);
		mv.setViewName("jsonView");
		
		return mv;
	}
}