package always.awake.studyplus.studyPlanner.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.studyPlanner.model.exception.plannerException;
import always.awake.studyplus.studyPlanner.model.vo.PersonalRank;
import always.awake.studyplus.studyPlanner.model.vo.StudyStyle;

public interface StudyPlannerService {

	//일간 공부량 차트
	List<HashMap<String, Object>> selectTodayChart(List<HashMap<String, Object>> list);
	
	//주간 공부량 차트
	List<HashMap<String, Object>> selectWeeklyChart(List<HashMap<String, Object>> list);

	//월간 공부량 차트
	List<HashMap<String, Object>> selectMonthlyChart(List<HashMap<String, Object>> list);

	//오늘의 목표 리스트
	List<Map<String, Object>> selectTodayGoals(Map<String, Object> hmap) throws plannerException;

	//오늘의 목표 등록(시간 단위)
	int insertTodayTimeGoal(Map<String, Object> hmap);

	//오늘의 목표 업데이트(시간 단위)
	int updateTodayTimeGoal(Map<String, Object> hmap);

	//오늘의 목표 등록(페이지 단위)
	int insertTodayBookGoal(Map<String, Object> hmap);

	//오늘의 목표 업데이트(페이지 단위)
	int updateTodayBookGoal(Map<String, Object> hmap);
	
	//주간 목표 등록(시간 단위)
	int insertWeeklyTimeGoal(Map<String, Object> hmap);
	
	//주간 목표 업데이트(시간 단위)
	//int updateWeeklyTimeGoal(Map<String, Object> hmap);

	//주간 목표 등록(페이지 단위)
	int insertWeeklyBookGoal(Map<String, Object> hmap);

	//주간 목표 업데이트(페이지 단위)
	//int updateWeeklyBookGoal(Map<String, Object> hmap);

	//주간 목표 업데이트 시 기존 목표 삭제
	int deleteWeeklyGoal(Map<String, Object> hmap);

	ArrayList<PersonalRank> selectMemberWeeklyRank(int member_Code, String[] chartDate4);

	ArrayList<PersonalRank> selectMemberWeeklyRank2(int member_Code, String[] chartDate4);

	//주간 목표 리스트
	List<Map<String, Object>> selectWeeklyGoals(Map<String, Object> hmap) throws plannerException;

	Double selectJobWeeklyRankPercent(int member_Code, String[] chartDate4);

	Double selectLocationWeeklyRankPercent(int member_Code, String[] chartDate4);
	
	//학습스타일 결과 등록
	int insertStudyStyle(Map<String, Object> hmap);

	//학습스타일 결과 선택
	List<Object> selectStudyStyle(int loginUserCode);





}
