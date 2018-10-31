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
	}}
