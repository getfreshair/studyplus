package always.awake.studyplus.studyPlanner.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.studyPlanner.model.dao.StudyPlannerDao;

@Service
public class StudyPlannerServiceImpl implements StudyPlannerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StudyPlannerDao spd;
	
	//일간 공부량 차트
	@Override
	public List<HashMap<String, Object>> selectTodayChart(List<HashMap<String, Object>> list) {
		
		List<HashMap<String, Object>> todayChart = spd.todayChart(sqlSession, list);

		return todayChart;
	}
	
	//주간 공부량 차트
	@Override
	public List<HashMap<String, Object>> selectWeeklyChart(List<HashMap<String, Object>> list) {

		List<HashMap<String, Object>> weeklyChart = spd.weeklyChart(sqlSession, list);

		return weeklyChart;
	}

	//월간 공부량 차트
	@Override
	public List<HashMap<String, Object>> selectMonthlyChart(List<HashMap<String, Object>> list) {
		
		List<HashMap<String, Object>> monthlyChart = spd.monthlyChart(sqlSession, list);

		return monthlyChart;
	}


}
