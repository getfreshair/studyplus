package always.awake.studyplus.messenger.model.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.messenger.model.dao.MessengerDao;
import always.awake.studyplus.messenger.model.dao.MessengerDaoImpl;

@Service
public class MessengerServiceImpl  implements MessengerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	MessengerDao md;
	
	
	@Override
	public List selectFriendList(int member_Code) {
		
		return md.selectFriendList(sqlSession, member_Code);
	}

	@Override
	public int selectReceiverMemberCode(String nickname) {
		
		return md.selectReceiverMemberCode(sqlSession, nickname);
	}

	@Override
	public List<Object> selectMessageList(int member_Code, String receiverNickName) {
		// TODO Auto-generated method stub
		return md.selectMessageList(sqlSession, member_Code, receiverNickName);
	}

	@Override
	public Member selectSenderMember(int member_Code) {
		// TODO Auto-generated method stub
		return md.selectSenderMember(sqlSession, member_Code);
	}

	@Override
	public void insertMessage(String msg_content, String sender_member_nickname, int receiver_member_code, int status,
			int type) {
		System.out.println("dh");
		md.insertMessage(sqlSession, msg_content, sender_member_nickname, receiver_member_code, status, type);
	}

	@Override
	public int selectUnreadMessage(int member_Code) {
		// TODO Auto-generated method stub
		return md.selectUnreadMessage(sqlSession, member_Code);
	}

	@Override
	public int unreadToRead(int member_Code, String receiverNickName) {
		// TODO Auto-generated method stub
		return md.unreadToRead(sqlSession, member_Code, receiverNickName);
	}

	@Override
	public int selectEachUnreadMessage(int member_Code, int eachFriendMemberCode) {
		// TODO Auto-generated method stub
		return md.selectEachUnreadMessage(sqlSession, member_Code, eachFriendMemberCode);
	}

	@Override
	public String selcectMemberProfile(String member_Nickname) {
		// TODO Auto-generated method stub
		return md.selcectMemberProfile(sqlSession, member_Nickname);
	}

	@Override
	public void updateMemberStatus(int member_Code) {
		// TODO Auto-generated method stub
		md.updateMemberStatus(sqlSession, member_Code);
	}

	@Override
	public void updateMemberStatusOut(int member_Code) {
		// TODO Auto-generated method stub
		md.updateMemberStatusOut(sqlSession, member_Code);
	}

	@Override
	public int friendStatus(int eachFriendMemberCode) {
		// TODO Auto-generated method stub
		return md.friendStatus(sqlSession, eachFriendMemberCode);
	}
}
