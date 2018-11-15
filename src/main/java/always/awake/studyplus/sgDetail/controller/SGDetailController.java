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
		
		//		test 吏?곌린
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

			System.out.println("而⑦듃濡ㅻ윭");
			System.out.println("Model & Veiw : " + mv);
			
			if(joinStatus >= 1) {
				SGDetail joinGrTop = gs.selectOneJoinGrDetailTop(grCode, memCode);
				mv.addObject("join", joinGrTop);
			}

			mv.setViewName("studyGroupDetail/groupDetailPage");
						
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("?섎뒗議곕퉰 ");
			//?덉쇅泥섎━ ?대옒???앹꽦?섍린
		}
		 
		return mv;
	}
	
	@RequestMapping(value="insertGroupJoin.sgd")
	public @ResponseBody int insertGroupJoin(@RequestParam int grCode, @RequestParam int memCode, HttpServletResponse response){
		int result = -1;
		
		try {
			int joinAbleCnt = gs.selectJoinAbleChk(grCode);
			
			if(joinAbleCnt >= 1) {	//理쒕? 媛???몄썝 - ?꾩옱 ?몄썝??1蹂대떎 ?щ㈃ 媛??媛??
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
			
			System.out.println("荑쇰━ ?ㅽ뻾 寃곌낵-而⑦듃濡ㅻ윭 : < " +  memberList + " >");
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
	public ModelAndView selectDateByPeriod(@RequestParam int periodType, @RequestParam int changeDates, @RequestParam int changeMonths, ModelAndView mv){
		
		System.out.println("changeDates : " + changeDates);
		System.out.println("changeMonths : " + changeMonths);
		System.out.println("periodType : " + periodType);
		
		HashMap<String, Object> selectChangeDates = null;
		
		try {
			if(periodType <= 2) {
				selectChangeDates = gs.selectChangeDatesInfo(changeDates);
			}else if(periodType > 2) {
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
	
		@RequestMapping("selectGroupMemberRankList.sgd")
	public ModelAndView selectGroupMemberRankList(@RequestParam int grCode, @RequestParam String thisDay,
												@RequestParam int periodType, ModelAndView mv) {
		try {
			
			System.out.println("?섏씠吏 ?щ뒗 而⑦듃濡ㅻ윭 ?붿뼱");
			System.out.println(periodType + " / " + grCode + " / " + thisDay );
			
			List<HashMap<String, Object>> list = gs.selectGroupMemberRankList(grCode, thisDay, periodType);
			
			System.out.println("荑쇰━ ?ㅽ뻾 寃곌낵-而⑦듃濡ㅻ윭 : < " +  list + " >");
			mv.addObject("list", list);
//			mv.addObject("loginUserCode", loginUserCode);
			
			mv.setViewName("studyGroupDetail/leftGroupStudyTimeRank");
			System.out.println("MV : < " + mv + " >");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
}
