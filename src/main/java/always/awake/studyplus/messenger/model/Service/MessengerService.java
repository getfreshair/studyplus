package always.awake.studyplus.messenger.model.Service;

import java.util.List;
import always.awake.studyplus.member.model.vo.Member;

public interface MessengerService{

	List selectFriendList(int member_Code);

	int selectReceiverMemberCode(String nickname);

	void insertMessage(String msg_content, int member_Code, int receiverMemberCode, int status, int type);

	List<Object> selectMessageList(int member_Code, String receiverNickName);
	
	Member selectSenderMember(int member_Code);
}
