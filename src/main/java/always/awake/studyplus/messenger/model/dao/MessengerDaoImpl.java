package always.awake.studyplus.messenger.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.core.annotation.SynthesizedAnnotation;
import org.springframework.stereotype.Repository;
import always.awake.studyplus.member.model.vo.Member;

@Repository
public class MessengerDaoImpl implements MessengerDao{

	@Override
	public List selectFriendList(SqlSessionTemplate sqlSession, int member_Code) {
		// TODO Auto-generated method stub
		
		System.out.println(sqlSession.selectList("Messenger.selectFriendList", member_Code));
		return sqlSession.selectList("Messenger.selectFriendList", member_Code);
	}
}
