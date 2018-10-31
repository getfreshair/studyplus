package always.awake.studyplus.studyGroup.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

@Repository
public class StudyGroupDaoImpl implements StudyGroupDao{

	@Override
	public void insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException {
		try{
			if(!(sqlSession.insert("StudyGroup.insertStudyGroup", studygroup) > 0)) {
				throw new StudyGroupException("스터디 그룹 기본 정보 저장 실패 했다요!"); 
			}
		}catch (Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
		
	}

	@Override
	public int selectMemberCode(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {
		int code = sqlSession.selectOne("StudyGroup.selectMemberCode", member_Code);
		
		try {
			if(!(code > 0)) throw new StudyGroupException("회원 번호 조회 실패 했다요!");
			
			return code;
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public void insertStudyGroupFiles(SqlSessionTemplate sqlSession, Files files) throws StudyGroupException {
		try {
			if(!(sqlSession.insert("StudyGroup.insertStudyGroupFiles", files) > 0)) {
				throw new StudyGroupException("스터디 그룹 파일 등록이 안됏다요!");
			}
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectStudyGroupList(SqlSessionTemplate sqlSession, String searchGroupName) throws StudyGroupException {
		List<Map<String, Object>> studyGroupList = null;
		
		try {
			studyGroupList = sqlSession.selectList("StudyGroup.selectStudyGroupList", searchGroupName);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
		
		return studyGroupList;
	}

}
