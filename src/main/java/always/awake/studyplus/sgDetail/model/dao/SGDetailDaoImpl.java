package always.awake.studyplus.sgDetail.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class SGDetailDaoImpl implements SGDetailDao{

	@Override
	public int selectJoinStatus(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		HashMap<String, Object> hm = new HashMap<String, Object>();	
		
		hm.put("grCode", grCode);
		hm.put("memCode", memCode);
		return sqlSession.selectOne("SGDetail.selectJoinStatus", hm);
	}

	@Override
	public SGDetail selectOneGrDetailLeftTop(SqlSessionTemplate sqlSession, int grCode) {
		return sqlSession.selectOne("SGDetail.selectOneGrDetailLeftTop", grCode);
	}

	@Override
	public SGDetail selectOneGrDetailRightTop(SqlSessionTemplate sqlSession, int grCode) {
		return sqlSession.selectOne("SGDetail.selectOneGrDetailRightTop", grCode);
	}
	
	@Override
	public SGDetail selectOneJoinGrDetailTop(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("memCode", memCode);
		return sqlSession.selectOne("SGDetail.selectOneJoinGrDetailTop", hm);
	}

	@Override
	public int selectJoinAbleChk(SqlSessionTemplate sqlSession, int grCode) {
		return sqlSession.selectOne("SGDetail.selectJoinAbleChk", grCode);
	}

	@Override
	public int insertGroupJoin(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		SGDetail groupJoin = new SGDetail();
		
		groupJoin.setStudyGroup_Code(grCode);
		groupJoin.setMember_Code(memCode);
		return sqlSession.insert("SGDetail.insertGroupJoin", groupJoin);
	}

	@Override
	public List<HashMap<String, Object>> selectGroupMemberList(SqlSessionTemplate sqlSession, int grCode) {
		return sqlSession.selectList("SGDetail.selectGroupMemberList", grCode);
	}

	@Override
	public int updateChangeLeader(SqlSessionTemplate sqlSession, int grCode, int afterLeaderCode, int nowLeaderCode) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("afterLeaderCode", afterLeaderCode);
		hm.put("nowLeaderCode", nowLeaderCode);
		return sqlSession.update("SGDetail.updateChangeGroupLeader", hm);
	}

	@Override
	public int updateDeleteMember(SqlSessionTemplate sqlSession, int grCode, int delMemCode) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("delMemCode", delMemCode);
		return sqlSession.update("SGDetail.updateDeleteJoinMemberStatus", hm);
	}

	@Override
	public HashMap<String, Object> selectChangeDatesInfo(SqlSessionTemplate sqlSession, int changeDates) {
		return sqlSession.selectOne("SGDetail.selectChangeDatesInfo", changeDates);
	}

	@Override
	public HashMap<String, Object> selectChangeMonthsInfo(SqlSessionTemplate sqlSession, int changeMonths) {
		return sqlSession.selectOne("SGDetail.selectChangeMonthsInfo", changeMonths);
	}

/*	@Override
	public List<HashMap<String, Object>> selectGroupMemberRankList(SqlSessionTemplate sqlSession, int grCode,
																				String date, int periodType) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("thisDay", date);
		hm.put("periodType", periodType);
		return sqlSession.selectList("SGDetail.selectGroupMemberRankList", hm);
	}*/
	
}