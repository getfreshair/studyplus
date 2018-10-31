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
	
	@RequestMapping(value="studyPlannerTodayChart.sp")
	public void duplicationCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		//System.out.println("로그인 유저코드" + loginUserCode);
		//System.out.println("컨트롤러 날짜 조회 : " + chartDate);
			
		String chartDate2 = chartDate.replaceAll("-", "/");
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDate", chartDate2);
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list.add(hmap);

		List<HashMap<String, Object>> resultList = sps.selectTodayChart(list);
		
		/*int testest = 0;
		for(int i = 0; i < 24; i++) {
			if(Integer.parseInt((resultList.get(i).get("STUDYTIME_TIMEZONE").toString())) == i) {
				testest += (Integer.parseInt((resultList.get(i).get("STUDYTIME_STUDYTIME").toString()))/60) + "*";
			}else {
				testest += 0;
			}
			System.out.println(testest);
		}*/
		
		int timeArr[] = new int[24];
		for(int i = 0; i < 24; i++) {
			timeArr[i] = 0;
		}
		for(int i = 0; i < 24; i++) {
			for(int j = 0; j < resultList.size(); j++) {
				if(Integer.parseInt((resultList.get(j).get("STUDYTIME_TIMEZONE").toString())) == i) {
					timeArr[i] = Integer.parseInt((resultList.get(j).get("STUDYTIME_STUDYTIME").toString()))/60;
				}
			}

			//System.out.println(timeArr[i]);
		}
		
		
		try {
			response.getWriter().print(timeArr[0]);
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
}
