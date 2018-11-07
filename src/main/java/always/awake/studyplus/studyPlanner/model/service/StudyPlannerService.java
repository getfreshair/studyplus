package always.awake.studyplus.studyPlanner.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.studyPlanner.model.exception.plannerException;

public interface StudyPlannerService {

	//일간 공부량 차트
	List<HashMap<String, Object>> selectTodayChart(List<HashMap<String, Object>> list);
	
	//주간 공부량 차트
	List<HashMap<String, Object>> selectWeeklyChart(List<HashMap<String, Object>> list);

	//월간 공부량 차트
	List<HashMap<String, Object>> selectMonthlyChart(List<HashMap<String, Object>> list);

	//오늘의 목표 리스트
	List<Map<String, Object>> selectTodayGoals(Map<String, Object> hmap) throws plannerException;



}
