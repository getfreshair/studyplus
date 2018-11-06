package always.awake.studyplus.studyPlanner.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface StudyPlannerDao {

	//일간 공부량 차트
	List<HashMap<String, Object>> todayChart(SqlSessionTemplate sqlSession, List<HashMap<String, Object>> list);
	
	//주간 공부량 차트
	List<HashMap<String, Object>> weeklyChart(SqlSessionTemplate sqlSession, List<HashMap<String, Object>> list);

	//월간 공부량 차트
	List<HashMap<String, Object>> monthlyChart(SqlSessionTemplate sqlSession, List<HashMap<String, Object>> list);

	//오늘의 목표 리스트
	List<Map<String, Object>> selectTodayGoals(SqlSessionTemplate sqlSession, Map<String, Object> hmap);


}
