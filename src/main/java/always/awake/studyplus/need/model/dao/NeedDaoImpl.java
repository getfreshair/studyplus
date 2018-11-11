package always.awake.studyplus.need.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.need.model.vo.Need;

@Repository
public class NeedDaoImpl implements NeedDao{

	@Override
	public Need selectNeedData(SqlSessionTemplate sqlSession, int member_Code) {
		
		return sqlSession.selectOne("Need.selectNeedData", member_Code);
	}

}
