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
		System.out.println("가입여부 확인 Dao req \n");
		HashMap<String, Object> hm = new HashMap<String, Object>();	
		
		hm.put("sgCode", sgCode);
		hm.put("memCode", memCode);
		System.out.println("1-response) \n가입여부 확인 Dao res -> HM : < " + hm + " >");
		
		return sqlSession.selectOne("SGDetail.selectJoinStatus", hm);
	}

	@Override
	public SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode, int memCode, int joinStatus) {
		System.out.println("그룹 한 개 선택하는 Dao req \n");
		Map<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("sgCode", sgCode);
		hm.put("memCode", memCode);
		hm.put("joinStatus", joinStatus);
		System.out.println("2-response) \n그룹 한 개 선택하는 Dao res -> HM : < " + hm + " >");
		
		return sqlSession.selectOne("SGDetail.selectOneGroup", hm);
	}



}