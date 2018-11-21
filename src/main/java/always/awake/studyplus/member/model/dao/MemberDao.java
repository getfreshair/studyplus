package always.awake.studyplus.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.member.model.exception.MemberException;
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

	Integer selectUserId(SqlSessionTemplate sqlSession, String member_Id) throws MemberException;

	Integer selectNickname(SqlSessionTemplate sqlSession, String member_Nickname) throws MemberException;

	List<Map<String, Object>> addFriendSearch(SqlSessionTemplate sqlSession, String member_Nickname, int member_Code) throws MemberException;

	void addFriendWant(SqlSessionTemplate sqlSession, int member_Code1, int member_Code2) throws MemberException;

	List<Map<String, Object>> addFriendToMe(SqlSessionTemplate sqlSession, int member_Code) throws MemberException;

	List<Map<String, Object>> addFriendFromMe(SqlSessionTemplate sqlSession, int member_Code) throws MemberException;

	void addFriendOk(SqlSessionTemplate sqlSession, int friend_Code) throws MemberException;

	void addFriendDelete(SqlSessionTemplate sqlSession, int friend_Code) throws MemberException;

	List<Map<String, Object>> selectCheckSentenceImg(SqlSessionTemplate sqlSession, String indexStr) throws MemberException;

	int createConfirmNum(SqlSessionTemplate sqlSession, String MEMBER_PHONE, int confirmNum) throws MemberException;

	int selectConfirmNum(SqlSessionTemplate sqlSession, String MEMBER_PHONE);

	List<Map<String, Object>> selectIdList(SqlSessionTemplate sqlSession, String MEMBER_PHONE);

	int selectConfirmUserId(SqlSessionTemplate sqlSession, String MEMBER_ID);
	
}