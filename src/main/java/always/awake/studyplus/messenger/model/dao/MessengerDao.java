package always.awake.studyplus.messenger.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.member.model.vo.Member;

public interface MessengerDao {

	List selectFriendList(SqlSessionTemplate sqlSession, int member_Code);

	int selectReceiverMemberCode(SqlSessionTemplate sqlSession, String nickname);

	void insertMessage(SqlSessionTemplate sqlSession, String msg_content, int member_Code, int receiverMember_Code,
			int status, int type);

}
