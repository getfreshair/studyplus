package always.awake.studyplus.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.admin.model.vo.Member;

public interface AdminDao {

	List<Member> searchMember(SqlSessionTemplate sqlSession, Map<String, Object> map);

}
