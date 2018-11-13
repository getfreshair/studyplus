package always.awake.studyplus.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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

}