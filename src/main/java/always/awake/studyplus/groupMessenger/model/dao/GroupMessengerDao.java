package always.awake.studyplus.groupMessenger.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.member.model.vo.Member;

public interface GroupMessengerDao {

	List<Member> selectGroupMemberList(SqlSessionTemplate sqlSession, int group_Code);

}
