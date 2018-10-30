package always.awake.studyplus.studyPlanner.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

public interface StudyPlannerDao {

	//일간 공부량 차트
	HashMap<String, Object> todayChart(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

}
