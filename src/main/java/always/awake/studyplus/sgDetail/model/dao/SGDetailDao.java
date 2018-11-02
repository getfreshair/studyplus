package always.awake.studyplus.sgDetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailDao {

	SGDetail selectOneGroup(SqlSessionTemplate sqlSession, int sgCode, int userCode);
	
}