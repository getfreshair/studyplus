package always.awake.studyplus.studyPlanner.model.service;

import java.util.HashMap;

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
	
	//일간 공부량 차트
	@Override
	public HashMap<String, Object> selectTodayChart(HashMap<String, Object> hmap) {
		
		HashMap<String, Object> todayChart = spd.todayChart(sqlSession, hmap);
	
		return todayChart;
	}
	
}
