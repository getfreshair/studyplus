package always.awake.studyplus.block.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
