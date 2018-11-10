package always.awake.studyplus.studyPlanner.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import always.awake.studyplus.studyPlanner.model.exception.plannerException;

@Repository
public class StudyPlannerDaoImpl implements StudyPlannerDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//일간 공부량 차트
	@Override
	public List<HashMap<String, Object>> todayChart(SqlSessionTemplate sqlSession,
			List<HashMap<String, Object>> list) {
		
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, Object> hamp = list.get(0);
		
		resultList = sqlSession.selectList("StudyPlanner.selectTodayChart", hamp);
		
		return resultList;
	}
	
	//주간 공부량 차트
	@Override
	public List<HashMap<String, Object>> weeklyChart(SqlSessionTemplate sqlSession,
			List<HashMap<String, Object>> list) {

		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, Object> hamp = list.get(0);
		
		resultList = sqlSession.selectList("StudyPlanner.selectWeeklyChart", hamp);
		
		return resultList;
	}
	
	//월간 공부량 차트
	@Override
	public List<HashMap<String, Object>> monthlyChart(SqlSessionTemplate sqlSession,
			List<HashMap<String, Object>> list) {
		
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, Object> hamp = list.get(0);
		
		resultList = sqlSession.selectList("StudyPlanner.selectMonthlyChart", hamp);
		
		return resultList;
	}

	//오늘의 목표 리스트
	@Override
	public List<Map<String, Object>> selectTodayGoals(SqlSessionTemplate sqlSession, Map<String, Object> hmap) throws plannerException {

		List<Map<String, Object>> todayGoals = sqlSession.selectList("StudyPlanner.selectTodayGoals", hmap);
		
		if(todayGoals == null) {
			throw new plannerException("목표 데이터가 없습니다.");
		}
		
		return todayGoals;
	}

	//오늘의 목표 등록(시간 단위)
	@Override
	public int insertTodayTimeGoal(Map<String, Object> hmap) {

		return sqlSession.insert("StudyPlanner.insertTodayTimeGoal", hmap);
		
	}

	//오늘의 목표 업데이트(시간 단위)
	@Override
	public int updateTodayTimeGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateTodayTimeGoal", hmap);
		
	}

	//오늘의 목표 업데이트(페이지 단위)
	@Override
	public int insertTodayBookGoal(Map<String, Object> hmap) {

		return sqlSession.insert("StudyPlanner.insertTodayBookGoal", hmap);
	}

	//오늘의 목표 업데이트(페이지 단위)
	@Override
	public int updateTodayBookGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateTodayBookGoal", hmap);
	}

	//주간 목표 등록(시간 단위)
	@Override
	public int insertWeeklyTimeGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateWeeklyTimeGoal", hmap);
	}

	//주간 목표 업데이트(시간 단위)
	@Override
	public int updateWeeklyTimeGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateWeeklyTimeGoal", hmap);
	}

	//주간 목표 업데이트(페이지 단위)
	@Override
	public int insertWeeklyBookGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateWeeklyBookGoal", hmap);
	}

	//주간 목표 업데이트(페이지 단위)
	@Override
	public int updateWeeklyBookGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.updateWeeklyBookGoal", hmap);
	}


}
