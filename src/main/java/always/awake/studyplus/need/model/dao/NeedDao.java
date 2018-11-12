package always.awake.studyplus.need.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.need.model.vo.Need;

public interface NeedDao {

	Need selectNeedData(SqlSessionTemplate sqlSession, int member_Code);

	void insertWater(SqlSessionTemplate sqlSession, int member_Code, String water);

	void updateLv(SqlSessionTemplate sqlSession, int member_Code, int i);

	void initGiveLove(SqlSessionTemplate sqlSession, int member_Code);

	void initNeed(SqlSessionTemplate sqlSession, int member_Code);

}
