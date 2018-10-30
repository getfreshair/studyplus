package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.studyPlanner.model.service.StudyPlannerService;
import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

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
		
		/*Member loginUser = (Member) session.getAttribute("loginUser");
		int loginUserCode = loginUser.getMember_Code();
		
		String chartDate = request.getParameter("dateVal");
		
		System.out.println("로그인 유저코드" + loginUserCode);
		System.out.println("컨트롤러 날짜 조회 : " + chartDate);
		
		
		//StudyTime st = sps.todayChart(chartDate);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("loginUserCode", loginUserCode);
		hmap.put("chartDate", chartDate);
		
		HashMap<String, Object> todayChart = sps.selectTodayChart(hmap);*/

		try {
			response.getWriter().print("fdsfs");
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
}
