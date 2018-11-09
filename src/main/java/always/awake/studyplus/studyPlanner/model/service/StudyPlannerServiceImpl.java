package always.awake.studyplus.studyPlanner.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.studyPlanner.model.dao.StudyPlannerDao;
import always.awake.studyplus.studyPlanner.model.exception.plannerException;

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

	//오늘의 목표 리스트
	@Override
	public List<Map<String, Object>> selectTodayGoals(Map<String, Object> hmap) throws plannerException {
		
		List<Map<String, Object>> todayGoals = spd.selectTodayGoals(sqlSession, hmap);
		
		return todayGoals;
	}

	//오늘의 목표 등록(시간 단위)
	@Override
	public int insertTodayTimeGoal(Map<String, Object> hmap) {

		int result = spd.insertTodayTimeGoal(hmap);
		
		return result;
	}

	//오늘의 목표 업데이트(시간 단위)
	@Override
	public int updateTodayTimeGoal(Map<String, Object> hmap) {
		
		int result = spd.updateTodayTimeGoal(hmap);
		
		return result;
	}


}
