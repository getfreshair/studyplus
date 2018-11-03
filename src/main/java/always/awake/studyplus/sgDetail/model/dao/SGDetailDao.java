package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailDao {

	int selectJoinStatus(SqlSessionTemplate sqlSession, int grCode, int memCode);

	SGDetail selectOneGrDetailJoinBefore(SqlSessionTemplate sqlSession, int grCode);

	SGDetail selectOneJoinGrDetailTop(SqlSessionTemplate sqlSession, int grCode, int memCode);

	int selectJoinAbleChk(SqlSessionTemplate sqlSession, int grCode);

	int insertGroupJoin(SqlSessionTemplate sqlSession, int grCode, int memCode);

	
}