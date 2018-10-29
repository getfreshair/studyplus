package always.awake.studyplus.studyPlanner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

public interface StudyPlannerDao {

	//일간 공부량 차트
	StudyTime todayChart(SqlSessionTemplate sqlSession);

}
