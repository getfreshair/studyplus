package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
	
	// 주간 랭킹 차트 
	@RequestMapping(value="studyPlannerWeeklyRankChart.sp")
	public void weeklyRankChart(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
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
		
		//System.out.println(chartDate4[0]);
		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDateYear", chartDate4);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);
	} 
	
	//오늘의 목표 리스트
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
	public @ResponseBody List<Map<String, Object>> weeklyGoalsList(HttpSession session, @RequestParam String dateVal, HttpServletResponse response) throws plannerException{
		//System.out.println("들어는 오니??");
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("checkDay", dateVal);
		
		List<Map<String, Object>> list;
		
		list = sps.selectWeeklyGoals(hmap);
		
		return list;
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
			@RequestParam("goalPage")int goalPage) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		
		int result = sps.insertTodayBookGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 등록 성공!!");
			
		}else {
			System.out.println("목표 등록 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
	
	//오늘의 목표 업데이트(페이지 단위)
	@RequestMapping(value="TodayBookGoalUpdateModal.sp", method=RequestMethod.POST)
	public String TodayBookGoalUpdate(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
			@RequestParam("goalPage")int goalPage, @RequestParam("goalAchiev")int goalAchiev, @RequestParam("liIndex")int liIndex) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		hmap.put("goalAchiev", goalAchiev);
		hmap.put("liIndex", liIndex);
		
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
		
		/*Calendar cal = new GregorianCalendar();
	    String today = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH);
	    System.out.println("오늘날짜 : " + today);
	    System.out.println("오늘요일 : " + (cal.get(Calendar.DAY_OF_WEEK)));
	    
	    cal.add(Calendar.DATE, -1); //어제날짜
	    String yesterday = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH);
	    System.out.println("어제날짜: " + yesterday);
	    System.out.println("어제요일 : " + (cal.get(Calendar.DAY_OF_WEEK)));*/
	    
		
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

			//주간등록일경우 1또는 0 으로 타입 나눠서 넥스트발을 커런트발로 등록하도록함, 
			//주간 목표 등록시 동일한 목표 코드를 가지도록함
			if(i == 0) {
				hmap.put("insertNum", 0); //첫번째로 등록시 넥스트발 하기위함
			}else {
				hmap.put("insertNum", 1); //첫번째 이후 등록시 커런트발 하기위함
			}
			
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
	public String WeeklyTimeGoalUpdate(HttpSession session, @RequestParam("goalType")int goalType, @RequestParam("goalName")String goalName,
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
		
		int result = sps.updateWeeklyTimeGoal(hmap);
		
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
			@RequestParam("goalPage")int goalPage) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		
		int result = sps.insertWeeklyBookGoal(hmap);
		
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
			@RequestParam("goalPage")int goalPage, @RequestParam("goalAchiev")int goalAchiev, @RequestParam("liIndex")int liIndex) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("goalType", goalType);
		hmap.put("goalName", goalName);
		hmap.put("goalPage", goalPage);
		hmap.put("goalAchiev", goalAchiev);
		hmap.put("liIndex", liIndex);
		
		int result = sps.updateWeeklyBookGoal(hmap);
		
		if(result > 0) {
			System.out.println("목표 업데이트 성공!!");
			
		}else {
			System.out.println("목표 업데이트 실패!");
		}
		
		return "redirect:studyPlannerMainPage.sp";
	}
	
}
