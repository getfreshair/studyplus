package always.awake.studyplus.studyGroup.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.PageInfo;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

public interface StudyGroupService {

	void insertStudyGroup(StudyGroup studygroup, int member_Code, Files files, HttpServletRequest request) throws StudyGroupException;

	List<Map<String, Object>> sgListAndPi(PageInfo pi) throws StudyGroupException;

	List<Map<String, Object>> studyGroupSelectJoinSGList(int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupSelectRecommendSGList(int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGRankingList(int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGLastBoardList(int member_Code) throws StudyGroupException;

	List<Map<String, Object>> studyGroupInSGMyBoardArea(int member_Code) throws StudyGroupException;

	List<Map<String, Object>> selectStudyGroupSGRTRankList(int category_Code) throws StudyGroupException;

}
