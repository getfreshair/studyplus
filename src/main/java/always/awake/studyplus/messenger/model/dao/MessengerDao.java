package always.awake.studyplus.messenger.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.member.model.vo.Member;

public interface MessengerDao {

	List selectFriendList(SqlSessionTemplate sqlSession, int member_Code);

	int selectReceiverMemberCode(SqlSessionTemplate sqlSession, String nickname);

	List<Object> selectMessageList(SqlSessionTemplate sqlSession, int member_Code, String receiverNickName);

	Member selectSenderMember(SqlSessionTemplate sqlSession, int member_Code);

	void insertMessage(SqlSessionTemplate sqlSession, String msg_content, String sender_member_nickname,
			int receiver_member_code, int status, int type);

	int selectUnreadMessage(SqlSessionTemplate sqlSession, int member_Code);

	int unreadToRead(SqlSessionTemplate sqlSession, int member_Code, String receiverNickName);

	int selectEachUnreadMessage(SqlSessionTemplate sqlSession, int member_Code, int eachFriendMemberCode);

	String selcectMemberProfile(SqlSessionTemplate sqlSession, String member_Nickname);
}
