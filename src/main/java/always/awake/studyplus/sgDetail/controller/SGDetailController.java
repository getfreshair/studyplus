package always.awake.studyplus.sgDetail.controller;

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
		memCode = 5;	
		
		try {
			int joinStatus = gs.selectJoinStatus(grCode, memCode);
			
			SGDetail grLeftTop = gs.selectOneGrDetailLeftTop(grCode);
			SGDetail grRightTop = gs.selectOneGrDetailRightTop(grCode);
			
			System.out.println("group : " + grLeftTop);
			System.out.println("group : " + grRightTop);
			
			mv.addObject("loginUser", memCode);
			mv.addObject("joinStatus", joinStatus);
			mv.addObject("gr", grLeftTop);
			mv.addObject("grR", grRightTop);

			System.out.println("컨트롤러");
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
		int result = -1;
		
		try {
			int joinAbleCnt = gs.selectJoinAbleChk(grCode);
			
			if(joinAbleCnt >= 1) {	//최대 가능 인원 - 현재 인원이 1보다 크면 가입 가능
				result = gs.insertGroupJoin(grCode, memCode);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("selectGroupMemberList.sgd")
	public ModelAndView selectGroupMemberList(int grCode, int loginUserCode, ModelAndView mv) {
		System.out.println("1. " + grCode);
		System.out.println("1. " + loginUserCode);
		
		try {
			List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
			
			System.out.println("쿼리 실행 결과-컨트롤러 : < " +  memberList + " >");
			mv.addObject("grMemList", memberList);
			mv.addObject("loginUserCode", loginUserCode);
			
			mv.setViewName("studyGroupDetail/leftGroupListArea");
			System.out.println("MV : < " + mv + " >");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;		
	}

	@RequestMapping(value="updateChangeGroupLeader.sgd")
	public ModelAndView updateChangeGroupLeader(@RequestParam int grCode, @RequestParam int afterLeaderCode,
												  	@RequestParam int nowLeaderCode, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		int result = -1;
		
		try {			
			result = gs.updateChangeLeader(grCode, afterLeaderCode, nowLeaderCode);
			
			if(result >= 1) {
				List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
				mv.addObject("grMemList", memberList);
				mv.addObject("loginUserCode", nowLeaderCode);
			}			
			mv.addObject("result", result);
			mv.setViewName("studyGroupDetail/leftGroupListArea");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="updateDeleteGroupMember.sgd")
	public ModelAndView updateDeleteGroupMember(@RequestParam int grCode, @RequestParam int delMemCode, @RequestParam int loginUserCode, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		int result = -1;
		
		try {			
			result = gs.updateDeleteGroupMember(grCode, delMemCode);
			
			if(result >= 1) {
				List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
				mv.addObject("grMemList", memberList);
				mv.addObject("loginUserCode", loginUserCode);
			}			
			mv.addObject("result", result);
			mv.setViewName("studyGroupDetail/leftGroupListArea");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="selectDateByPeriod.sgd")
	public ModelAndView selectDateByPeriod(@RequestParam int dayPick, @RequestParam int monthPick,
													@RequestParam int changeDates, @RequestParam int changeMonths, ModelAndView mv){
		
		System.out.println("changeDates : " + dayPick + " / " + changeDates);
		System.out.println("changeMonths : " + monthPick + " / " + changeMonths);
		
		HashMap<String, Object> selectChangeDates = null;
		
		try {
			if(dayPick >= 1 && monthPick == 0) {
				selectChangeDates = gs.selectChangeDatesInfo(changeDates);
			}else if(monthPick >= 1 && dayPick == 0) {
				selectChangeDates = gs.selectChangeMonthsInfo(changeMonths);
			}
			
			System.out.println(selectChangeDates);
					
			mv.addObject("selectDate", selectChangeDates);
			mv.setViewName("jsonView");
//			mv.setViewName("studyGroupDetail/groupDetailPage");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mv : " + mv);
		
		return mv;
	}
	
	/*	@RequestMapping("selectGrMemRankPage.sgd")
	public ModelAndView selectGrMemRankPage(@RequestParam int grCode, @RequestParam String thisDay,
												@RequestParam int dayPick, @RequestParam int monthPick, ModelAndView mv) {
		try {
			System.out.println("페이지 여는 컨트롤러 왔어");
			System.out.println(grCode + " / " + thisDay + " / " + dayPick + " / " + monthPick);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mv.setViewName("studyGroupDetail/leftGroupStudyTimeRank");
		return mv;
	}*/
	
	
}
