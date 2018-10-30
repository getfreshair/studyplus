package always.awake.studyplus.studyPlanner.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.studyPlanner.model.dao.StudyPlannerDao;
import always.awake.studyplus.studyPlanner.model.vo.StudyTime;

@Service
public class StudyPlannerServiceImpl implements StudyPlannerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StudyPlannerDao spd;
	
	@Override
	public StudyTime todayChart() {
		System.out.println("service test");
		System.out.println(sqlSession.hashCode());
		
		StudyTime st = new StudyTime();
		st = spd.todayChart(sqlSession);
		
		return st;
		
	}
	
}
