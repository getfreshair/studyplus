package always.awake.studyplus.studyPlanner.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.studyPlanner.model.service.StudyPlannerService;
import always.awake.studyplus.studyPlanner.model.service.StudyPlannerServiceImpl;
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
	public void duplicationCheck(HttpServletResponse response, HttpServletRequest request) {
		System.out.println("들어왔냐1111");
		StudyTime st = new StudyTime();
		
		st = sps.todayChart();
		//client와의 스트림연결 
		//false라는 값을 리턴한다.-> 기본자료형으로하면 문자열로 바꿔서 리턴
		try {
			response.getWriter().print("fdsfs");
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
}
