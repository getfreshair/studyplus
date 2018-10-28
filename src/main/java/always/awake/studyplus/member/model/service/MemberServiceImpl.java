package always.awake.studyplus.member.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import always.awake.studyplus.common.CommonUitls;
import always.awake.studyplus.member.model.dao.MemberDao;
import always.awake.studyplus.member.model.exception.LoginException;
import always.awake.studyplus.member.model.vo.Files;
import always.awake.studyplus.member.model.vo.InterestCategory;
import always.awake.studyplus.member.model.vo.Member;

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
	public int insertMember(Model model, Member m, Files files, ArrayList<String> category_Code,
			HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\upload\\member\\thumbnail";
		
		m.setMember_Pwd(passwordEncoder.encode(m.getMember_Pwd()));
		
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
}