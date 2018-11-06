package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailDao {

	int selectJoinStatus(SqlSessionTemplate sqlSession, int sgCode, int memCode);

	SGDetail selectOneGrDetailTotal(SqlSessionTemplate sqlSession, int sgCode, int memCode, int joinStatus);

	SGDetail selectOneJoinGrTop(SqlSessionTemplate sqlSession, int sgCode, int memCode);

	
}