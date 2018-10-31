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
	
	
}