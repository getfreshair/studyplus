package always.awake.studyplus.studyPlanner.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		
		resultList = sqlSession.selectList("StudyTime.selectTodayChart", hamp);
		
		return resultList;
	}
	

}
