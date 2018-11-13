package always.awake.studyplus.groupMessenger.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.groupMessenger.model.dao.GroupMessengerDao;
import always.awake.studyplus.member.model.vo.Member;

@Service
public class GroupMessengerServiceImpl implements GroupMessengerService{

	@Autowired
	GroupMessengerDao gd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectGroupMemberList(int group_Code) {
		
		return gd.selectGroupMemberList(sqlSession, group_Code);
	}

}
