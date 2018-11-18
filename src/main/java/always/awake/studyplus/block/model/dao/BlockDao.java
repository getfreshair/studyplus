package always.awake.studyplus.block.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.block.model.vo.StudyTimeInfo;
import always.awake.studyplus.game.model.vo.PlayGameUsers;

public interface BlockDao {
	
	// Goal 리스트 조회용 메소드
	List selectGoalTimes(SqlSessionTemplate sqlSession, int member_Code);
	
	// 가입한 그룹과 그룹별 오늘의 공부 총량 리스트StudyGroup 리스트 조회용 메소드
	List selectGroupTimes(SqlSessionTemplate sqlSession, int member_Code);
	
	// 오늘 개인 공부시간 총량 조회용 메소드
	int selectTodayStudyTime(SqlSessionTemplate sqlSession, int member_Code);
	
	// 목표 공부시간 업데이트용 메소드
	int updateGoalStudyTime(SqlSessionTemplate sqlSession, ArrayList<StudyTimeInfo> arrayList);
	
	// 개인 또는 그룹의 공부시간 기록용 메소드
	int insertStudyTime(SqlSessionTemplate sqlSession, StudyTimeInfo studyTimeInfo);

	// 게임 플레이어 리스트 조회용
	List<Object> selectGamePlayerList(SqlSessionTemplate sqlSession,int member_code);

	// 게임 플레이어 조회용
	PlayGameUsers selectPlayer(SqlSessionTemplate sqlSession, int member_code);

}
