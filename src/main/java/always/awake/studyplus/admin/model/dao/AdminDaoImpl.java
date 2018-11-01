package always.awake.studyplus.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.admin.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Map<String, Object>> searchMember(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		System.out.println("DAO"+(map.get("All") == null));
		
		return sqlSession.selectList("Admin.selectMember", map);
	}

	@Override
	public int penaltyMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Admin.penaltyMemberInsert", map);
	}

	@Override
	public int penaltyMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyMemberUpdate", map);
	}

	@Override
	public List<Map<String, Object>> getPenaltyList(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectList("Admin.getPenaltyList", map);
	}

	@Override
	public List<Map<String, Object>> getPenaltyEndList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.selectList("Admin.getPenaltyEndList",map);
	}
	//제재만료된 회원 차단 테이블 상태 변환
	@Override
	public int penaltyEndMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyEndMember", map);
	}
	//제재만료된 회원 상태 변환
	@Override
	public int penaltyEndMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyEndMemberUpdate",map);
	}
	//제재회원이력 검색(아이디로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryById(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryById",hmap);
	}
	//제재회원이력 검색(멤버코드로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByCode(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryByCode",hmap);
	}
	//제재회원이력 검색(사유로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByReason(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryByReason",hmap);
	}

	@Override
	public List<Map<String, Object>> getDispauseList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("Admin.getDispauseList",map);
	}


}
