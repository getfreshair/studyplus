package always.awake.studyplus.member.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.openkoreantext.processor.KoreanTokenJava;
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
	public int insertMember(Member m, Files files, ArrayList<String> category_Code,
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
			
			for(int i = 0; i < category_Code.size(); i++) {
				ic = new InterestCategory();
				
				ic.setCategory_Code(Integer.parseInt(category_Code.get(i)));
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
	public String checkSentence(String sentence) {
	    Seq<KoreanTokenizer.KoreanToken> tokens = OpenKoreanTextProcessorJava.tokenize(sentence);
	    List<String> wordList = OpenKoreanTextProcessorJava.tokensToJavaStringList(tokens);
	    Sentence newSentence = new Sentence(); 
	    
	    for(int i = 0; i < wordList.size(); i++){
	    	if(wordList.get(i).equals("자주묻는질문")) {
	    		
	    		return "main/main";
	    	}else if(wordList.get(i).equals("약관") || wordList.get(i).equals("정책")) {
	    		
	    		return "main/main";
	    	}else if(wordList.get(i).equals("회원가입")) {
	    		
	    		return "main/main";
	    	}

	    	if(wordList.get(i).equals("검색") || wordList.get(i).equals("조회") || wordList.get(i).equals("이동")) {
	    		newSentence.setVerb(wordList.get(i));
	    	}else if(wordList.get(i).equals("스터디그룹") || wordList.get(i).equals("친구") || wordList.get(i).equals("페이지") || wordList.get(i).equals("회원가입")){
	    		newSentence.setNoun(wordList.get(i));
	    	}else {
	    		newSentence.setDirectObject(wordList.get(i));
	    	}
	    }
	    
		if(newSentence.getVerb() != null) {
	    	if(newSentence.getNoun().equals("스터디 그룹")) {
	    		
		    }else if(newSentence.getNoun().equals("친구")) {
		    	
		    }else if(newSentence.getNoun().equals("페이지")) {
		    	
		    }
		}
	    
	    System.out.println(newSentence.toString());
	    
	    return "sadf";
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