package always.awake.studyplus.messenger.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.member.model.vo.Member;

public interface MessengerDao {

	List selectFriendList(SqlSessionTemplate sqlSession, int member_Code);

}
