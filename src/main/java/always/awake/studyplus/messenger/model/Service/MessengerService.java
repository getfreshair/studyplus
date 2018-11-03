package always.awake.studyplus.messenger.model.Service;

import java.util.List;
import always.awake.studyplus.member.model.vo.Member;

public interface MessengerService{

	List selectFriendList(int member_Code);

	int selectReceiverMemberCode(String nickname);

	List<Object> selectMessageList(int member_Code, String receiverNickName);
	
	Member selectSenderMember(int member_Code);

	void insertMessage(String msg_content, String sender_member_nickname, int receiver_member_code, int status,
			int type);

	int selectUnreadMessage(int member_Code);
	
	int unreadToRead(int member_Code, String receiverNickName);

	int selectEachUnreadMessage(int member_Code, int eachFriendMemberCode);

	String selcectMemberProfile(String member_Nickname);
}
