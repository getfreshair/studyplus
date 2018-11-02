package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.studyPlanner.model.service.StudyPlannerService;

@SessionAttributes("loginUser")
@Controller
public class StudyPlannerController {
	@Autowired StudyPlannerService sps;
	
	@RequestMapping(value="studyPlannerMainPage.sp")
	public String studyPlannerMainPage() {
		return "studyPlanner/studyPlanner";
	}
	
	//일간 공부량 차트
	@RequestMapping(value="studyPlannerTodayChart.sp")
	public void duplicationCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//파라미터값 받음
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
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
		studyTime = studyTime.substring(0,studyTime.length() -1);
		
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

		//날짜 특수문자 변경
		String chartDate2 = chartDate.replaceAll("-", "/");
		String[] chartDate3 = chartDate2.split(" ~ ");
		
		String[] chartDate4 = new String[2];
		for(int i = 0; i <chartDate3.length; i++) {
			chartDate3[i] = chartDate3[i].substring(2, 10);
			chartDate4[i] = chartDate3[i].substring(6, 8);
		}
		//System.out.println("1날짜" + chartDate4[0]);
		//System.out.println("2날짜" + chartDate4[1]);
		//HashMap
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDateYear", chartDate3);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);
	
		List<HashMap<String, Object>> resultList = sps.selectWeeklyChart(list);
		
		
		//System.out.println("데이터 가져옴 : " + resultList);
		
		//날짜만 추출해서
		//가져온 날짜를 arr[7]에 순서대로 더하면서 넣는다.
		/*String[] resultTime = new String[7];
		for(int i = 0; i < 6; i++) {
			for(int j = 0; j < resultList.size(); j++) {
				if(resultTime[i] == resultList.get(j).get("STUDYTIME_DATE").toString().substring(8, 10)) {
					resultTime[i] += resultList.get(j).get("STUDYTIME_STUDYTIME").toString();
				}
			}
			System.out.println("resultTime : " + resultTime[i]);
		}*/
		
		
		try {
			response.getWriter().print("dfsdf");
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

}
