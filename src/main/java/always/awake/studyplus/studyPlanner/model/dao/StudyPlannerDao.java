package always.awake.studyplus.studyPlanner.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface StudyPlannerDao {

	//일간 공부량 차트
	List<HashMap<String, Object>> todayChart(SqlSessionTemplate sqlSession, List<HashMap<String, Object>> list);

}
