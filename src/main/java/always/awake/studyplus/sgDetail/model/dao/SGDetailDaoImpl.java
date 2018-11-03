package always.awake.studyplus.sgDetail.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class SGDetailDaoImpl implements SGDetailDao{

	@Override
	public int selectJoinStatus(SqlSessionTemplate sqlSession, int sgCode, int memCode) {
		System.out.println("가입여부 확인 dao 오니");
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
//		test 지우기
		memCode = 1;		
		
		hm.put("sgCode", sgCode);
		hm.put("memCode", memCode);
		System.out.println("가입여부 확인 Dao HM : " + hm);
		
		return sqlSession.selectOne("SGDetail.selectJoinStatus", hm);
	}

	@Override
	public SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode, int joinStatus) {
		System.out.println("그룹 한 개 선택하는 dao 오니");
		
		Map<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("sgCode", sgCode);
		hm.put("joinStatus", joinStatus);
		
		return sqlSession.selectOne("SGDetail.selectOneGroup", hm);
	}



}