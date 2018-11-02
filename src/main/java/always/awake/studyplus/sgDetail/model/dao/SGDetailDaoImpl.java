package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Repository
public class SGDetailDaoImpl implements SGDetailDao{

	@Override
	public SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode, int userCode) {
		System.out.println("dao 오니");
		
//		System.out.println(sqlSession.selectOne("SGDetail.selectOneGroup", sgCode));
		
		return sqlSession.selectOne("SGDetail.selectOneGroup", sgCode);
//		return null;
	}



}