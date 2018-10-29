package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import always.awake.studyplus.studyPlanner.model.service.StudyPlannerService;
import always.awake.studyplus.studyPlanner.model.service.StudyPlannerServiceImpl;
import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

@Controller
public class StudyPlannerController {
	@RequestMapping(value="studyPlannerMainPage.sp")
	public String studyPlannerMainPage() {
		return "studyPlanner/studyPlanner";
	}
	
	/*@RequestMapping(value="studyPlannerTodayChart.sp")
	public void duplicationCheck(HttpServletResponse response) {
		StudyTime st = new StudyTime();
		StudyPlannerService sps = new StudyPlannerServiceImpl();
		
		st = sps.todayChart();
		//client와의 스트림연결 
		//false라는 값을 리턴한다.-> 기본자료형으로하면 문자열로 바꿔서 리턴
		try {
			response.getWriter().print(false);
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}*/
}
