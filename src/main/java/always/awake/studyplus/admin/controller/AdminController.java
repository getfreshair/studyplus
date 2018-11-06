package always.awake.studyplus.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import always.awake.studyplus.admin.common.CommonUtils;
import always.awake.studyplus.admin.common.Pagination;
import always.awake.studyplus.admin.model.service.AdminService;
import always.awake.studyplus.admin.model.vo.Banner;
import always.awake.studyplus.admin.model.vo.DispauseBoard;
import always.awake.studyplus.admin.model.vo.Files;
import always.awake.studyplus.admin.model.vo.PageInfo;
import always.awake.studyplus.member.model.vo.Member;

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
	////////////////////////////////////////광고 관리////////////////////////////////////////////
	@RequestMapping("adminSearchPRList.do")
	public @ResponseBody List<Map<String, Object>> searchPRList(@RequestParam String option, @RequestParam String keyword, @RequestParam String createDate1, @RequestParam String createDate2, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(keyword);
		System.out.println(option);
		System.out.println(createDate1);
		System.out.println(createDate2);
		
		
		map.put("keyword", keyword);
		map.put("option", option);
		map.put("createDate1", createDate1);
		map.put("createDate2", createDate2);
		
		
		List<Map<String, Object>> list = as.searchPRList(map);
		
		System.out.println(list);
		
		return list;
	}
	
	
	@RequestMapping("deletePR.do")
	public @ResponseBody int deletePR(@RequestParam String prCode, HttpSession session, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", prCode);
		
		int result = as.deletePR(map);
		
		return result;
	}
	
	
	@RequestMapping("updateCPC.do")
	public String updateCPC(Model m ,Banner b, Files files, HttpServletRequest request,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
			
			String prTitle = request.getParameter("prTitle");
			String prUrl = request.getParameter("prUrl");
			//사진 저장할 경로 지정12152
			String prCost = request.getParameter("prCost");
			int code = Integer.parseInt(request.getParameter("code"));
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println(prTitle);
			System.out.println("code들ㅇ오옴?" + code);
			System.out.println(photo);
			System.out.println("link 들어옴" +prUrl);
			//파일의 경로는 root 하위의 uploadFiles이다.
			String filePath = root + "\\upload\\admin\\thumbnail";
			
			System.out.println(filePath);
			
			//파일명 변경
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자 분리하기위한 로직
			String changeName = CommonUtils.getRandomString();
			b.setPr_Code(code);
			b.setPr_Title(prTitle);
			b.setPr_Link(prUrl);
			b.setPr_Contractmoney(prCost);
			
			//업로드된 파일을 지정한 경로에 저장
			try {
				System.out.println("여기는 오니?");
				System.out.println(photo);
			photo.transferTo(new File(filePath + "\\" + changeName + ext));
			
			int result = as.updateCPC(b, originFileName, changeName);
			
			System.out.println("이거하념ㄴ 성공"+result);
			
			
			
			return "redirect:getPRList.do";
			
			} catch (Exception e) {
			//실패시 파일을 삭제
			new File(filePath + "\\" + changeName + ext).delete();
			
			return "common/errorPage";
			}
		}
	
	
	
	@RequestMapping("updateCPP.do")
	public String updateCPP(Model m ,Banner b, Files files, HttpServletRequest request,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
			
			String prTitle = request.getParameter("prTitle");
			String prUrl = request.getParameter("prUrl");
			//사진 저장할 경로 지정12152
			String prCost = request.getParameter("prCost");
			int code = Integer.parseInt(request.getParameter("code"));
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println(prTitle);
			System.out.println("code들ㅇ오옴?" + code);
			System.out.println(photo);
			System.out.println("link 들어옴" +prUrl);
			//파일의 경로는 root 하위의 uploadFiles이다.
			String filePath = root + "\\upload\\admin\\thumbnail";
			
			System.out.println(filePath);
			
			//파일명 변경
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자 분리하기위한 로직
			String changeName = CommonUtils.getRandomString();
			b.setPr_Code(code);
			b.setPr_Title(prTitle);
			b.setPr_Link(prUrl);
			b.setPr_Contractmoney(prCost);
			
			//업로드된 파일을 지정한 경로에 저장
			try {
				System.out.println("여기는 오니?");
				System.out.println(photo);
			photo.transferTo(new File(filePath + "\\" + changeName + ext));
			
			int result = as.updateCPP(b, originFileName, changeName);
			
			System.out.println(result);
			
			
			
			return "redirect:getPRList.do";
			
			} catch (Exception e) {
			//실패시 파일을 삭제
			new File(filePath + "\\" + changeName + ext).delete();
			
			return "common/errorPage";
			}
		}
	
	
	@RequestMapping("selectPR.do")
	public ModelAndView searchPR(ModelAndView mv, String prCode, String type){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("prcode들어옴"+prCode);
	
		map.put("prCode", prCode);
		System.out.println("완료?");
		List<Map<String, Object>> list = as.selectPR(map);
		
		System.out.println(type);
		
		if(type.equals("CPP")) {
			System.out.println("들어옴");
			mv.addObject("map",list);
			mv.setViewName("admin/bannerManage/modal");
		}else {
			mv.addObject("map",list);
			mv.setViewName("admin/bannerManage/cpcModal");
		}
		return mv;
	}
	
	@RequestMapping("getPRList.do")
	public ModelAndView getCPCList(ModelAndView mv,  HttpServletRequest request) {
		
		List<Map<String, Object>> list = as.getPRList();
		
		System.out.println(list);
		
		mv.addObject("data", list);
		mv.setViewName("admin/bannerManage/insertBanner");
		
		return mv;
	}
	
	@RequestMapping("insertCPC.do")
	public String insertCPC(Model m ,Banner b, Files files, HttpServletRequest request,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
			
			String prCompany = request.getParameter("prCompany");
			String prTitle = request.getParameter("prTitle");
			String prUrl = request.getParameter("prUrl");
			String prCost = request.getParameter("prCost");
			int prCategory = Integer.parseInt(request.getParameter("category"));
			//사진 저장할 경로 지정12152
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			//파일의 경로는 root 하위의 uploadFiles이다.
			String filePath = root + "\\upload\\admin\\thumbnail";
			
			System.out.println(filePath);
			
			//파일명 변경
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자 분리하기위한 로직
			String changeName = CommonUtils.getRandomString();
		
			b.setPr_Company(prCompany);
			b.setPr_Title(prTitle);
			b.setPr_Link(prUrl);
			b.setPr_Contractmoney(prCost);
			b.setCategory_Code(prCategory);
			//업로드된 파일을 지정한 경로에 저장
			try {
				System.out.println("여기는 오니?");
				System.out.println(photo);
			photo.transferTo(new File(filePath + "\\" + changeName + ext));
			
			int result = as.insertCPC(b, originFileName, changeName);
			
			System.out.println(result);
			
			return "redirect:getPRList.do";
			
			} catch (Exception e) {
			//실패시 파일을 삭제
			new File(filePath + "\\" + changeName + ext).delete();
			
			return "common/errorPage";
			}
		}
	
	@RequestMapping("insertCPP.do")
	public String insertCPP(Model model ,Banner b, Files files, HttpServletRequest request,
		@RequestParam(name="photo", required=false) MultipartFile photo) {
		
		String prCompany = request.getParameter("prCompany");
		String prTitle = request.getParameter("prTitle");
		String prUrl = request.getParameter("prUrl");
		String prStartDate = request.getParameter("prStartDate");
		String prEndDate = request.getParameter("prEndDate");
		String prCost = request.getParameter("prCost");
		int prCategory = Integer.parseInt(request.getParameter("category"));
		//사진 저장할 경로 지정12152
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//파일의 경로는 root 하위의 uploadFiles이다.
		String filePath = root + "\\upload\\admin\\thumbnail";
		
		System.out.println(filePath);
		
		//파일명 변경
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자 분리하기위한 로직
		String changeName = CommonUtils.getRandomString();
	
		b.setPr_Company(prCompany);
		b.setPr_Title(prTitle);
		b.setPr_Link(prUrl);
		b.setPr_StartDate(prStartDate);
		b.setPr_EndDate(prEndDate);
		b.setPr_Contractmoney(prCost);
		b.setCategory_Code(prCategory);
		//업로드된 파일을 지정한 경로에 저장
		try {
			System.out.println("여기는 오니?");
			System.out.println(photo);
		photo.transferTo(new File(filePath + "\\" + changeName + ext));
		
		int result = as.insertCPP(b, originFileName, changeName);
		
		System.out.println(result);
		
		return "redirect:getPRList.do";
		
		} catch (Exception e) {
		//실패시 파일을 삭제
		//new File(filePath + "\\" + changeName + ext).delete();
		System.out.println(e.getMessage());
		model.addAttribute("msg","회원가입 실패!!");
		
		return "common/errorPage";
		}
	}
	
	////////////////////////////////////////광고 관리 끝////////////////////////////////////////////
	////////////////////////////////////////게시판 관리////////////////////////////////////////////////////////
	@RequestMapping("updateBoardStatus.do")
	public @ResponseBody int updateBoardStatus(@RequestParam String boardCode, HttpSession session, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String[] nCode = boardCode.split(",");
		
		System.out.println(nCode);
		
		int result = 0;
		
		for(int i = 0 ; i < nCode.length; i++) {
			int code = Integer.parseInt(nCode[i].trim());
			map.put("code",code);
			result += as.updateBoardStatus(map);
		}
		
		return result;
	}
	
	@RequestMapping("getGroupBoardList.do")
	public ModelAndView getGroupBoardList(ModelAndView mv, HttpServletRequest request) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String option = request.getParameter("option");
		String keyword = request.getParameter("keyword");
		
		Map<String, Object> map = new HashMap<String, Object>();	
		
		map.put("option", option);
		map.put("keyword", keyword);
		
		System.out.println(option);
		System.out.println(keyword);
		
		int listCount = as.getGroupBoardListCount(map);
		
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		map.put("pi", pi);
				
		List<Map<String, Object>> list = as.getGroupBoardList(map);
		
		System.out.println(list);
		map.put("list", list);
		
		mv.addObject("data", map);
		mv.setViewName("admin/boardManage/boardListManage");
		
		return mv;
		
	}
	
	
	
	@RequestMapping("adminDeleteNotice.do")
	public @ResponseBody int deleteNotice(@RequestParam String noticeCode, HttpSession session, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String[] nCode = noticeCode.split(",");
		
		int result = 0;
		
		
		for(int i = 0 ; i < nCode.length; i++) {
			int code = Integer.parseInt(nCode[i].trim());
			map.put("code",code);
			result += as.deleteNotice(map);
		}
		
		return result;
	}
	
	@RequestMapping("getNoticeList.do")
	public ModelAndView getNoticeList(ModelAndView mv, HttpServletRequest request) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String option = request.getParameter("option");
		String keyword = request.getParameter("keyword");
		
		Map<String, Object> map = new HashMap<String, Object>();	
		
		map.put("option", option);
		map.put("keyword", keyword);
		
		System.out.println(option);
		System.out.println(keyword);
		
		int listCount = as.getNoticeListCount(map);
		
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		map.put("pi", pi);
				
		List<Map<String, Object>> list = as.getNoticeList(map);
		
		System.out.println(list);
		map.put("list", list);
		
		mv.addObject("data", map);
		mv.setViewName("admin/boardManage/noticeList");
		
		return mv;
		
	}
	
	
	@RequestMapping("adminInsertNotice.do")
	public @ResponseBody int insertNotice(@RequestParam String title, @RequestParam String content, HttpSession session, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int adminCode = loginUser.getMember_Code();
		
		
		map.put("title", title);
		map.put("content", content);
		map.put("adminCode",adminCode);
		int result = as.insertNotice(map);
		
		return result;
	}
	
	
	
	
	/////////////////////////////////////////게시판 관리끝/////////////////////////////////////////////////
	
	/////////////////////////////////////////스터디 그룹 관리 //////////////////////////////////////////////////
	@RequestMapping("adminSearchGroupList.do")
	public @ResponseBody List<Map<String, Object>> searchGroupList(@RequestParam String option, @RequestParam String keyword, @RequestParam String createDate1, @RequestParam String createDate2, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(keyword);
		System.out.println(option);
		System.out.println(createDate1);
		System.out.println(createDate2);
		
		
		map.put("keyword", keyword);
		map.put("option", option);
		map.put("createDate1", createDate1);
		map.put("createDate2", createDate2);
		
		
		List<Map<String, Object>> list = as.searchGroupList(map);
		
		System.out.println(list);
		
		return list;
	}
	/////////////////////////////////////////스터디 그룹   끝 //////////////////////////////////////////////////
	
	
	////////////////////////////////////////////휴면 회원 관리///////////////////////////////
	@RequestMapping("getDispauseList.do")
	public ModelAndView getDispauseList(ModelAndView mv) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		
		List<Map<String, Object>> list = as.getDispauseList(map);
	
		
		mv.setViewName("admin/memberManage/memberDispause");
		mv.addObject("data", list);
		
		return mv;
		
	}
	
	@RequestMapping("adminDispauseUpdate.do")
	public void adminDispauseUpdate(@RequestParam("dispauseid")String dispauseid, HttpServletResponse response) {
		
		String[] divideDispauseid = dispauseid.split(",");
		
		
		int result = 0;
		
		HashMap<String ,Object> map = new HashMap<String, Object>();
		
		for(int i = 0 ; i < divideDispauseid.length; i++) {
			int code = Integer.parseInt(divideDispauseid[i].trim());
			map.put("code",code);
			result += as.DispauseMember(map);
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
	
	@RequestMapping("adminSearchDispauseHistory.do")
	public ModelAndView list(String option, String keyword, ModelAndView mv) {
		
		List<DispauseBoard> list = as.searchDispauseList(option, keyword);
		
		int count = as.countArticle(option, keyword);
		System.out.println(list);
		System.out.println(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", option);
		map.put("keyword", keyword);
		
		mv.addObject("map",map);
		mv.setViewName("jsonView");
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
