package always.awake.studyplus.messenger.model.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import always.awake.studyplus.member.model.vo.Member;

public interface MessengerService{

	List selectFriendList(int member_Code);

	int selectReceiverMemberCode(String nickname);

	void insertMessage(String msg_content, int member_Code, int receiverMemberCode, int status, int type);
}
