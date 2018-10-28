package always.awake.studyplus.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.admin.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class AdminController {
	
	@RequestMapping(value="movePage.me", method=RequestMethod.GET)
	public String showMemberList(@RequestParam("page") String page) {
		return page;
	}
	@RequestMapping("adminView.me")
	public String showAdminView() {
		return "admin/home";
	}
	
/*	@RequestMapping("duplicationCheck.me")
	public void duplicationCheck(@RequestParam("userId")String id, HttpServletResponse response) {
		
		System.out.println(id);
		ObjectMapper mapper = new ObjectMapper();
		
		Member m = new Member();
		m.setUserId(id);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(m));
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
	}*/
}
