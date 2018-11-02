package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class SGDetailDaoImpl implements SGDetailDao{

	@Override
	public int selectJoinStatus(SqlSessionTemplate sqlSession, int memCode) {
		System.out.println("dao 오니");
		return sqlSession.selectOne("SGDetail.selectJoinStatus", memCode);
	}

	@Override
	public SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode) {
		System.out.println("dao 오니");
		return sqlSession.selectOne("SGDetail.selectOneGroup", sgCode);
	}




}