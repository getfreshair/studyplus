package always.awake.studyplus.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import always.awake.studyplus.member.model.exception.LoginException;
import always.awake.studyplus.member.model.exception.MemberException;
import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.Member;

public interface MemberService {
	public Member login(Member m) throws LoginException;

	public int insertMember(Member m, Files files, ArrayList<String> category_Code, HttpServletRequest request);

	public String checkSentence(String sentence);

	public void insertGift(int member_Code);

	public int insertMemberHistory(HashMap<String, Object> map);

	public Map<String, Integer> selectUserIdAndNick(String member_Id, String member_Nickname) throws MemberException;

	public List<Map<String, Object>> addFriendSearch(String member_Nickname, int member_Code) throws MemberException;

	public void addFriendWant(int member_Code1, int member_Code2) throws MemberException;

	public List<Map<String, Object>> addFriendToMe(int member_Code) throws MemberException;

	public List<Map<String, Object>> addFriendFromMe(int member_Code) throws MemberException;

	public void addFriendOk(int friend_Code) throws MemberException;

	public void addFriendDelete(int friend_Code) throws MemberException;
}