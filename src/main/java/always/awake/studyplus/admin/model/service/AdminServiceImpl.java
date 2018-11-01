package always.awake.studyplus.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.admin.model.dao.AdminDao;
import always.awake.studyplus.admin.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao ad;

	@Override
	public List<Map<String, Object>> searchMember(Map<String,Object> map) {
		
		List<Map<String, Object>> list = ad.searchMember(sqlSession, map);
		
		return list;
	}

	@Override
	public int penaltyMember(HashMap<String, Object> map) {
		int result = ad.penaltyMember(sqlSession, map);
		int result1 = ad.penaltyMemberUpdate(sqlSession, map);
		return result;
	}

	@Override
	public List<Map<String, Object>> getPenaltyList(Map<String,Object> map) {
		
		List<Map<String, Object>> list = ad.getPenaltyList(sqlSession, map);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getPenaltyEndList(Map<String, Object> map) {
		
		List<Map<String, Object>> list1 = ad.getPenaltyEndList(sqlSession, map);
		
		return list1;
	}

	@Override
	public int penaltyEndMember(HashMap<String, Object> map) {
		
		int result = ad.penaltyEndMember(sqlSession, map);
		int result1 = ad.penaltyEndMemberUpdate(sqlSession, map);
		
		return result;
	}

	//제재히스토리 조회(아이디옵션)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryById(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = ad.searchPenaltyHistoryById(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByCode(HashMap<String, Object> hmap) {
		List<Map<String, Object>> list = ad.searchPenaltyHistoryByCode(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByReason(HashMap<String, Object> hmap) {
		List<Map<String, Object>> list = ad.searchPenaltyHistoryByReason(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> getDispauseList(Map<String, Object> map) {
		List<Map<String, Object>> list = ad.getDispauseList(sqlSession, map);
		return list;
	}
	
	
}