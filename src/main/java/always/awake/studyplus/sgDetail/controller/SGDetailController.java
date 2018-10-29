package always.awake.studyplus.sgDetail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SGDetailController {
		
	@RequestMapping(value="/selectOneGroup.sgd", method=RequestMethod.POST)
	public String selectOneGroupDetail(int studyGroupCode) {
		System.out.println("그룹 No : " + studyGroupCode);
		
		
								
											
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
