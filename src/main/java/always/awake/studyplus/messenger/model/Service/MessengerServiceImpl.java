package always.awake.studyplus.messenger.model.Service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.messenger.model.dao.MessengerDao;

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
}
