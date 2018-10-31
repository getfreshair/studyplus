package always.awake.studyplus.studyGroup.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

public interface StudyGroupDao {

	void insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException;

	int selectMemberCode(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	void insertStudyGroupFiles(SqlSessionTemplate sqlSession, Files files) throws StudyGroupException;

	List<Map<String, Object>> selectStudyGroupList(SqlSessionTemplate sqlSession, String searchGroupName) throws StudyGroupException;

}
