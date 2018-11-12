package always.awake.studyplus.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.InterestCategory;
import always.awake.studyplus.member.model.vo.Member;

public interface MemberDao {
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);
	
	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int selectMemberCode(SqlSessionTemplate sqlSession, String member_Id);

	void insertMember(SqlSessionTemplate sqlSession, Member m);

	void insertMemberFiles(SqlSessionTemplate sqlSession, Files files);

	void insertMemberInterestCategory(SqlSessionTemplate sqlSession, Map<String, List<InterestCategory>> categoryList);

	void insertMemberNeed(SqlSessionTemplate sqlSession, int member_Code);


	void insertGift(SqlSessionTemplate sqlSession, int member_Code);

	int insertMemberHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	
}