package always.awake.studyplus.sgDetail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import always.awake.studyplus.sgDetail.model.service.SGDetailService;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Controller
public class SGDetailController {
	@Autowired
	private SGDetailService sgs;
	
	@RequestMapping(value="selectOneGroup.sgd", method=RequestMethod.GET)
	public String selectOneGroup(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		int sgCode = Integer.parseInt(request.getParameter("group_No"));
		System.out.println("그룹 No : " + sgCode);
			
		SGDetail sg = sgs.selectOneGroup(sgCode);
		System.out.println("서비스에서 받아온 sgDetail객체 : " + sgCode);
		
		return "studyGroupDetail/groupDetailPage";
	}
	
/*		@RequestMapping(value="/selectOneGroup.sgd", method=RequestMethod.POST)
		public String selectOneGroupDetail(@RequestParam("userId")String userId, @RequestParam(value="userPwd", defaultValue="1234", required=false)String userPwd) {
			<- 변수 이름 변경 가능(파라미터로 받아오기때문에) -> 3번 방식과의 차이점
			
			
			
			
			System.out.println("userId : " + userId);
			System.out.println("userPwd : " + userPwd);
			
			return "studyGroupDetail/groupDetailPage";
	}*/
}
