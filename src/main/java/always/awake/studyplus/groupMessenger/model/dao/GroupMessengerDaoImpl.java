package always.awake.studyplus.groupMessenger.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.member.model.vo.Member;

@Repository
public class GroupMessengerDaoImpl implements GroupMessengerDao{

	@Override
	public List<Member> selectGroupMemberList(SqlSessionTemplate sqlSession, int group_Code) {
		
		List<Member> memberList = sqlSession.selectList("GroupMessenger.selectGroupMemberList", group_Code);
		
		return memberList;
	}

}
