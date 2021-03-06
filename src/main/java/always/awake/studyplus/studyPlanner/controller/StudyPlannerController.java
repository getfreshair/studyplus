package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.block.controller.blockController;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.studyPlanner.model.exception.plannerException;
import always.awake.studyplus.studyPlanner.model.service.StudyPlannerService;
import always.awake.studyplus.studyPlanner.model.vo.Goal;
import always.awake.studyplus.studyPlanner.model.vo.PersonalRank;
import always.awake.studyplus.studyPlanner.model.vo.StudyStyle;

@SessionAttributes("loginUser")
@Controller
public class StudyPlannerController {
	@Autowired StudyPlannerService sps;
	
	//스터디 플래너 페이지 이동
	@RequestMapping(value="studyPlannerMainPage.sp")
	public String studyPlannerMainPage( Model model) {
		
		StringBuilder scheduleData = new blockController().getScheduleData();

		model.addAttribute("scheduleData", scheduleData.toString());
		return "studyPlanner/studyPlanner";
	}
	
	//일간 공부량 차트
	@RequestMapping(value="studyPlannerTodayChart.sp")
	public void duplicationCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		//System.out.println("일간날짜 이상하다 : " + chartDate);
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");

		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDate", chartDate2);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);

		List<HashMap<String, Object>> resultList = sps.selectTodayChart(list);
		
		//공부시간 문자열로 만들어서 전달
		String studyTime = "";
		label :
		for(int i = 0; i < 24; i++) {
			
			for(int j = 0; j < resultList.size(); j++) {
				if(i == Integer.parseInt(resultList.get(j).get("STUDYTIME_TIMEZONE").toString())) {
					studyTime += resultList.get(j).get("STUDYTIME_STUDYTIME").toString() + "," ;
					resultList.remove(j);
					continue label;
				}
			}
			studyTime +=  "0," ;
		}
		//studyTime = studyTime.substring(0,studyTime.length() -1);
		
		//System.out.println("일간공부량 데이터 : " + studyTime);
		try {
			response.getWriter().print(studyTime);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//주간 공부량 차트
	@RequestMapping(value="studyPlannerWeeklyChart.sp")
	public void weeklyChart(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");

		//System.out.println("주간 공부 값이 잘 들어와? : " + chartDate);
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		//월,일의 갯수를 도출해서 한자리 수 일경우 앞에 0을 붙여줌
		String[] firstDate = chartDate3[0].split("/");
		if(firstDate[1].length() == 1) {
			firstDate[1] = "0"+firstDate[1];
		}
		if(firstDate[2].length() == 1) {
			firstDate[2] = "0"+firstDate[2];
		}
		
		String[] lastDate = chartDate3[1].split("/");
		if(lastDate[1].length() == 1) {
			lastDate[1] = "0"+lastDate[1];
		}
		if(lastDate[2].length() == 1) {
			lastDate[2] = "0"+lastDate[2];
		}
		
		String firstDateResult = firstDate[0] + "/" + firstDate[1] + "/" + firstDate[2];
		String lastDateResult = lastDate[0] + "/" + lastDate[1] + "/" + lastDate[2];
		//DB에 넣을 최종 날짜
		String[] chartDate4 = new String[2];
		chartDate4[0] = firstDateResult.substring(2, 10);
		chartDate4[1] = lastDateResult.substring(2, 10);
		
		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDateYear", chartDate4);
		
		//System.out.println("chartDate4 : " +chartDate4[0]);
		//System.out.println("chartDate4 : " +chartDate4[1]);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);
	
		List<HashMap<String, Object>> resultList = sps.selectWeeklyChart(list);
		
		
		//System.out.println("데이터 가져옴 : " + resultList);

		// 기준날짜 캘린더 객체 생성
		Calendar cal = new GregorianCalendar(Integer.parseInt("20" + chartDate4[0].substring(0, chartDate4[0].indexOf("/"))),
											Integer.parseInt(chartDate4[0].substring(chartDate4[0].indexOf("/") + 1, chartDate4[0].lastIndexOf("/"))) - 1,
											Integer.parseInt(chartDate4[0].substring(chartDate4[0].lastIndexOf("/")+1)));
		
		// 주간 공부시간 초기화
		int times[] = new int[7];
		
		// 시간 정보 기록
		for (int i = 0; i < resultList.size(); i++) {
			String date = resultList.get(i).get("STUDYTIME_DATE").toString().substring(0,resultList.get(i).get("STUDYTIME_DATE").toString().indexOf(" "));
			int time = Integer.parseInt(resultList.get(i).get("SUM(STUDYTIME_STUDYTIME)").toString());
			Calendar temp = new GregorianCalendar(Integer.parseInt(date.substring(0, date.indexOf("-"))),
					Integer.parseInt(date.substring(date.indexOf("-") + 1, date.lastIndexOf("-"))) - 1,
					Integer.parseInt(date.substring(date.lastIndexOf("-")+1)));
			int div = (int)(((((temp.getTimeInMillis() - cal.getTimeInMillis())/1000)/60)/60)/24);
			switch(div) {
				case 0 : times[0] = time; break; 
				case 1 : times[1] = time; break; 
				case 2 : times[2] = time; break; 
				case 3 : times[3] = time; break; 
				case 4 : times[4] = time; break; 
				case 5 : times[5] = time; break; 
				case 6 : times[6] = time; break; 
			}
		}
		
		String studyTime = "";
		for (int i = 0; i < times.length; i++) {
			studyTime += times[i] + ",";
		}
		//System.out.println("week studyTime : " + studyTime);
		
		try {
			response.getWriter().print(studyTime);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
	
	//월간 공부량 차트
	@RequestMapping(value="studyPlannerMonthlyChart.sp")
	public void monthlyChart(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		String chartDateYear = chartDate.substring(2, 4);
		
		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDateYear", chartDateYear);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);

		List<HashMap<String, Object>> resultList = sps.selectMonthlyChart(list);
		
		int[] arr = new int[12]; // 0~11

		for(int i = 0; i < resultList.size(); i++) {
			String resultMonth = resultList.get(i).get("STUDYTIME_DATE").toString().substring(5,7);
			
			for(int j = 0; j < 12; j++) {
				if(j+1 == Integer.parseInt(resultMonth)) {
					arr[j] += Integer.parseInt(resultList.get(i).get("STUDYTIME_STUDYTIME").toString());
				}
				//System.out.println(j+1 + "월의 총량은 :" + arr[j]);
			}
		}
		
		String studyTime = "";
		for(int i = 0; i < arr.length; i++) {
			studyTime += arr[i] + ",";
		}
		
		try {
			response.getWriter().print(studyTime);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 주간 개인 지역  랭킹 차트 
	@RequestMapping(value="studyPlannerWeeklyRankChart.sp")
	public @ResponseBody ArrayList<PersonalRank> weeklyRankChart2(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		//월,일의 갯수를 도출해서 한자리 수 일경우 앞에 0을 붙여줌
		String[] firstDate = chartDate3[0].split("/");
		if(firstDate[1].length() == 1) {
			firstDate[1] = "0"+firstDate[1];
		}
		if(firstDate[2].length() == 1) {
			firstDate[2] = "0"+firstDate[2];
		}
		
		String[] lastDate = chartDate3[1].split("/");
		if(lastDate[1].length() == 1) {
			lastDate[1] = "0"+lastDate[1];
		}
		if(lastDate[2].length() == 1) {
			lastDate[2] = "0"+lastDate[2];
		}
		
		String firstDateResult = firstDate[0] + "/" + firstDate[1] + "/" + firstDate[2];
		String lastDateResult = lastDate[0] + "/" + lastDate[1] + "/" + lastDate[2];
		//DB에 넣을 최종 날짜
		String[] chartDate4 = new String[2];
		chartDate4[0] = firstDateResult.substring(2, 10);
		chartDate4[1] = lastDateResult.substring(2, 10);

		ArrayList<PersonalRank> rankList = sps.selectMemberWeeklyRank(member_Code, chartDate4);


		//System.out.println(chartDate4[0]);
		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUser);
		hmap.put("chartDateYear", chartDate4);

		
		return rankList;
	} 
	
	// 주간 개인 분야 랭킹 차트 
	@RequestMapping(value="studyPlannerWeeklyRankChart2.sp")
	public @ResponseBody ArrayList<PersonalRank> weeklyRankChart(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		//월,일의 갯수를 도출해서 한자리 수 일경우 앞에 0을 붙여줌
		String[] firstDate = chartDate3[0].split("/");
		if(firstDate[1].length() == 1) {
			firstDate[1] = "0"+firstDate[1];
		}
		if(firstDate[2].length() == 1) {
			firstDate[2] = "0"+firstDate[2];
		}
		
		String[] lastDate = chartDate3[1].split("/");
		if(lastDate[1].length() == 1) {
			lastDate[1] = "0"+lastDate[1];
		}
		if(lastDate[2].length() == 1) {
			lastDate[2] = "0"+lastDate[2];
		}
		
		String firstDateResult = firstDate[0] + "/" + firstDate[1] + "/" + firstDate[2];
		String lastDateResult = lastDate[0] + "/" + lastDate[1] + "/" + lastDate[2];
		//DB에 넣을 최종 날짜
		String[] chartDate4 = new String[2];
		chartDate4[0] = firstDateResult.substring(2, 10);
		chartDate4[1] = lastDateResult.substring(2, 10);
		
		ArrayList<PersonalRank> rankList = sps.selectMemberWeeklyRank2(member_Code, chartDate4);
		
		return rankList;
	} 
	
	// 개인 주간 종합 직업 랭킹 상위 % 
	@RequestMapping(value="selectJobWeeklyRankPercent.sp")
	public @ResponseBody Double selectJobWeeklyRankPercent(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		//월,일의 갯수를 도출해서 한자리 수 일경우 앞에 0을 붙여줌
		String[] firstDate = chartDate3[0].split("/");
		if(firstDate[1].length() == 1) {
			firstDate[1] = "0"+firstDate[1];
		}
		if(firstDate[2].length() == 1) {
			firstDate[2] = "0"+firstDate[2];
		}
		
		String[] lastDate = chartDate3[1].split("/");
		if(lastDate[1].length() == 1) {
			lastDate[1] = "0"+lastDate[1];
		}
		if(lastDate[2].length() == 1) {
			lastDate[2] = "0"+lastDate[2];
		}
		
		String firstDateResult = firstDate[0] + "/" + firstDate[1] + "/" + firstDate[2];
		String lastDateResult = lastDate[0] + "/" + lastDate[1] + "/" + lastDate[2];
		//DB에 넣을 최종 날짜
		String[] chartDate4 = new String[2];
		chartDate4[0] = firstDateResult.substring(2, 10);
		chartDate4[1] = lastDateResult.substring(2, 10);
		
		Double rankPercent = sps.selectJobWeeklyRankPercent(member_Code, chartDate4);
		
		return rankPercent;
	} 
	
	// 개인 주간 종합 지역 랭킹 상위 % 
	@RequestMapping(value="selectLocationWeeklyRankPercent.sp")
	public @ResponseBody Double selectLocationWeeklyRankPercent(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("컨트롤러 호출하냐");
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int member_Code = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		//월,일의 갯수를 도출해서 한자리 수 일경우 앞에 0을 붙여줌
		String[] firstDate = chartDate3[0].split("/");
		if(firstDate[1].length() == 1) {
			firstDate[1] = "0"+firstDate[1];
		}
		if(firstDate[2].length() == 1) {
			firstDate[2] = "0"+firstDate[2];
		}
		
		String[] lastDate = chartDate3[1].split("/");
		if(lastDate[1].length() == 1) {
			lastDate[1] = "0"+lastDate[1];
		}
		if(lastDate[2].length() == 1) {
			lastDate[2] = "0"+lastDate[2];
		}
		
		String firstDateResult = firstDate[0] + "/" + firstDate[1] + "/" + firstDate[2];
		String lastDateResult = lastDate[0] + "/" + lastDate[1] + "/" + lastDate[2];
		//DB에 넣을 최종 날짜
		String[] chartDate4 = new String[2];
		chartDate4[0] = firstDateResult.substring(2, 10);
		chartDate4[1] = lastDateResult.substring(2, 10);
		
		Double rankPercent = sps.selectLocationWeeklyRankPercent(member_Code, chartDate4);
		
		return rankPercent;
	} 
	
	//오늘 목표 리스트
	@RequestMapping(value="todayGoalsList.sp")
	public @ResponseBody List<Map<String, Object>> todayGoalsList(HttpSession session, @RequestParam String dateVal,  HttpServletResponse response) throws plannerException {
		//System.out.println("들어오니??" + dateVal);
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("checkDay", dateVal);
		
		List<Map<String, Object>> list;
		
		list = sps.selectTodayGoals(hmap);
		
		//System.out.println("list.get(0) : " +  list.get(0));

		return list;
	}
	
	//주간 목표 리스트
	@RequestMapping(value="weeklyGoalsList.sp")
	public @ResponseBody List<HashMap<String, ArrayList<Goal>>> weeklyGoalsList(HttpSession session, @RequestParam String dateVal, HttpServletResponse response) throws plannerException{
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("checkDay", dateVal);
		
		List<Map<String, Object>> list;
		
		list = sps.selectWeeklyGoals(hmap);
		
		HashMap<String, ArrayList<Goal>> weekMap = new HashMap<String, ArrayList<Goal>>();
		
		for(int i = 0; i < list.size(); i++) {
			String content = list.get(i).get("GOAL_CONTENT").toString();
			Goal temp = new Goal();
			temp.setGoalContent(content);
			temp.setGoalCode(Integer.parseInt(list.get(i).get("GOAL_CODE").toString()));
			temp.setGoalType(Integer.parseInt(list.get(i).get("GOAL_TYPE").toString()));
			temp.setDateString(list.get(i).get("GOAL_ENROLLDATE").toString());
			temp.setGoalAchieveAmount(Integer.parseInt(list.get(i).get("GOAL_ACHIEVEAMOUNT").toString()));
			temp.setGoalGoalAmount(Integer.parseInt(list.get(i).get("GOAL_GOALAMOUNT").toString()));
			temp.setWeek(list.get(i).get("WEEK").toString());
			temp.setGoalDivision(Integer.parseInt(list.get(i).get("GOAL_DIVISION").toString()));
			temp.setGoalISBN(list.get(i).get("GOAL_ISBN").toString());
			
			if(weekMap.get(content) != null) {
				weekMap.get(content).add(temp);
			}else {
				ArrayList<Goal> addList = new ArrayList<Goal>();
				addList.add(temp);
				weekMap.put(content, addList);
			}
		}
		
		List<HashMap<String, ArrayList<Goal>>> returnList = new ArrayList<HashMap<String, ArrayList<Goal>>>();
		returnList.add(weekMap);
		
		return returnList;
	}
	
	//오늘의 목표 등록(시간 단위)
	@RequestMapping(value="TodayTimeGoalAddModal.sp", method=RequestMethod.POST)
	public String insertTodayTimeGoal(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalTime")int goalTime, @RequestParam("goalMin")int goalMin) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		//시간 등록시 초단위로 변경
		int goalTotaltime = (goalTime * 3600) +  (goalMin * 60);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalTotaltime", goalTotaltime);
		
		int result = sps.insertTodayTimeGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 등록 성공!!");
			
		}else {
			System.out.println("목표 등록 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	//오늘의 목표 업데이트(시간 단위)
	@RequestMapping(value="TodayTimeGoalUpdateModal.sp", method=RequestMethod.POST)
	public String TodayTimeGoalUpdate(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalTime")int goalTime, @RequestParam("goalMin")int goalMin, @RequestParam("liIndex")int liIndex) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		//시간 등록시 초단위로 변경
		int goalTotaltime = (goalTime * 3600) + (goalMin * 60);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalTotaltime", goalTotaltime);
		hmap.put("liIndex", liIndex);
		
		int result = sps.updateTodayTimeGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 업데이트 성공!!");
			
		}else {
			System.out.println("목표 업데이트 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	
	//오늘의 목표 등록(페이지 단위)
	@RequestMapping(value="TodayBookGoalAddModal.sp", method=RequestMethod.POST)
	public String insertTodayBookGoal(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalPage")int goalPage, @RequestParam("bookIsbn")String bookIsbn) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		hmap.put("bookIsbn", bookIsbn);
		
		int result = sps.insertTodayBookGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 등록 성공!!");
			
		}else {
			System.out.println("목표 등록 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	//isbn 책 검색
	@RequestMapping(value="bookIsbn.sp", produces="text/plain;charset=utf-8")
	public @ResponseBody String bookIsbn(@RequestParam("searchBook")String searchBook) {

		return ISBNSearchBook.bookIsbn(searchBook);
	}
	
	//오늘의 목표 업데이트(페이지 단위)
	@RequestMapping(value="TodayBookGoalUpdateModal.sp", method=RequestMethod.POST)
	public String TodayBookGoalUpdate(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalPage")int goalPage, @RequestParam("goalAchiev")int goalAchiev, @RequestParam("liIndex")int liIndex, 
			@RequestParam("bookIsbn")String bookIsbn) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		hmap.put("goalAchiev", goalAchiev);
		hmap.put("liIndex", liIndex);
		hmap.put("bookIsbn", bookIsbn);
		
		int result = sps.updateTodayBookGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 업데이트 성공!!");
			
		}else {
			System.out.println("목표 업데이트 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	//주간 목표 등록(시간 단위)
	@RequestMapping(value="WeeklyTimeGoalAddModal.sp", method=RequestMethod.POST)
	public String insertWeeklyTimeGoal(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalTime")int goalTime, @RequestParam("goalMin")int goalMin, @RequestParam("checkWeek")String checkWeek) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String[] arr = checkWeek.split(",");
		String insertDay = "";
		int goalTotaltime = 0;
		int result = 0;
		
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
			insertDay = arr[i];
			
			//시간 등록시 초단위로 변경
			goalTotaltime = (goalTime * 3600) +  (goalMin * 60);
			
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalType", goalType);
			hmap.put("goalName", goalName);
			hmap.put("goalTotaltime", goalTotaltime);
			hmap.put("insertDay", insertDay);

			result = sps.insertWeeklyTimeGoal(hmap);
		}
		
		
		if(result > 0) {
			System.out.println("목표 등록 성공!!");
			
		}else {
			System.out.println("목표 등록 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	//주간 목표 업데이트(시간 단위)
	@RequestMapping(value="WeeklyTimeGoalUpdateModal.sp", method=RequestMethod.POST)
	public String WeeklyTimeGoalUpdate(HttpSession session, @RequestParam("checkWeek")String checkWeek, @RequestParam("goalType")int goalType, 
			@RequestParam("goalName")String goalName, @RequestParam("goalTime")int goalTime, @RequestParam("goalMin")int goalMin, 
			@RequestParam("liIndex")String liIndex) {
		

		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		
		String[] liIndexArr = liIndex.split(",");
		int goalCode = 0;
		int result = 0;
		//등록되어있는 목표코드 갯수만큼 반복하여, 목표 코드를 기준으로 행 삭제
		for(int i = 0; i < liIndexArr.length; i++) {
			goalCode = Integer.parseInt(liIndexArr[i]);

			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalCode", goalCode);

			result = sps.deleteWeeklyGoal(hmap);
		}

		
		String[] dateArr = checkWeek.split(",");
		String insertDay = "";
		int goalTotaltime = 0;
		//새로 체크한 날짜의 갯수만큼 반복하여, 새로운 주간 목표로 insert
		for(int i = 0; i < dateArr.length; i++) {
			//선택한 날짜
			insertDay = dateArr[i];
			
			//시간 등록시 초단위로 변경
			goalTotaltime = (goalTime * 3600) +  (goalMin * 60);
			
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalType", goalType);
			hmap.put("goalName", goalName);
			hmap.put("goalTotaltime", goalTotaltime);
			hmap.put("insertDay", insertDay);

			result = sps.insertWeeklyTimeGoal(hmap);
		}
		
		if(result > 0) {
			System.out.println("목표 업데이트 성공!!");
			
		}else {
			System.out.println("목표 업데이트 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}	
	
	//주간 목표 등록(페이지 단위)
	@RequestMapping(value="WeeklyBookGoalAddModal.sp", method=RequestMethod.POST)
	public String insertWeeklyBookGoal(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalPage")int goalPage, @RequestParam("checkWeek")String checkWeek, @RequestParam("bookIsbn")String bookIsbn) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String[] arr = checkWeek.split(",");
		String insertDay = "";
		int result = 0;
		
		for(int i = 0; i < arr.length; i++) {
			
			insertDay = arr[i];
			
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalType", goalType);
			hmap.put("goalName", goalName);
			hmap.put("goalPage", goalPage);
			hmap.put("insertDay", insertDay);
			hmap.put("bookIsbn", bookIsbn);
			
			result = sps.insertWeeklyBookGoal(hmap);
		}
		
		if(result > 0) {
			System.out.println("목표 등록 성공!!");
			
		}else {
			System.out.println("목표 등록 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	

	//주간 목표 업데이트(페이지 단위)
	@RequestMapping(value="WeeklyBookGoalUpdateModal.sp", method=RequestMethod.POST)
	public String WeeklyBookGoalUpdate(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalPage")int goalPage, @RequestParam("liIndex")String liIndex,
			 @RequestParam("bookIsbn")String bookIsbn, @RequestParam("checkWeek")String checkWeek) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();

		String[] liIndexArr = liIndex.split(",");
		int goalCode = 0;
		int result = 0;
		//등록되어있는 목표코드 갯수만큼 반복하여, 목표 코드를 기준으로 행 삭제
		for(int i = 0; i < liIndexArr.length; i++) {
			goalCode = Integer.parseInt(liIndexArr[i]);

			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalCode", goalCode);

			result = sps.deleteWeeklyGoal(hmap);
		}

		
		String[] dateArr = checkWeek.split(",");
		String insertDay = "";
		//새로 체크한 날짜의 갯수만큼 반복하여, 새로운 주간 목표로 insert
		for(int i = 0; i < dateArr.length; i++) {
			//선택한 날짜들
			insertDay = dateArr[i];
			
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("loginUserCode", loginUserCode);
			hmap.put("goalType", goalType);
			hmap.put("goalName", goalName);
			hmap.put("goalPage", goalPage);
			hmap.put("bookIsbn", bookIsbn);
			hmap.put("insertDay", insertDay);

			result = sps.insertWeeklyBookGoal(hmap);
		}
		
		if(result > 0) {
			System.out.println("목표 업데이트 성공!!");
			
		}else {
			System.out.println("목표 업데이트 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	//학습스타일 페이지 이동
	@RequestMapping(value="studyStyleView.sp")
	public String studyStyleView() {
		return "studyPlanner/studyStyle";
	}
	
	//학습스타일 결과 등록
	@RequestMapping(value="studyStyleResult.sp")
	public String insertStudyStyleResult(HttpSession session, @RequestParam("sumArr")String sumResult) {
		//System.out.println("학습스타일 들어옴?");
		//System.out.println(sumResult);
		
		String[] sumArr = sumResult.split(",");

		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("activity", sumArr[0]);
		hmap.put("deliberate", sumArr[1]);
		hmap.put("sensibility", sumArr[2]);
		hmap.put("intuitive", sumArr[3]);
		hmap.put("perspective", sumArr[4]);
		hmap.put("language", sumArr[5]);
		hmap.put("sequential", sumArr[6]);
		hmap.put("whole", sumArr[7]);
		
		int result = sps.insertStudyStyle(hmap);
		
		if(result > 0) {
			System.out.println("학습스타일 등록 성공!!");
			
		}else {
			System.out.println("학습스타일 등록 실패!");
		}
		
		return "studyPlanner/studyStyle";
	}
	
	//학습스타일 결과 선택
	@RequestMapping(value="studyStyleChart.sp")
	public @ResponseBody List<Object> selectStudyStyle(HttpSession session, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		List<Object> list = sps.selectStudyStyle(loginUserCode);
		//System.out.println(list);
		
		if(list.size() == 0 || list.isEmpty()) {
			//System.out.println("학습스타일 데이터 없음");
			return Collections.EMPTY_LIST;
		}
		
		return list;
	}
	
}
