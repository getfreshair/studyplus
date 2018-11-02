package always.awake.studyplus.messenger.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.core.annotation.SynthesizedAnnotation;
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

	public void insertMessage(SqlSessionTemplate sqlSession, String msg_content, int member_Code,
			int receiverMember_Code, int status, int type) {
		
		Message msg = new Message();
		msg.setMessage_content(msg_content);
		msg.setSender_message_code(member_Code);
		msg.setReceiver_message_code(receiverMember_Code);
		msg.setMessage_status(status);
		msg.setMessage_type(type);
		
		sqlSession.insert("Messenger.insertMessage", msg);
	}
}
