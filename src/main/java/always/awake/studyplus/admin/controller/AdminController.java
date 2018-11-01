package always.awake.studyplus.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import always.awake.studyplus.admin.model.service.AdminService;
import always.awake.studyplus.admin.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	
	@RequestMapping("adminView.me")
	public String showAdminView() {
		return "admin/home";
	}
	
	@RequestMapping(value="movePage.me", method=RequestMethod.GET)
	public String showMemberList(@RequestParam("page") String page) {
		
		if(page.equals("admin/memberManage/memberPenalty")) {
			return "redirect:getPenaltyList.do";
		}
		if(page.equals("admin/memberManage/memberDispause")) {
			return "redirect:getDispauseList.do";
		}
		
		return page;
	}
	////////////////////////////////////////////휴면 회원 관리///////////////////////////////
	@RequestMapping("getDispauseList.do")
	public ModelAndView getDispauseList(ModelAndView mv) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		
		List<Map<String, Object>> list = as.getDispauseList(map);
	
		
		mv.setViewName("admin/memberManage/memberDispause");
		mv.addObject("data", list);
		
		return mv;
		
	}
	
	
	///////////////////////////////////////////휴면회원관리 끝/////////////////////////////////////
	
	
	/////////////////////////////////회원관리 제제관리 //////////////////////////////////////////////
	
	//제재회원 이력 검색
	@RequestMapping(value = "adminSearchPenaltyHistory.do")
	public @ResponseBody List<Map<String, Object>> searchPenaltyHistory(@RequestParam String option, @RequestParam String keyword, HttpServletResponse response){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		List<Map<String, Object>> list = null;
		
		if(option.equals("memberId")) {
			hmap.put("keyword", keyword);
			list = as.searchPenaltyHistoryById(hmap);
		}else if(option.equals("memberCode")) {
			hmap.put("keyword", keyword);
			list = as.searchPenaltyHistoryByCode(hmap);
		}else {
			hmap.put("keyword", keyword);
			list = as.searchPenaltyHistoryByReason(hmap);
		}
		
		return list;
	}
	@RequestMapping("getPenaltyList.do")
	public ModelAndView getPenaltyList(ModelAndView mv) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		
		List<Map<String, Object>> list = as.getPenaltyList(map);
		List<Map<String, Object>> list1 = as.getPenaltyEndList(map);
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );

		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		
		mv.setViewName("admin/memberManage/memberPenalty");
		mv.addObject("data", list);
		mv.addObject("data2",list1);
		mv.addObject("today",mTime);
		
		return mv;
		
	}
	@RequestMapping("adminPenaltyEndMember.do")
	public void penaltyEndMember(@RequestParam("blockCode")String blockCode,HttpServletResponse response) {
		
		String[] selectBlockCode = blockCode.split(",");
		
		int result = 0;
		
		HashMap<String ,Object> map = new HashMap<String, Object>();
		
		for(int i = 0 ; i < selectBlockCode.length; i++) {
			int code = Integer.parseInt(selectBlockCode[i].trim());
			map.put("code",code);
			result += as.penaltyEndMember(map);
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("adminPenaltyMember.do")
	public void duplicationCheck(@RequestParam("title")String title, @RequestParam("textarea")String textarea,@RequestParam("lockDate")String lockDate,@RequestParam("memberCode")String memberCode,HttpServletResponse response) {
		
		System.out.println(title);
		System.out.println(memberCode);
		System.out.println(lockDate);
		
		String[] selectMemberCode = memberCode.split(",");
		
		
		int result = 0;
		
		HashMap<String ,Object> map = new HashMap<String, Object>();
		for(int i = 0 ; i < selectMemberCode.length; i++) {
			int code = Integer.parseInt(selectMemberCode[i].trim());
			map.put("title", title);
			map.put("textArea",textarea);
			map.put("lockDate",lockDate);
			map.put("code",code);
			result += as.penaltyMember(map);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/////////////////////////////////회원 제제관리 끝 //////////////////////////////////////////////

	
	
	
	/////////////////////////////////////////회원관리 회원리스트///////////////////////////////////////
	@RequestMapping("adminSearchMember.do")
	public void AdminSearchMember(@RequestParam("searchAll")String searchAll,@RequestParam("searchDate1")String searchDate1,
	@RequestParam("searchDate2")String searchDate2,@RequestParam("searchOption")String searchOption, HttpServletResponse response) {
		
		ObjectMapper mapper = new ObjectMapper();

		System.out.println(searchAll);
		System.out.println(searchDate1);
		System.out.println(searchDate2);
		System.out.println(searchOption);
		
		Date date1 = null;
		Date date2 = null;
		
		SimpleDateFormat transFormat  = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			date1 =  transFormat.parse(searchDate1);
			date2 = transFormat.parse(searchDate2);
		} catch (ParseException e1) {
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		
		map.put("All",searchAll.toString());
		map.put("Date1",date1);
		map.put("Date2",date2);
		map.put("Option",searchOption);
		
		List<Map<String, Object>> list = as.searchMember(map);
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/////////////////////////////////////////회원관리 회원리스트 끝///////////////////////////////////////
}
