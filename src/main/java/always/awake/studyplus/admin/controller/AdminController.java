package always.awake.studyplus.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	
	@RequestMapping(value="movePage.me", method=RequestMethod.GET)
	public String showMemberList(@RequestParam("page") String page) {
		return page;
	}
	@RequestMapping("adminView.me")
	public String showAdminView() {
		return "admin/home";
	}
	
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
		if(searchOption.equals("123")) {
			map.put("Option",searchOption);
			System.out.println("제발");
		}else {
			map.put("Option",searchOption);
			
		}
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
}
