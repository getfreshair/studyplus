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
import always.awake.studyplus.studyPlanner.model.vo.PersonalRank;
import always.awake.studyplus.studyPlanner.model.vo.StudyStyle;

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

	//오늘의 목표 업데이트(페이지 단위)
	@Override
	public int insertTodayBookGoal(Map<String, Object> hmap) {

		int result = spd.insertTodayBookGoal(hmap);
		
		return result;
	}

	//오늘의 목표 업데이트(페이지 단위)
	@Override
	public int updateTodayBookGoal(Map<String, Object> hmap) {
		
		int result = spd.updateTodayBookGoal(hmap);
		
		return result;
	}

	//주간 목표 등록(시간 단위)
	@Override
	public int insertWeeklyTimeGoal(Map<String, Object> hmap) {
		
		int result = spd.insertWeeklyTimeGoal(hmap);
		
		return result;
	}

	//주간 목표 업데이트(시간 단위)
	/*@Override
	public int updateWeeklyTimeGoal(Map<String, Object> hmap) {
		
		int result = spd.updateWeeklyTimeGoal(hmap);
		
		return result;
	}*/

	//주간 목표 등록(페이지 단위)
	@Override
	public int insertWeeklyBookGoal(Map<String, Object> hmap) {
		
		int result = spd.insertWeeklyBookGoal(hmap);
		
		return result;
	}

	//주간 목표 업데이트(페이지 단위)
	/*@Override
	public int updateWeeklyBookGoal(Map<String, Object> hmap) {
		
		int result = spd.updateWeeklyBookGoal(hmap);
		
		return result;
	}*/
	
	//주간 목표 업데이트 시 기존 목표 삭제
	@Override
	public int deleteWeeklyGoal(Map<String, Object> hmap) {
		
		int result = spd.deleteWeeklyGoal(hmap);
		
		return result;
	}

	@Override
	public ArrayList<PersonalRank> selectMemberWeeklyRank(int member_Code, String[] chartDate4) {
	
		ArrayList<PersonalRank> rankList = spd.selectMemberWeeklyRank(member_Code, chartDate4);
		
		return rankList;
	}

	@Override
	public ArrayList<PersonalRank> selectMemberWeeklyRank2(int member_Code, String[] chartDate4) {

		ArrayList<PersonalRank> rankList = spd.selectMemberWeeklyRank2(member_Code, chartDate4);
		
		return rankList;
	}
	//주간 목표 리스트
	@Override
	public List<Map<String, Object>> selectWeeklyGoals(Map<String, Object> hmap) throws plannerException {
		
		List<Map<String, Object>> weeklyGoals = spd.selectWeeklyGoals(sqlSession, hmap);
		
		return weeklyGoals;

	}

	@Override
	public Double selectJobWeeklyRankPercent(int member_Code, String[] chartDate4) {
		
		Double rankPercent = spd.selectJobWeeklyRankPercent(sqlSession, member_Code, chartDate4);
		return rankPercent;
	}

	@Override
	public Double selectLocationWeeklyRankPercent(int member_Code, String[] chartDate4) {
		
		Double rankPercent = spd.selectLocationWeeklyRankPercent(sqlSession, member_Code, chartDate4);
		return rankPercent;
	}

	//학습스타일 결과 등록
	@Override
	public int insertStudyStyle(Map<String, Object> hmap) {
		
		int result = spd.insertStudyStyle(hmap);
		
		return result;
	}

	//학습스타일 결과 선택
	@Override
	public List<Object> selectStudyStyle(int loginUserCode) {
		
		List<Object> list = spd.selectStudyStyle(loginUserCode);
		
		return list;
	}

	



}
