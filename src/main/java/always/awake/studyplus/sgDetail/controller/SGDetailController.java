package always.awake.studyplus.sgDetail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.sgDetail.model.service.SGDetailService;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Controller
public class SGDetailController {
	@Autowired
	private SGDetailService sgs;
	
	@RequestMapping(value="selectOneGroup.sgd", method=RequestMethod.GET)
	public ModelAndView selectOneGroup(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		int userCode = loginUser.getMember_Code();
		
		int sgCode = Integer.parseInt(request.getParameter("group_No"));
		int joinStatus = sgs.selectGrJoinStatus(sgCode, userCode);
			
		try {
			SGDetail sg = sgs.selectOneGroup(sgCode, userCode);
			System.out.println("서비스에서 받아온 sgDetail객체 : " + sgCode);
			
			mv.addObject("sg", sg);
			mv.setViewName("studyGroupDetail/groupDetailPage");
						
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
/*		@RequestMapping(value="/selectOneGroup.sgd", method=RequestMethod.POST)
		public String selectOneGroupDetail(@RequestParam("userId")String userId, @RequestParam(value="userPwd", defaultValue="1234", required=false)String userPwd) {
			<- 변수 이름 변경 가능(파라미터로 받아오기때문에) -> 3번 방식과의 차이점
			
			
			
			
			System.out.println("userId : " + userId);
			System.out.println("userPwd : " + userPwd);
			
			return "studyGroupDetail/groupDetailPage";
	}*/
}
