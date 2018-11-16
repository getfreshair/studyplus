package always.awake.studyplus.member.controller;

import java.net.StandardSocketOptions;
import java.util.HashMap;
import java.util.List;
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
	public String insertMember(Model model, Member m, Files files, @RequestParam(value="category_Code", required=false)String[] category_Code, HttpServletRequest request) {
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
		System.out.println("in");
		ModelAndView mv = new ModelAndView();
	    
		HashMap<String, Object> questionInfo = ms.checkSentence(sentence);
		
		mv.addObject("questionInfo", questionInfo);
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
	
	@RequestMapping(value="addFriendSearch.me")
	public ModelAndView addFriendSearch(@RequestParam(value="member_Nickname")String member_Nickname, @RequestParam(value="member_Code")int member_Code){
		List<Map<String, Object>> userList = null;
		try {
			userList = ms.addFriendSearch(member_Nickname, member_Code);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("member/friendPart/addFriendSearch");
		mv.addObject("userList", userList);
		
		return mv;
	}
	
	@RequestMapping(value="addFriendWant.me")
	public @ResponseBody int addFriendWant(@RequestParam(value="member_Code1")int member_Code1, @RequestParam(value="member_Code2")int member_Code2) {
		try {
			ms.addFriendWant(member_Code1, member_Code2);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	@RequestMapping(value="addFriendToMe.me")
	public ModelAndView addFriendToMe(@RequestParam(value="member_Code")int member_Code){
		List<Map<String, Object>> userList = null;
		
		try {
			userList = ms.addFriendToMe(member_Code);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("member/friendPart/addFriendToMe");
		mv.addObject("userList", userList);
		
		return mv;
	}
	
	@RequestMapping(value="addFriendFromMe.me")
	public ModelAndView addFriendFromMe(@RequestParam(value="member_Code")int member_Code){
		List<Map<String, Object>> userList = null;
		
		try {
			userList = ms.addFriendFromMe(member_Code);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView("member/friendPart/addFriendFromMe");
		mv.addObject("userList", userList);
		
		return mv;
	}
	
	@RequestMapping(value="addFriendOk.me")
	public @ResponseBody int addFriendOk(@RequestParam(value="friend_Code")int friend_Code) {
		try {
			ms.addFriendOk(friend_Code);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	@RequestMapping(value="addFriendDelete.me")
	public @ResponseBody int addFriendDelete(@RequestParam(value="friend_Code")int friend_Code) {
		try {
			ms.addFriendDelete(friend_Code);
		} catch (MemberException e) {
			e.printStackTrace();
		}
		
		return 1;
	}
}