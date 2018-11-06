package always.awake.studyplus.sgDetail.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class SGDetailDaoImpl implements SGDetailDao{

	@Override
	public int selectJoinStatus(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		System.out.println("가입여부 확인 Dao req \n");
		HashMap<String, Object> hm = new HashMap<String, Object>();	
		
		hm.put("grCode", grCode);
		hm.put("memCode", memCode);
		System.out.println("1-response) \n가입여부 확인 Dao res -> HM : < " + hm + " >");
		
		return sqlSession.selectOne("SGDetail.selectJoinStatus", hm);
	}

	@Override
	public SGDetail selectOneGrDetailTotal(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		System.out.println("그룹 한 개 선택하는 Dao req \n");
		Map<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("memCode", memCode);
		System.out.println("2-response) \n그룹 한 개 선택하는 Dao res -> HM : < " + hm + " >");
		
		return sqlSession.selectOne("SGDetail.selectOneGrDetailTotal", hm);
	}

	@Override
	public SGDetail selectOneJoinGrTop(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("grCode", grCode);
		hm.put("memCode", memCode);
		System.out.println("가입 그룹 내 정보 표시하는 dao");
		return sqlSession.selectOne("SGDetail.selectOneJoinGrTop", hm);
	}

	@Override
	public int selectJoinAbleChk(SqlSessionTemplate sqlSession, int grCode) {
		return sqlSession.insert("SGDetail.selectjoinAbleChk", grCode);
	}

	@Override
	public int insertGroupJoin(SqlSessionTemplate sqlSession, int grCode, int memCode) {
		SGDetail groupJoin = new SGDetail();
		
		groupJoin.setStudyGroup_Code(grCode);
		groupJoin.setMember_Code(memCode);
		
		return sqlSession.insert("SGDetail.selectjoinAbleChk", groupJoin);
	}



}