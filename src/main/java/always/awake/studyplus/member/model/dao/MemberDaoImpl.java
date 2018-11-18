package always.awake.studyplus.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.member.model.exception.MemberException;
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
	public void insertGift(SqlSessionTemplate sqlSession, int member_Code) {
		
		sqlSession.insert("Member.insertGift", member_Code);
	}


	@Override
	public int insertMemberHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Member.insertMemberHistory", map);
	}

	@Override
	public Integer selectUserId(SqlSessionTemplate sqlSession, String member_Id) throws MemberException {
		try {
			return sqlSession.selectOne("Member.selectUserId", member_Id);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
	}
	
	@Override
	public Integer selectNickname(SqlSessionTemplate sqlSession, String member_Nickname) throws MemberException {
		try {
			return sqlSession.selectOne("Member.selectNickname", member_Nickname);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> addFriendSearch(SqlSessionTemplate sqlSession, String member_Nickname, int member_Code) throws MemberException {
		HashMap<String, Object> memberInfo = new HashMap<String, Object>();
		
		memberInfo.put("member_Nickname", member_Nickname);
		memberInfo.put("member_Code", member_Code);
		
		try {
			return sqlSession.selectList("Member.addFriendSearch", memberInfo);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
	}

	@Override
	public void addFriendWant(SqlSessionTemplate sqlSession, int member_Code1, int member_Code2) throws MemberException {
		HashMap<String, Object> memberInfo = new HashMap<String, Object>();
		
		memberInfo.put("member_Code1", member_Code1);
		memberInfo.put("member_Code2", member_Code2);
		
		try {
			sqlSession.insert("Member.addFriendWant", memberInfo);
		}catch(Exception e){
			throw new MemberException(e.getMessage());
		}
		
	}

	@Override
	public List<Map<String, Object>> addFriendToMe(SqlSessionTemplate sqlSession, int member_Code) throws MemberException {
		try {
			return sqlSession.selectList("Member.addFriendToMe", member_Code);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> addFriendFromMe(SqlSessionTemplate sqlSession, int member_Code) throws MemberException {
		try {
			return sqlSession.selectList("Member.addFriendFromMe", member_Code);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
		
	}

	@Override
	public void addFriendOk(SqlSessionTemplate sqlSession, int friend_Code) throws MemberException {
		try {
			sqlSession.update("Member.addFriendOk", friend_Code);
		}catch(Exception e){
			throw new MemberException(e.getMessage());
		}
	}

	@Override
	public void addFriendDelete(SqlSessionTemplate sqlSession, int friend_Code) throws MemberException {
		try {
			sqlSession.delete("Member.addFriendDelete", friend_Code);
		}catch(Exception e){
			throw new MemberException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectCheckSentenceImg(SqlSessionTemplate sqlSession, String indexStr) throws MemberException{
		List<Map<String, Object>> infoImgNames = null;
		
		try {
			infoImgNames = sqlSession.selectList("Member.selectCheckSentenceImg", indexStr);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}
		
		
		return infoImgNames; 
	}
	
}