package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailDao {

	int selectJoinStatus(SqlSessionTemplate sqlSession, int sgCode, int memCode);

	SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode, int memCode, int joinStatus);

	
}