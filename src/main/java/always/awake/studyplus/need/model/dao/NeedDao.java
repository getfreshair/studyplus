package always.awake.studyplus.need.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.need.model.vo.Need;

public interface NeedDao {

	Need selectNeedData(SqlSessionTemplate sqlSession, int member_Code);

}
