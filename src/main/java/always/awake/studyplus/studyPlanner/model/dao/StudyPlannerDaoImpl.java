package always.awake.studyplus.studyPlanner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

@Repository
public class StudyPlannerDaoImpl implements StudyPlannerDao{

	//일간 공부량 차트
	@Override
	public StudyTime todayChart(SqlSessionTemplate sqlSession) {
//		StudyTime st = sqlSession.selectOne("StudyGroup.")
		return null;
	}

}
