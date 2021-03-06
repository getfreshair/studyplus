package always.awake.studyplus.studyPlanner.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import always.awake.studyplus.studyPlanner.model.exception.plannerException;
import always.awake.studyplus.studyPlanner.model.vo.PersonalRank;
import always.awake.studyplus.studyPlanner.model.vo.StudyStyle;

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
		//System.out.println("dao select : " + todayGoals);
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
		
		return sqlSession.update("StudyPlanner.insertWeeklyTimeGoal", hmap);
	}

	//주간 목표 업데이트(시간 단위)
	/*@Override
	public int updateWeeklyTimeGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.insertWeeklyTimeGoal", hmap);
	}*/

	//주간 목표 등록(페이지 단위)
	@Override
	public int insertWeeklyBookGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.insertWeeklyBookGoal", hmap);
	}

	//주간 목표 업데이트(페이지 단위)
	/*@Override
	public int updateWeeklyBookGoal(Map<String, Object> hmap) {
		
		return sqlSession.update("StudyPlanner.insertWeeklyBookGoal", hmap);
	}*/
	
	//주간 목표 업데이트 시 기존 목표 삭제
	@Override
	public int deleteWeeklyGoal(Map<String, Object> hmap) {

		return sqlSession.delete("StudyPlanner.deleteWeeklyGoal", hmap);
	}
	
	//주간 목표 리스트
	@Override
	public List<Map<String, Object>> selectWeeklyGoals(SqlSessionTemplate sqlSession, Map<String, Object> hmap) throws plannerException {

		List<Map<String, Object>> weeklyGoals = sqlSession.selectList("StudyPlanner.selectWeeklyGoals", hmap);
		
		if(weeklyGoals == null) {

			throw new plannerException("목표 데이터가 없습니다.");
		}
		
		return weeklyGoals;
	}

	@Override
	public ArrayList<PersonalRank> selectMemberWeeklyRank(int member_Code, String[] chartDate4) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("start_Date", chartDate4[0]);
		hmap.put("end_Date", chartDate4[1]);
		
		List<PersonalRank> rankList = new ArrayList<PersonalRank>();
		rankList = sqlSession.selectList("StudyPlanner.selectMemberWeeklyRank", hmap);
		
		return (ArrayList<PersonalRank>) rankList;
	}

	@Override
	public ArrayList<PersonalRank> selectMemberWeeklyRank2(int member_Code, String[] chartDate4) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("start_Date", chartDate4[0]);
		hmap.put("end_Date", chartDate4[1]);
		
		List<PersonalRank> rankList = new ArrayList<PersonalRank>();
		rankList = sqlSession.selectList("StudyPlanner.selectMemberWeeklyRank2", hmap);
		
		return (ArrayList<PersonalRank>) rankList;
	}

	@Override
	public Double selectJobWeeklyRankPercent(SqlSessionTemplate sqlSession, int member_Code, String[] chartDate4) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("start_Date", chartDate4[0]);
		hmap.put("end_Date", chartDate4[1]);
		
		Double rankPercent = sqlSession.selectOne("StudyPlanner.selectJobWeeklyRankPercent", hmap);
		
		return rankPercent;
	}

	@Override
	public Double selectLocationWeeklyRankPercent(SqlSessionTemplate sqlSession, int member_Code, String[] chartDate4) {

		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("start_Date", chartDate4[0]);
		hmap.put("end_Date", chartDate4[1]);
		
		Double rankPercent = sqlSession.selectOne("StudyPlanner.selectLocationWeeklyRankPercent", hmap);
	
		return rankPercent;
	}

	//학습스타일 결과 등록
	@Override
	public int insertStudyStyle(Map<String, Object> hmap) {
		
		return sqlSession.insert("StudyPlanner.insertStudyStyle", hmap);
	}

	//학습스타일 결과 선택
	@Override
	public List<Object> selectStudyStyle(int loginUserCode) {
		
		List<Object> list = sqlSession.selectList("StudyPlanner.selectStudyStyle", loginUserCode);
		
		return list;
	}

	

}
