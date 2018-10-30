package always.awake.studyplus.block.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BlockDao {
	
	// Goal 리스트 조회용 메소드
	List selectGoalTimes(SqlSessionTemplate sqlSession, int member_Code);
	// 가입한 그룹과 그룹별 오늘의 공부 총량 리스트StudyGroup 리스트 조회용 메소드
	List selectGroupTimes(SqlSessionTemplate sqlSession, int member_Code);
	// 오늘 개인 공부시간 총량
	int selectTodayStudyTime(SqlSessionTemplate sqlSession, int member_Code);

}
