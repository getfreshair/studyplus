package always.awake.studyplus.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.InterestCategory;
import always.awake.studyplus.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	@Override
	public int selectMemberCode(SqlSessionTemplate sqlSession, String member_Id) {
		return sqlSession.selectOne("Member.selectMemberCode", member_Id);
	}

	@Override
	public void insertMember(SqlSessionTemplate sqlSession, Member m) {
		sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public void insertMemberFiles(SqlSessionTemplate sqlSession, Files files) {
		sqlSession.insert("Member.insertMemberFiles", files);
	}

	@Override
	public void insertMemberInterestCategory(SqlSessionTemplate sqlSession, Map<String, List<InterestCategory>> categoryList) {
		sqlSession.insert("Member.insertMemberInterestCategory", categoryList);
	}

	@Override
	public void insertMemberNeed(SqlSessionTemplate sqlSession, int member_Code) {
		sqlSession.insert("Member.insertMemberNeed", member_Code);
	}


	@Override
	public int insertMemberHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Member.insertMemberHistory", map);
	}

	
}