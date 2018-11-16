package always.awake.studyplus.member.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.openkoreantext.processor.OpenKoreanTextProcessorJava;
import org.openkoreantext.processor.phrase_extractor.KoreanPhraseExtractor;
import org.openkoreantext.processor.tokenizer.KoreanTokenizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import always.awake.studyplus.common.CommonUitls;
import always.awake.studyplus.member.model.dao.MemberDao;
import always.awake.studyplus.member.model.exception.LoginException;
import always.awake.studyplus.member.model.exception.MemberException;
import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.InterestCategory;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.member.model.vo.Sentence;
import scala.collection.Seq;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Member login(Member m) throws LoginException {
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getMember_Pwd(), encPassword)) {
			throw new LoginException("비밀번호가 맞지 않습니다.");
		}else {
			return md.selectMember(sqlSession, m);
		}
	}

	@Override
	public int insertMember(Member m, Files files, String[] category_Code,
			HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\upload\\member\\thumbnail";
		
		m.setMember_Pwd(passwordEncoder.encode(m.getMember_Pwd()));
		
		if(m.getMember_SMSConfirmation() == null) {
			m.setMember_SMSConfirmation("1");
		}
		
		md.insertMember(sqlSession, m);
		
		int member_Code = md.selectMemberCode(sqlSession, m.getMember_Id());
		
		md.insertMemberNeed(sqlSession, member_Code);
		
		if(category_Code != null) {
			List<InterestCategory> interestCategory = new ArrayList<InterestCategory>();
			InterestCategory ic = null;
			
			for(int i = 0; i < category_Code.length; i++) {
				ic = new InterestCategory();
				
				ic.setCategory_Code(Integer.parseInt(category_Code[i]));
				ic.setMember_Code(member_Code);
				
				interestCategory.add(ic);
			}
			Map<String, List<InterestCategory>> categoryList = new HashMap<String, List<InterestCategory>>();
			categoryList.put("interestCategory", interestCategory);
			
			md.insertMemberInterestCategory(sqlSession, categoryList);
		}
		
		try {
			files.setMember_Code(member_Code);
			files.setFiles_OriginName(files.getUserThumbnailImg().getOriginalFilename());
			files.setFiles_Name(CommonUitls.getRandomString());
			
			files.getUserThumbnailImg().transferTo(new File(filePath + "\\" + files.getFiles_Name()));
			
			md.insertMemberFiles(sqlSession, files);
			
			return 1;
		} catch (Exception e) {
			new File(filePath + "\\" + files.getUserThumbnailImg().getName()).delete();
			
			e.printStackTrace();
			
			return 0;
		}
	}

	@Override
	public HashMap<String, Object> checkSentence(String sentence) {
	    Seq<KoreanTokenizer.KoreanToken> tokens = OpenKoreanTextProcessorJava.tokenize(sentence);
	    List<String> wordList = OpenKoreanTextProcessorJava.tokensToJavaStringList(tokens);
	    List<KoreanPhraseExtractor.KoreanPhrase> phrases = OpenKoreanTextProcessorJava.extractPhrases(tokens, true, true);
	    HashMap<String, Object> questionInfo = new HashMap<String, Object>();
	    Sentence newSentence = new Sentence();
	    String word = "";
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	if(word.equals("유로") || word.equals("돈") || word.equals("금액")) {
	    		questionInfo.put("infoMessage", "모든 서비스는 무료로 이용이 가능합니다.");
	    		
	    		return questionInfo;
	    	}else if(word.equals("이용약관")) {
	    		questionInfo.put("pageUrl", "main/main");
	    		
	    		return questionInfo;
	    	}else if(word.equals("개인정보")) {
	    		questionInfo.put("pageUrl", "main/main");
	    		
	    		return questionInfo;
	    	}else if(word.equals("스터디플래너")) {
	    		questionInfo.put("pageUrl", "main/main");
	    		
	    		return questionInfo;
	    	}
	    }
	    
	    for(int i = 0; i < wordList.size(); i++) {
	    	word = wordList.get(i);
	    	System.out.println("1 : " + word);
	    	if(word.equals("줘") || word.equals("할래") || word.equals("싶어") || word.equals("해줘")) {
	    		newSentence.setVerb(word);
	    	}
	    }
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	System.out.println("2 : " + word);
	    	if(word.equals("스터디 플래너") || word.equals("스터디 그룹") || word.equals("스터디그룹") || word.equals("회원 가입") || word.equals("프로그램")) {
	    		newSentence.setNoun(word);
	    	}
	    }
	    
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	System.out.println("3 : " + word);
	    	if(word.equals("차단") || word.equals("가입 방법") || word.equals("검색 방법") || word.equals("생성") || word.equals("탈퇴 방법") || word.equals("방식") || word.equals("하고") || word.equals("방법")) {
	    		newSentence.setDirectObject(word);;
	    	}
	    }
	    
	    /*for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i));
	    	if(word.equals("가입방법") || word.equals("검색방법") || word.equals("생성") || word.equals("탈퇴방법") || word.equals("방식") || word.equals("하고") || word.equals("방법")) {
	    		newSentence.setDirectObject(word);;
	    	}
	    }*/
	    
	    System.out.println(newSentence.toString());
	    
	    return questionInfo;
	}

	@Override
	public void insertGift(int member_Code) {
		md.insertGift(sqlSession, member_Code);
	}
	
	public int insertMemberHistory(HashMap<String, Object> map) {
		return md.insertMemberHistory(sqlSession,map);
	}

	@Override
	public Map<String, Integer> selectUserIdAndNick(String member_Id, String member_Nickname) throws MemberException {
		Map<String, Integer> checkVal = new HashMap<String, Integer>();
		
		checkVal.put("member_Id", md.selectUserId(sqlSession, member_Id));
		checkVal.put("member_Nickname", md.selectNickname(sqlSession, member_Nickname));
		
		return checkVal;
	}

	@Override
	public List<Map<String, Object>> addFriendSearch(String member_Nickname, int member_Code) throws MemberException {
		return md.addFriendSearch(sqlSession, member_Nickname, member_Code);
	}

	@Override
	public void addFriendWant(int member_Code1, int member_Code2) throws MemberException{
		md.addFriendWant(sqlSession, member_Code1, member_Code2) ;
		
	}

	@Override
	public List<Map<String, Object>> addFriendToMe(int member_Code) throws MemberException {
		return md.addFriendToMe(sqlSession, member_Code);
	}

	@Override
	public List<Map<String, Object>> addFriendFromMe(int member_Code) throws MemberException {
		return md.addFriendFromMe(sqlSession, member_Code);
	}

	@Override
	public void addFriendOk(int friend_Code) throws MemberException {
		md.addFriendOk(sqlSession, friend_Code);
	}

	@Override
	public void addFriendDelete(int friend_Code) throws MemberException {
		md.addFriendDelete(sqlSession, friend_Code);
	}
}