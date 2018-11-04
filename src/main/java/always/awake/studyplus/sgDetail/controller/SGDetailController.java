package always.awake.studyplus.sgDetail.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		int grCode = Integer.parseInt(request.getParameter("group_No"));
			
		int memCode = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_Code();
		
		//		test 지우기
		memCode = 4;	
		
		try {
			int joinStatus = gs.selectJoinStatus(grCode, memCode);
			
			SGDetail group = gs.selectOneGrDetailJoinBefore(grCode);
			
			if(group != null) {
				//예외처리하기
			}
			
			mv.addObject("joinStatus", joinStatus);
			mv.addObject("gr", group);

			System.out.println("컨트롤러");
			System.out.println(joinStatus + " / " + group);
			System.out.println("Model & Veiw : " + mv);
			
			if(joinStatus >= 1) {
				SGDetail joinGrTop = gs.selectOneJoinGrDetailTop(grCode, memCode);
				mv.addObject("join", joinGrTop);
			}

			mv.setViewName("studyGroupDetail/groupDetailPage");
						
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("나는조빈 ");
			//예외처리 클래스 생성하기
		}
		 
		return mv;
	}
	
	@RequestMapping(value="insertGroupJoin.sgd")
	public @ResponseBody int insertGroupJoin(@RequestParam int grCode, @RequestParam int memCode, HttpServletResponse response){
		
//		test 지우기
		memCode = 4;
		
		int groupJoin = -1;
		
		try {
			int joinAbleCnt = gs.selectJoinAbleChk(grCode);
			
			if(joinAbleCnt >= 1) {	//최대 가능 인원 - 현재 인원이 1보다 크면 가입 가능
				groupJoin = gs.insertGroupJoin(grCode, memCode);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return groupJoin;
	}
	
	/*@RequestMapping(value="selectGroupMemberList.sgd", method=RequestMethod.POST)
	public ModelAndView selectGroupMemberList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		
		
		return mv;
	}
	*/
	@RequestMapping("selectGroupMemberList.sgd")
	public ModelAndView selectGroupMemberList(int grCode, ModelAndView mv) {
		System.out.println("1. " + grCode);
		List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
		
		System.out.println("쿼리 실행 결과-컨트롤러 : < " +  memberList + " >");
		mv.addObject("grMemList", memberList);
		mv.setViewName("jsonView");
		System.out.println("MV : < " + mv + " >");
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
