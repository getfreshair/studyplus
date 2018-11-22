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
	public HashMap<String, Object> checkSentence(String sentence) throws MemberException {
		System.out.println("sentence : " + sentence);
	    Seq<KoreanTokenizer.KoreanToken> tokens = OpenKoreanTextProcessorJava.tokenize(sentence);
	    List<String> wordList = OpenKoreanTextProcessorJava.tokensToJavaStringList(tokens);
	    List<KoreanPhraseExtractor.KoreanPhrase> phrases = OpenKoreanTextProcessorJava.extractPhrases(tokens, true, true);
	    HashMap<String, Object> questionInfo = new HashMap<String, Object>();
	    Sentence newSentence = new Sentence();
	    List<Map<String, Object>> infoImgNames = null;
	    String word = "";
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	if(word.equals("유료") || word.equals("돈") || word.equals("금액")) {
	    		questionInfo.put("infoMessage", "모든 서비스는 무료로 이용이 가능합니다.");
	    		
	    		return questionInfo;
	    	}else if(word.equals("이용약관")) {
	    		questionInfo.put("pageUrl", "provision.do");
	    		
	    		return questionInfo;
	    	}else if(word.equals("개인 정보")) {
	    		questionInfo.put("pageUrl", "provision.do");
	    		
	    		return questionInfo;
	    	}else if(word.equals("개인정보취급방침")) {
	    		questionInfo.put("pageUrl", "provision.do");
	    		
	    		return questionInfo;
	    	}else if(word.equals("개인 스터디")) {
	    		questionInfo.put("pageUrl", "studyPlannerMainPage.sp");
	    		
	    		return questionInfo;
	    	}
	    }
	    
	    for(int i = 0; i < wordList.size(); i++) {
	    	word = wordList.get(i);
	    	System.out.println("동사 : " + word);
	    	if(word.equals("줘") || word.equals("할래") || word.equals("싶어") || word.equals("해줘")) {
	    		newSentence.setVerb(word);
	    	}
	    }
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	System.out.println("명사 : " + word);
	    	if(word.equals("일대일 채팅") ||word.equals("스터디 그룹") || word.equals("스터디그룹") || word.equals("회원 가입") || word.equals("프로그램")) {
	    		newSentence.setNoun(word);
	    	}
	    }
	    
	    for(int i = 0; i < phrases.size(); i++) {
	    	word = String.valueOf(phrases.get(i)).split("\\(")[0];
	    	System.out.println("직접 목적어 : " + word);
	    	if(word.equals("방법")) {
	    		newSentence.setDirectObject(word);
	    		
	    		break;
	    	}
	    	
	    	if(word.equals("가입") || word.equals("검색") || word.equals("생성") || word.equals("방식") || word.equals("하고") || word.equals("차단")) {
	    		newSentence.setDirectObject(word);
	    		
	    		break;
	    	}
	    	
	    	if(word.equals("탈퇴")) {
	    		newSentence.setDirectObject(word);
	    		break;
	    	}
	    }
	    
	    if(newSentence.getVerb() == null) {
	    	questionInfo.put("infoMessage", "죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.");
    		
    		return questionInfo;
	    }else if(newSentence.getNoun() == null) {
	    	questionInfo.put("infoMessage", "죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.");
    		
    		return questionInfo;
	    }
	    
	    System.out.println(newSentence.toString());
	    
	    if(newSentence.getNoun().equals("일대일 채팅")) {
	    	if(newSentence.getDirectObject().equals("방법")) {
	    		if(newSentence.getVerb().equals("줘")) {
	    			infoImgNames = md.selectCheckSentenceImg(sqlSession, newSentence.getNoun() + " " + newSentence.getDirectObject());
	    			
	    			questionInfo.put("infoImgNames", infoImgNames);
	    			
	    			return questionInfo; 
	    		}
	    	}
	    }else if(newSentence.getNoun().equals("스터디 그룹") || newSentence.getNoun().equals("스터디그룹")) {
	    	if(newSentence.getDirectObject() == null) {
	    		questionInfo.put("infoMessage", "죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.");
	    		
	    		return questionInfo;
	    	}
	    	
	    	if(newSentence.getDirectObject().equals("가입")) {
	    		if(newSentence.getVerb().equals("줘")) {
	    			questionInfo.put("infoMessage", "스터디 그룹 가입은 로그인 후 상단에 스터디 그룹 > 스터디 그룹 메인 페이지에서 우측 (+) 아이콘을 클릭하시면 됩니다.");
		    		
		    		return questionInfo;
	    		}
	    	}else if(newSentence.getDirectObject().equals("검색")) {
	    		if(newSentence.getVerb().equals("줘")) {
	    			questionInfo.put("infoMessage", "스터디 그룹 검색은 로그인 후 상단에 스터디 그룹 > 스터디 그룹 메인 페이지 상단에서 검색을 하시면 됩니다.");
		    		
		    		return questionInfo;
	    		}
	    	}else if(newSentence.getDirectObject().equals("생성")) {
	    		if(newSentence.getVerb().equals("할래") || newSentence.getVerb().equals("싶어")) {
	    			questionInfo.put("pageUrl", "studyGroupMainPage.sg");
		    		
		    		return questionInfo;
	    		}
	    	}else if(newSentence.getDirectObject().equals("탈퇴")) {
	    		if(newSentence.getVerb().equals("줘")) {
	    			questionInfo.put("infoMessage", "스터디 그룹 탈퇴 방법은 탈퇴할 스터디 그룹에 접속하신 후 우측 상단에 설정 버튼을 누르시면 탈퇴 설정 버튼이 있습니다. 해당 버튼을 클릭하신 후 탈퇴를 진행하시면 됩니다.");
		    		
		    		return questionInfo;
	    		}
	    	}
	    }else if(newSentence.getNoun().equals("회원 가입")) {
	    	if(newSentence.getDirectObject().equals("방법")) {
	    		if(newSentence.getVerb().equals("줘")) {
	    			questionInfo.put("infoMessage", "우측에 로그인 버튼을 클릭하신 후 아이디 / 비밀번호 입력 부분 아래 '회원가입'버튼을 클릭하신 후 진행하시면 됩니다.");
	    			
		    		return questionInfo;
	    		}
	    	}else{
	    		if(newSentence.getVerb().equals("줘") || newSentence.getVerb().equals("싶어") || newSentence.getVerb().equals("할래")) {
	    			questionInfo.put("pageUrl", "insertMemberAgreementPage.me");
		    		
		    		return questionInfo;
	    		}
	    	}
	    }else if(newSentence.getNoun().equals("프로그램")) {
	    	if(newSentence.getDirectObject() == null) {
	    		questionInfo.put("infoMessage", "죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.");
	    		
	    		return questionInfo;
	    	}
	    	
	    	if(newSentence.getDirectObject().equals("차단")) {
	    		if(newSentence.getVerb().equals("싶어")) {
	    			questionInfo.put("infoUrl", "showBlockMain.bl");
	    			
		    		return questionInfo;
	    		}else if(newSentence.getVerb().equals("줘")) {
	    			questionInfo.put("infoMessage", "- 사용자가 설정한 프로그램과 웹 사이트 접근을 막아주며 실행을 차단하게 하며, 차단을 정지할 경우 다시 실행이 가능하도록 설정\n<br><br>" + 
	    					"- 지역 차단의 경우 사용자 IP기반으로 사용자 위치를 추출해서 사용자가 홈페이지에서 설정한 차단 지역과 \n<br><br>" + 
	    					"  범위 300미터 이내일 경우 프로그램을 자동으로 시켜주는 기능\n<br><br>" + 
	    					"- 스케줄은 설정한 시간이 되면 프로그램이 자동으로 실행, 설정한 시간이 아닐 경우 자동으로 종료");
	    			
		    		return questionInfo;
	    		}else {
	    			questionInfo.put("infoMessage", "죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.");
		    		
		    		return questionInfo;
	    		}
	    	}
	    }
	    
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

	@Override
	public int createConfirmNum(String MEMBER_PHONE) throws MemberException{
		String confirmNum = "";
		
		for(int i = 1; i < 7; i++) {
			confirmNum += String.valueOf((int)(Math.random() * 9) + 1);
		}
		
		return md.createConfirmNum(sqlSession, MEMBER_PHONE, Integer.parseInt(confirmNum));
	}

	@Override
	public int selectConfirmNum(String MEMBER_PHONE) {
		return md.selectConfirmNum(sqlSession, MEMBER_PHONE);
	}

	@Override
	public List<Map<String, Object>> selectIdList(String MEMBER_PHONE) {
		return md.selectIdList(sqlSession, MEMBER_PHONE);
	}

	@Override
	public int selectConfirmUserId(String MEMBER_ID) {
		return md.selectConfirmUserId(sqlSession, MEMBER_ID);
	}

	@Override
	public void changePwd(String member_Id, String member_Pwd) {
		md.updatePwd(sqlSession, member_Id, passwordEncoder.encode(member_Pwd));
	}
}