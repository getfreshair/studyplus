package always.awake.studyplus.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.admin.model.exception.AdminException;
import always.awake.studyplus.admin.model.vo.Banner;
import always.awake.studyplus.admin.model.vo.DispauseBoard;
import always.awake.studyplus.admin.model.vo.Member;

public interface AdminDao {

	List<Map<String, Object>> searchMember(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int penaltyMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int penaltyMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<Map<String, Object>> getPenaltyList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	List<Map<String, Object>> getPenaltyEndList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int penaltyEndMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int penaltyEndMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<Map<String, Object>> searchPenaltyHistoryById(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);


	List<Map<String, Object>> searchPenaltyHistoryByCode(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);


	List<Map<String, Object>> searchPenaltyHistoryByReason(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);


	List<Map<String, Object>> getDispauseList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int DispauseMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<DispauseBoard> searchDispauseList(SqlSessionTemplate sqlSession, String option, String keyword);


	int countArticle(SqlSessionTemplate sqlSession, String option, String keyword);


	List<Map<String, Object>> searchGroupList(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int insertNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int getNoticeListCount(SqlSessionTemplate sqlSession, Map<String, Object> map);


	List<Map<String, Object>> getNoticeList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int deleteNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int getGroupBoardListCount(SqlSessionTemplate sqlSession, Map<String, Object> map);


	List<Map<String, Object>> getGroupBoardList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int updateBoardStatus(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int insertCPP(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName);


	int insertCPC(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName);


	List<Map<String, Object>> getPRList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> selectPR(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int updateCPP(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName);


	int updateCPC(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName);


	int deletePR(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<Map<String, Object>> searchPRList(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int getSingleRewardListCount(SqlSessionTemplate sqlSession, Map<String, Object> map);


	List<Map<String, Object>> getSingleRewardList(SqlSessionTemplate sqlSession, Map<String, Object> map);


	int updateSingleReward(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	int searchSingleRewardHistoryCount(SqlSessionTemplate sqlSession, Map<String, Object> map);


	List<Map<String, Object>> searchSingleRewardHistory(SqlSessionTemplate sqlSession, Map<String, Object> map);



	Map<String, Object> selectImgAndLink(SqlSessionTemplate sqlSession, int member_Code) throws AdminException;


	int selectPRCount(SqlSessionTemplate sqlSession, int pr_Code, int member_Code) throws AdminException;


	void insertPRCount(SqlSessionTemplate sqlSession, int pr_Code, int member_Code) throws AdminException;

	List<Map<String, Object>> getGroupRewardList(SqlSessionTemplate sqlSession);


	int updateGroupReward(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<Map<String, Object>> searchGroupRewardHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map);


	List<Map<String, Object>> getTodayJoinMember(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> getTotalPenaltyMember(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> getTotalMember(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> getCategoryMember(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> getJoinMemberMonth(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> todayCreateGroupList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> todayCloseGroupList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> categoryGroupList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> weekGroupBoardList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> femaleGroupList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> maleGroupLIst(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> totalGroupList(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> thisMonthBanner(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> postBanner(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> totalProfit(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> categoryProfit(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> CPCandCPPprofit(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> yesterdayContact(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> todayContact(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> totalContact(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> contactByTime(SqlSessionTemplate sqlSession);


	List<Map<String, Object>> contactByDay(SqlSessionTemplate sqlSession);


}
