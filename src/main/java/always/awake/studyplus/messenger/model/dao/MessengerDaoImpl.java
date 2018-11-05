package always.awake.studyplus.messenger.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.messenger.model.vo.Message;

@Repository
public class MessengerDaoImpl implements MessengerDao{

	@Override
	public List selectFriendList(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Messenger.selectFriendList", member_Code);
	}

	@Override
	public int selectReceiverMemberCode(SqlSessionTemplate sqlSession, String nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectReceiverMemberCode", nickname);
	}

	@Override
	public List<Object> selectMessageList(SqlSessionTemplate sqlSession, int member_Code, String receiverNickName) {
		// TODO Auto-generated method stub
		
		Message msg = new Message();
		msg.setSender_message_code(member_Code);
		int receiver_message_code = sqlSession.selectOne("Messenger.selectReceiverMemberCode", receiverNickName);
		msg.setReceiver_message_code(receiver_message_code);
		
		return sqlSession.selectList("Messenger.selectMessageList", msg);
	}

	@Override
	public Member selectSenderMember(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectSenderMember", member_Code);
	}

	@Override
	public void insertMessage(SqlSessionTemplate sqlSession, String msg_content, String sender_member_nickname,
			int receiver_member_code, int status, int type) {
		
		Message msg = new Message();
		int sender_message_code = sqlSession.selectOne("Messenger.selectReceiverMemberCode", sender_member_nickname);
		msg.setSender_message_code(sender_message_code);
		msg.setReceiver_message_code(receiver_member_code);
		msg.setMessage_content(msg_content);
		msg.setMessage_status(status);
		System.out.println(msg);
		sqlSession.insert("Messenger.insertMessage", msg);
	}

	@Override
	public int selectUnreadMessage(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectUnreadMessage", member_Code);
	}

	@Override
	public int unreadToRead(SqlSessionTemplate sqlSession, int member_Code, String receiverNickName) {
		// TODO Auto-generated method stub
		Map<String, Object> hmap = new HashMap<String, Object>();
		int receiver_member_code = sqlSession.selectOne("Messenger.selectReceiverMemberCode", receiverNickName);
		
		hmap.put("member_Code", member_Code);
		hmap.put("receiver_member_code", receiver_member_code);
		
		return sqlSession.update("Messenger.unreadToRead", hmap);
	}

	@Override
	public int selectEachUnreadMessage(SqlSessionTemplate sqlSession, int member_Code, int eachFriendMemberCode) {
		// TODO Auto-generated method stub
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("member_Code", member_Code);
		hmap.put("eachFriendMemberCode", eachFriendMemberCode);

		return sqlSession.selectOne("Messenger.selectEachUnreadMessage", hmap);
	}

	@Override
	public String selcectMemberProfile(SqlSessionTemplate sqlSession, String member_Nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selcectMemberProfile", member_Nickname);
	}

	@Override
	public void updateMemberStatus(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		sqlSession.update("Messenger.updateMemberStatus", member_Code);
	}

	@Override
	public void updateMemberStatusOut(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		sqlSession.update("Messenger.updateMemberStatusOut", member_Code);
	}

	@Override
	public int friendStatus(SqlSessionTemplate sqlSession, int eachFriendMemberCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.friendStatus", eachFriendMemberCode);
	}
}
