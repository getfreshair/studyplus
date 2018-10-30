package always.awake.studyplus.studyPlanner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

@Repository
public class StudyPlannerDaoImpl implements StudyPlannerDao{

	//일간 공부량 차트
	@Override
	public StudyTime todayChart(SqlSessionTemplate sqlSession) {
		System.out.println("dao 들어왔냐2222");
		
		StudyTime st = sqlSession.selectOne("StudyTime.selectTodayChart");

		System.out.println(st.getMemberCode());
		return st;
	}

}
