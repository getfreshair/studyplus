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
	private SGDetailService gs;
	
	@RequestMapping(value="selectOneGroup.sgd", method=RequestMethod.GET)
	public ModelAndView selectOneGroup(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		int sgCode = Integer.parseInt(request.getParameter("group_No"));
			
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int memCode = loginUser.getMember_Code();

		System.out.println("SGDetail 컨트롤러 - \n그룹코드 : " + sgCode + ", \n로그인유저 : " + loginUser.toString() + ", \n로그인멤버코드 : " + memCode + ")");
		
		
		try {
			int joinStatus = gs.selectJoinStatus(memCode);
			SGDetail group = gs.selectOneGroup(sgCode);
			
			System.out.println("SGDetail 서비스에서 받아온 결과 - \n가입여부 (가입-1/미가입-0) : " + joinStatus + ", \n그룹 조회 결과 : " + group);
			
			mv.addObject("joinStatus", joinStatus);
			mv.addObject("group", group);
			mv.setViewName("studyGroupDetail/groupDetailPage");
						
		}catch (Exception e) {
			e.printStackTrace();
			//예외처리 클래스 생성하기
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
