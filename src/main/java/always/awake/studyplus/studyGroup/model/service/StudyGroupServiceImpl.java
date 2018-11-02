package always.awake.studyplus.studyGroup.model.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import always.awake.studyplus.common.CommonUitls;
import always.awake.studyplus.studyGroup.common.Pagination;
import always.awake.studyplus.studyGroup.model.dao.StudyGroupDao;
import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.PageInfo;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

@Service
public class StudyGroupServiceImpl implements StudyGroupService{
	@Autowired
	private StudyGroupDao sgd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertStudyGroup(StudyGroup studygroup,int member_Code, Files files, HttpServletRequest request) throws StudyGroupException {
		if(studygroup.getStudygroup_Pwd() != null) {
			studygroup.setStudygroup_Pwd(passwordEncoder.encode(studygroup.getStudygroup_Pwd()));
		}
		
		studygroup.setMember_Code(member_Code);
		
		sgd.insertStudyGroup(sqlSession, studygroup);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\upload\\studygroup\\thumbnail";
		
		files.setStudygroup_Code(sgd.selectMemberCode(sqlSession));
		files.setFiles_OriginName(files.getStudygroupThumbnailImg().getOriginalFilename());
		files.setFiles_Name(CommonUitls.getRandomString());
		
		try {
			files.getStudygroupThumbnailImg().transferTo(new File(filePath + "\\" + files.getFiles_Name()));
			
			sgd.insertStudyGroupFiles(sqlSession, files);
		} catch (Exception e){
			new File(filePath + "\\" + files.getFiles_Name()).delete();
			
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> sgListAndPi(PageInfo pi) throws StudyGroupException {
		pi.setListCount(sgd.selectStudyGroupListCount(sqlSession, pi));
		
		PageInfo newPi = Pagination.getPageInfo(pi.getCurrentPage(), pi.getListCount(), pi.getSearchSGName(), pi.getLocation_Code(), pi.getCategory_Code());
		
		return sgd.selectStudyGroupList(sqlSession, newPi);
	}
	
}