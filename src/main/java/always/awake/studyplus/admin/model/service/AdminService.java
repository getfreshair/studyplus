package always.awake.studyplus.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.admin.model.exception.AdminException;
import always.awake.studyplus.admin.model.vo.Banner;
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

	public int updateBoardStatus(HashMap<String, Object> map);

	public int insertCPP(Banner b, String originFileName, String changeName);

	public int insertCPC(Banner b, String originFileName, String changeName);

	public List<Map<String, Object>> getPRList();

	public List<Map<String, Object>> selectPR(HashMap<String, Object> map);

	public int updateCPP(Banner b, String originFileName, String changeName);

	public int updateCPC(Banner b, String originFileName, String changeName);

	public int deletePR(HashMap<String, Object> map);

	public List<Map<String, Object>> searchPRList(HashMap<String, Object> map);

	public int getSingleRewardListCount(Map<String, Object> map);

	public List<Map<String, Object>> getSingleRewardList(Map<String, Object> map);

	public int updateSingleReward(HashMap<String, Object> map);

	public int searchSingleRewardHistoryCount(Map<String, Object> map);

	public List<Map<String, Object>> searchSingleRewardHistory(Map<String, Object> map);


	public Map<String, Object> selectImgAndLink(int member_Code) throws AdminException;

	public int insertPRCount(int pr_Code, int member_Code) throws AdminException;

	public List<Map<String, Object>> getGroupRewardList();

	public int updateGroupReward(HashMap<String, Object> map);

	public List<Map<String, Object>> searchGroupRewardHistory(HashMap<String, Object> map);

	public List<Map<String, Object>> getTodayJoinMember();

	public List<Map<String, Object>> getTotalPenaltyMember();

	public List<Map<String, Object>> getTotalMember();

	public List<Map<String, Object>> getCategoryMember();

	public List<Map<String, Object>> getJoinMemberMonth();

	public List<Map<String, Object>> todayCreateGroupList();

	public List<Map<String, Object>> todayCloseGroupList();

	public List<Map<String, Object>> categoryGroupList();

	public List<Map<String, Object>> weekGroupBoardList();

	public List<Map<String, Object>> femaleGroupList();

	public List<Map<String, Object>> maleGroupLIst();

	public List<Map<String, Object>> totalGroupList();

	public List<Map<String, Object>> thisMonthBanner();

	public List<Map<String, Object>> postBanner();

	public List<Map<String, Object>> totalProfit();

	public List<Map<String, Object>> categoryProfit();

	public List<Map<String, Object>> CPCandCPPprofit();

	public List<Map<String, Object>> yesterdayContact();

	public List<Map<String, Object>> todayContact();

	public List<Map<String, Object>> totalContact();

	public List<Map<String, Object>> contactByTime();

	public List<Map<String, Object>> contactByDay();

	public int updateNoticeCount(HashMap<String, Object> map);

	public List<Map<String, Object>> selectNotice(HashMap<String, Object> map);

	public List<Map<String, Object>> getUserCodeByPhone(HashMap<String, Object> map);

	public int sendSms(HashMap<String, Object> map);

	public List<Map<String, Object>> searchSmsHistory(HashMap<String, Object> map);

	public List<Map<String, Object>> checkPRCount(HashMap<String, Object> map);

	public List<Map<String, Object>> getAllGroupBoardList();

	public int countCPC(int member_Code);

}
