package always.awake.studyplus.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.admin.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> searchMember(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		
		return sqlSession.selectList("Admin.selectMember", map);
	}

}
