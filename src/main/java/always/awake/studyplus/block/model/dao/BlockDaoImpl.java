package always.awake.studyplus.block.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.block.model.vo.StudyTimeInfo;
import always.awake.studyplus.game.model.vo.PlayGameUsers;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class BlockDaoImpl implements BlockDao{

	// Goal 리스트 조회용 메소드
	@Override
	public List selectGoalTimes(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Block.selectGoalListAindTimes",member_Code);
	}
	
	// 가입한 그룹과 그룹별 오늘의 공부 총량 리스트
	@Override
	public List selectGroupTimes(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Block.selectGroupListAndTimes",member_Code);
	}
	
	// 오늘 개인 공부시간 총량 조회용 메소드
	@Override
	public int selectTodayStudyTime(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Block.selectTodayStudyTime",member_Code);
	}

	// 목표 공부시간 업데이트용 메소드
	@Override
	public int updateGoalStudyTime(SqlSessionTemplate sqlSession, ArrayList<StudyTimeInfo> goalSutudyInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update("Block.updateGoalStudyTimes", goalSutudyInfo);
	}

	// 개인 또는 그룹의 공부시간 기록용 메소드
	@Override
	public int insertStudyTime(SqlSessionTemplate sqlSession, StudyTimeInfo studyTimeInfo) {
		// TODO Auto-generated method stub
		System.out.println("너가왜 ? : "+studyTimeInfo);
		return sqlSession.insert("Block.insertStudyTimes",studyTimeInfo);
	}

	@Override
	public List<Object> selectGamePlayerList(SqlSessionTemplate sqlSession,int member_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Block.selectGamePlayerList",member_code);
	}

	@Override
	public PlayGameUsers selectPlayer(SqlSessionTemplate sqlSession, int member_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Block.selectPlayer",member_code);
	}
}
