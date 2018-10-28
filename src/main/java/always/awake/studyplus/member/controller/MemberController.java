package always.awake.studyplus.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import always.awake.studyplus.member.model.exception.LoginException;
import always.awake.studyplus.member.model.service.MemberService;
import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="studyPlannerMain.me")
	public String goMain() {
		return "planner/studyPlanner";
	}
	
	@RequestMapping(value="insertMemberPage.me")
	public String insertMemberPage() {
		return "member/insertMemberPage";
	}
	
	@RequestMapping(value="insertMember.me")
	public String insertMember(Model model, Member m, Files files, @RequestParam(value="category_Code", required=false)ArrayList<String> category_Code, HttpServletRequest request) {
		if(ms.insertMember(model, m, files, category_Code, request) > 0) {
			return "redirect:goMain.me";
		}else {
			model.addAttribute("회원 가입을 실패 했어요.!");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value = "logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:goMain.me";
	}
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(@ModelAttribute Member m, Model model) {
		try {
			Member loginUser = ms.login(m);
			
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:studyPlannerMain.me";
		} catch (LoginException e) {
			model.addAttribute("message", e.getMessage());
			
			return "common/errorPage"; 
		}
	}	
}