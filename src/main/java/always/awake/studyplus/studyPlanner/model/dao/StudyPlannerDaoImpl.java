package always.awake.studyplus.studyPlanner.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyPlannerDaoImpl implements StudyPlannerDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//일간 공부량 차트
	@Override
	public HashMap<String, Object> todayChart(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("StudyTime.selectTodayChart", hmap);
	}

}
