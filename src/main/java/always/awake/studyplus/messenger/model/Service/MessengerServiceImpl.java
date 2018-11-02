package always.awake.studyplus.messenger.model.Service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		
		System.out.println(sqlSession);
		return md.selectFriendList(sqlSession, member_Code);
	}

	@Override
	public int selectReceiverMemberCode(String nickname) {
		
		return md.selectReceiverMemberCode(sqlSession, nickname);
	}

	@Override
	public void insertMessage(String msg_content, int member_Code, int receiverMember_Code, int status, int type) {
	
		md.insertMessage(sqlSession, msg_content, member_Code, receiverMember_Code, status, type);
	}
}
