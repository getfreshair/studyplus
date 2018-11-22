package always.awake.studyplus.sgDetail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.sgDetail.model.service.SGDetailService;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Controller
public class SGDetailController {
	@Autowired
	private SGDetailService gs;
	
	@RequestMapping(value="selectOneGroup.sgd")
	public @ResponseBody ModelAndView selectOneGroup(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		int grCode = Integer.parseInt(request.getParameter("group_No"));
			
		int memCode = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_Code();
//		
//		//		test 지우기
//		memCode = 5;	
//		
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

			System.out.println("\n select GrTop GroupInfo MV : \n < " + mv + " >");
			
			if(joinStatus >= 1) {
				SGDetail joinGrTop = gs.selectOneJoinGrDetailTop(grCode, memCode);
				mv.addObject("join", joinGrTop);
				
				System.out.println("\n select GrTop MyInfo MV : \n < " + mv + " >");
			}

			mv.setViewName("studyGroupDetail/groupDetailPage");
						
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("나는조빈 ");
			//예외처리 클래스 생성하기
		}
		
		System.out.println("\n select Top GroupInfo MV : \n < " + mv + " >");
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
		
		try {
			List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
			
			mv.addObject("grMemList", memberList);
			mv.addObject("loginUserCode", loginUserCode);
			
			mv.setViewName("studyGroupDetail/bottomLeftInclude/grMemberList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("\n left Member List MV : \n < " + mv + " >");
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
			mv.setViewName("studyGroupDetail/bottomLeftInclude/grMemberList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("\n left GrLeader Chang After MV : \n < " + mv + " >");
		return mv;
	}
	
	@RequestMapping(value="updateDeleteGroupMember.sgd")
	public ModelAndView updateDeleteGroupMember(@RequestParam int grCode, @RequestParam int delMemCode, @RequestParam int loginUserCode, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		int result = -1;
		
		//만약 로그인유저와 지울 멤버 코드가 일치하면 자진 탈퇴
		//일치하지 않는다면 방장 강퇴
		
		try {			
			result = gs.updateDeleteGroupMember(grCode, delMemCode);
			if(result >= 1) {
				List<HashMap<String, Object>> memberList = gs.selectGroupMemberList(grCode);
				mv.addObject("grMemList", memberList);
				mv.addObject("loginUserCode", loginUserCode);
			}			
			mv.addObject("result", result);
			if(delMemCode != loginUserCode) {
				mv.setViewName("studyGroupDetail/bottomLeftInclude/grMemberList");
			} else if(delMemCode == loginUserCode) {
				mv.setViewName("studyGroupDetail/bottomLeftInclude/grMemberList");
			}
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
			if(periodType <= 2) {	//**중요 periodType 매개 변수로 넘겨서 타입별(기간단위 별) 동적 쿼리로 변경하기
				selectChangeDates = gs.selectChangeDatesInfo(changeDates);
			}else if(periodType > 2) {
				selectChangeDates = gs.selectChangeMonthsInfo(changeMonths);
			}
			
			System.out.println(selectChangeDates);
					
			mv.addObject("selectDate", selectChangeDates);
			mv.setViewName("jsonView");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("\n selectDateByPeriod MV : \n< " + mv + " >");
		return mv;
	}
	
	@RequestMapping("selectGroupMemberRankList.sgd")
	public ModelAndView selectGroupMemberRankList(@RequestParam int grCode, @RequestParam String thisDay,
																@RequestParam int periodType, ModelAndView mv) {
		try {
			
			System.out.println("2번 메뉴 페이지 여는 컨트롤러 왔어");
			System.out.println(periodType + " / " + grCode + " / " + thisDay );
			
			List<HashMap<String, Object>> list = gs.selectGroupMemberRankList(grCode, thisDay, periodType);
			
			System.out.println("2번 페이지 쿼리 실행 결과 : \n< " +  list + " >");
			mv.addObject("list", list);
			
			mv.setViewName("studyGroupDetail/bottomLeftInclude/rankOfStudyTime");
			System.out.println("left RankList Menu MV : < " + mv + " >");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("selectGroupMemberTimeList.sgd")
	public ModelAndView selectGroupMemberTimeList(@RequestParam int grCode, @RequestParam String thisDay, ModelAndView mv) {
		try {
			
			System.out.println("3번 메뉴 페이지 여는 컨트롤러 왔어");
			
			List<HashMap<String, Object>> list = gs.selectGroupMemberTimeList(grCode, thisDay);
			
			System.out.println("3번 페이지 쿼리 실행 결과 : \n< " +  list + " >");
			mv.addObject("list", list);
			
			mv.setViewName("studyGroupDetail/bottomLeftInclude/weeklyStudyTimeTotal");
			System.out.println("MV : < " + mv + " >");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("selectGroupBoardList.sgd")
	public ModelAndView selectGroupBoardList(@RequestParam int grCode, @RequestParam int loginUserCode, ModelAndView mv) {
		try {
			List<HashMap<String, Object>> list = gs.selectGroupBoardList(grCode, loginUserCode);

			mv.addObject("grCode", grCode);
			mv.addObject("boardList", list);
			mv.setViewName("studyGroupDetail/bottomCenterInclude/grBoardList");
		}catch (Exception e){
			e.printStackTrace();
		}
		
		System.out.println("\n select BoardList MV : \n< " + mv + " >");
		return mv;
	}
	
	@RequestMapping("selectOneBoardDetailShow.sgd")
	public ModelAndView selectOneBoardDetailShow(@RequestParam int grCode, @RequestParam int boardCode, ModelAndView mv) {
	      
	 try {
	    
	           List<HashMap<String, Object>> list = gs.selectOneBoardDetailShow(grCode, boardCode);
	         
	         mv.addObject("selectBoardList", list);
	         
	         mv.setViewName("studyGroupDetail/bottomCenterInclude/oneBoardDetail");
	         System.out.println("OneBoardDetail MV : < " + mv + " >");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return mv;
	   }
	
	@RequestMapping(value="goBoardWriteModalPage.sgd")
	public @ResponseBody ModelAndView goBoardWriteModalPage(@RequestParam int grCode, @RequestParam int grLeaderCode, HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		try {
			int loginUserCode = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_Code();

			Files files_name = ((Member)(request.getSession().getAttribute("loginUser"))).getMember_Files();
			String loginUserImg = files_name.getFiles_Name();
			
			mv.addObject("grCode", grCode);
			mv.addObject("grLeaderCode", grLeaderCode);
			mv.addObject("loginUserImg", loginUserImg);
			mv.addObject("loginUserCode", loginUserCode);
			
			System.out.println(mv.toString());
			mv.setViewName("studyGroupDetail/bottomCenterInclude/boardWrite");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("\n goBoardWriteModalPage MV : \n< " + mv + " >");
		return mv;
	}
	
	@RequestMapping(value="insertGroupBoardWrite.sgd", method=RequestMethod.GET)
	public @ResponseBody int insertGroupBoardWrite(@RequestParam int grCode, @RequestParam String contents,
													@RequestParam int loginUserCode){
		int result = -1;
		
		System.out.println("보드 입력하는 컨트롤러");
		System.out.println(grCode + " / " + contents);
		
		try {
			result = gs.insertGroupBoardWrite(grCode, contents, loginUserCode, 1);
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	   @RequestMapping(value="selectBoardReply.sgd")
	   public @ResponseBody List<HashMap<String, Object>>selectBoardReply( @RequestParam int boardCode, ModelAndView mv) {

	     List<HashMap<String, Object>> list = gs.selectBoardReply(boardCode);
	 
	      return list;
	   }

	   @RequestMapping(value="selectBoardTopInfo.sgd")
	   public @ResponseBody HashMap<String, Object>selectBoardTopInfo( @RequestParam int boardCode, @RequestParam int grCode, HttpSession session, HttpServletRequest request, HttpServletResponse response) {


	     Member loginUser = (Member) session.getAttribute("loginUser");
	     int loginUserCode = loginUser.getMember_Code();
	      HashMap<String, Object> hmap = gs.selectBoardTopInfo(boardCode, grCode, loginUserCode);
	 
	      return hmap;
	   }
	   
	   
	   @RequestMapping(value="insertReply.sgd")
	   public @ResponseBody int insertReply( @RequestParam int boardCode, @RequestParam String replyContent, HttpSession session, HttpServletRequest request, HttpServletResponse response) {


	     Member loginUser = (Member) session.getAttribute("loginUser");
	     int loginUserCode = loginUser.getMember_Code();
	     
	     return gs.insertReply(boardCode, replyContent, loginUserCode);
	   }
	
}
