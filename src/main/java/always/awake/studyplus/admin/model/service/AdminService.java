package always.awake.studyplus.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.admin.model.vo.DispauseBoard;
import always.awake.studyplus.admin.model.vo.Member;
import always.awake.studyplus.admin.model.vo.PageInfo;

public interface AdminService {

	public List<Map<String, Object>> searchMember(Map<String, Object> map);

	public int penaltyMember(HashMap<String, Object> map);

	public List<Map<String, Object>> getPenaltyList(Map<String, Object> map);

	public List<Map<String, Object>> getPenaltyEndList(Map<String, Object> map);

	public int penaltyEndMember(HashMap<String, Object> map);

	public List<Map<String, Object>> searchPenaltyHistoryById(HashMap<String, Object> hmap);

	public List<Map<String, Object>> searchPenaltyHistoryByCode(HashMap<String, Object> hmap);

	public List<Map<String, Object>> searchPenaltyHistoryByReason(HashMap<String, Object> hmap);

	public List<Map<String, Object>> getDispauseList(Map<String, Object> map);

	public int DispauseMember(HashMap<String, Object> map);

	public List<DispauseBoard> searchDispauseList(String option, String keyword);

	public int countArticle(String option, String keyword);

	public List<Map<String, Object>> searchGroupList(HashMap<String, Object> map);

	public int insertNotice(HashMap<String, Object> map);

	public int getNoticeListCount(Map<String, Object> map);

	public List<Map<String, Object>> getNoticeList(Map<String, Object> map);

	public int deleteNotice(HashMap<String, Object> map);

	public int getGroupBoardListCount(Map<String, Object> map);

	public List<Map<String, Object>> getGroupBoardList(Map<String, Object> map);
}
