package always.awake.studyplus.studyGroup.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.PageInfo;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

public interface StudyGroupDao {

	void insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException;

	int selectMemberCode(SqlSessionTemplate sqlSession) throws StudyGroupException;

	void insertStudyGroupFiles(SqlSessionTemplate sqlSession, Files files) throws StudyGroupException;

	List<Map<String, Object>> selectStudyGroupList(SqlSessionTemplate sqlSession, PageInfo pi) throws StudyGroupException;

	int selectStudyGroupListCount(SqlSessionTemplate sqlSession, PageInfo pi) throws StudyGroupException;

	List<Map<String, Object>> studyGroupSelectJoinSGList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupSelectRecommendSGList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGRankingList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGLastBoardList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGMyBoardArea(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException;

	List<Map<String, Object>> selectStudyGroupSGRTRankList(SqlSessionTemplate sqlSession, int category_Code) throws StudyGroupException;

	void insertStudyGroupJoin(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException;

}
