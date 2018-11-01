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

}
