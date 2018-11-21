package always.awake.studyplus.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.admin.model.dao.AdminDao;
import always.awake.studyplus.admin.model.exception.AdminException;
import always.awake.studyplus.admin.model.vo.Banner;
import always.awake.studyplus.admin.model.vo.DispauseBoard;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao ad;

	@Override
	public List<Map<String, Object>> searchMember(Map<String,Object> map) {
		
		List<Map<String, Object>> list = ad.searchMember(sqlSession, map);
		
		return list;
	}

	@Override
	public int penaltyMember(HashMap<String, Object> map) {
		int result = ad.penaltyMember(sqlSession, map);
		int result1 = ad.penaltyMemberUpdate(sqlSession, map);
		return result;
	}

	@Override
	public List<Map<String, Object>> getPenaltyList(Map<String,Object> map) {
		
		List<Map<String, Object>> list = ad.getPenaltyList(sqlSession, map);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getPenaltyEndList(Map<String, Object> map) {
		
		List<Map<String, Object>> list1 = ad.getPenaltyEndList(sqlSession, map);
		
		return list1;
	}

	@Override
	public int penaltyEndMember(HashMap<String, Object> map) {
		
		int result = ad.penaltyEndMember(sqlSession, map);
		int result1 = ad.penaltyEndMemberUpdate(sqlSession, map);
		
		return result;
	}

	//제재히스토리 조회(아이디옵션)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryById(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = ad.searchPenaltyHistoryById(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByCode(HashMap<String, Object> hmap) {
		List<Map<String, Object>> list = ad.searchPenaltyHistoryByCode(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByReason(HashMap<String, Object> hmap) {
		List<Map<String, Object>> list = ad.searchPenaltyHistoryByReason(sqlSession, hmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> getDispauseList(Map<String, Object> map) {
		List<Map<String, Object>> list = ad.getDispauseList(sqlSession, map);
		return list;
	}

	@Override
	public int DispauseMember(HashMap<String, Object> map) {
		int result = ad.DispauseMember(sqlSession, map);
		return result;
	}

	@Override
	public List<DispauseBoard> searchDispauseList(String option, String keyword) {

		return ad.searchDispauseList(sqlSession, option, keyword);
	}

	@Override
	public int countArticle(String option, String keyword) {
		
		return ad.countArticle(sqlSession, option, keyword);
	}

	@Override
	public List<Map<String, Object>> searchGroupList(HashMap<String, Object> map) {
		
		return ad.searchGroupList(sqlSession, map);
	}

	@Override
	public int insertNotice(HashMap<String, Object> map) {

		return ad.insertNotice(sqlSession, map);
	}

	@Override
	public int getNoticeListCount(Map<String, Object> map) {
		return ad.getNoticeListCount(sqlSession ,map);
	}


	@Override
	public List<Map<String, Object>> getNoticeList(Map<String, Object> map) {

		return ad.getNoticeList(sqlSession, map);
	}

	@Override
	public int deleteNotice(HashMap<String, Object> map) {
		
		return ad.deleteNotice(sqlSession, map);
	}

	@Override
	public int getGroupBoardListCount(Map<String, Object> map) {

		return ad.getGroupBoardListCount(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> getGroupBoardList(Map<String, Object> map) {

		return ad.getGroupBoardList(sqlSession, map);
	}

	@Override
	public int updateBoardStatus(HashMap<String, Object> map) {
		return ad.updateBoardStatus(sqlSession, map);
	}

	@Override
	public int insertCPP(Banner b, String originFileName, String changeName) {
		System.out.println("서비스 왔다");
		return ad.insertCPP(sqlSession, b, originFileName, changeName);
	}

	@Override
	public int insertCPC(Banner b, String originFileName, String changeName) {
		
		return ad.insertCPC(sqlSession, b, originFileName, changeName);
	}

	@Override
	public List<Map<String, Object>> getPRList() {
		
		return ad.getPRList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> selectPR(HashMap<String, Object> map) {
		
		return ad.selectPR(sqlSession, map);
	}

	@Override
	public int updateCPP(Banner b, String originFileName, String changeName) {
		return ad.updateCPP(sqlSession, b, originFileName, changeName);
	}

	@Override
	public int updateCPC(Banner b, String originFileName, String changeName) {
		
		return ad.updateCPC(sqlSession, b, originFileName, changeName);
	}

	@Override
	public int deletePR(HashMap<String, Object> map) {

		return ad.deletePR(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> searchPRList(HashMap<String, Object> map) {
		return ad.searchPRList(sqlSession, map);
	}

	@Override
	public int getSingleRewardListCount(Map<String, Object> map) {

		return ad.getSingleRewardListCount(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> getSingleRewardList(Map<String, Object> map) {

		return ad.getSingleRewardList(sqlSession, map);
	}

	@Override
	public int updateSingleReward(HashMap<String, Object> map) {

		return ad.updateSingleReward(sqlSession, map);
	}

	@Override
	public int searchSingleRewardHistoryCount(Map<String, Object> map) {
		
		return ad.searchSingleRewardHistoryCount(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> searchSingleRewardHistory(Map<String, Object> map) {

		return ad.searchSingleRewardHistory(sqlSession, map);
	}

	@Override

	public Map<String, Object> selectImgAndLink(int member_Code) throws AdminException {
		return ad.selectImgAndLink(sqlSession, member_Code);
	}

	@Override
	public int insertPRCount(int pr_Code, int member_Code) throws AdminException {
		int result = -1;
		
		result = ad.selectPRCount(sqlSession, pr_Code, member_Code);
		
		if(!(result > 0)) {
			ad.insertPRCount(sqlSession, pr_Code, member_Code);
		}
		
		return result;
	}
	public List<Map<String, Object>> getGroupRewardList() {
		
		return ad.getGroupRewardList(sqlSession);
	}

	@Override
	public int updateGroupReward(HashMap<String, Object> map) {

		return ad.updateGroupReward(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> searchGroupRewardHistory(HashMap<String, Object> map) {
		return ad.searchGroupRewardHistory(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> getTodayJoinMember() {
		return ad.getTodayJoinMember(sqlSession);
	}

	@Override
	public List<Map<String, Object>> getTotalPenaltyMember() {
		return ad.getTotalPenaltyMember(sqlSession);
	}

	@Override
	public List<Map<String, Object>> getTotalMember() {
		return ad.getTotalMember(sqlSession);
	}

	@Override
	public List<Map<String, Object>> getCategoryMember() {
		return ad.getCategoryMember(sqlSession);
	}

	@Override
	public List<Map<String, Object>> getJoinMemberMonth() {
		return ad.getJoinMemberMonth(sqlSession);

	}

	@Override
	public List<Map<String, Object>> todayCreateGroupList() {
		return ad.todayCreateGroupList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> todayCloseGroupList() {

		return ad.todayCloseGroupList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> categoryGroupList() {
		return ad.categoryGroupList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> weekGroupBoardList() {
		return ad.weekGroupBoardList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> femaleGroupList() {
		return ad.femaleGroupList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> maleGroupLIst() {
		return ad.maleGroupLIst(sqlSession);
	}

	@Override
	public List<Map<String, Object>> totalGroupList() {
		return ad.totalGroupList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> thisMonthBanner() {
		return ad.thisMonthBanner(sqlSession);
	}

	@Override
	public List<Map<String, Object>> postBanner() {
		return ad.postBanner(sqlSession);
	}

	@Override
	public List<Map<String, Object>> totalProfit() {
		return ad.totalProfit(sqlSession);
	}

	@Override
	public List<Map<String, Object>> categoryProfit() {
		return ad.categoryProfit(sqlSession);
	}

	@Override
	public List<Map<String, Object>> CPCandCPPprofit() {
		return ad.CPCandCPPprofit(sqlSession);
	}

	@Override
	public List<Map<String, Object>> yesterdayContact() {
		return ad.yesterdayContact(sqlSession);

	}

	@Override
	public List<Map<String, Object>> todayContact() {
		return ad.todayContact(sqlSession);

	}

	@Override
	public List<Map<String, Object>> totalContact() {
		return ad.totalContact(sqlSession);

	}

	@Override
	public List<Map<String, Object>> contactByTime() {
		return ad.contactByTime(sqlSession);

	}

	@Override
	public List<Map<String, Object>> contactByDay() {
		return ad.contactByDay(sqlSession);

	}

	@Override
	public int updateNoticeCount(HashMap<String, Object> map) {
		
		return ad.updateNoticeCount(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> selectNotice(HashMap<String, Object> map) {
		
		return ad.selectNotice(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> getUserCodeByPhone(HashMap<String, Object> map) {

		return ad.getUserCodeByPhone(sqlSession, map);
	}

	@Override
	public int sendSms(HashMap<String, Object> map) {

		return ad.sendSms(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> searchSmsHistory(HashMap<String, Object> map) {

		return ad.searchSmsHistory(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> checkPRCount(HashMap<String, Object> map) {
		return ad.checkPRCount(sqlSession, map);
	}

	@Override
	public List<Map<String, Object>> getAllGroupBoardList() {
		return ad.getAllGroupBoardList(sqlSession);
	}

	@Override
	public int countCPC(int member_Code) {
		return ad.countCPC(sqlSession, member_Code);
	}

	@Override
	public Map<String, Object> selectCPCImgAndLink(int member_Code) {
		return ad.selectCPCImgAndLink(sqlSession, member_Code);
	}

	@Override
	public int checkTotalPRCount(int prCode) {
		return ad.checkTotalPRCount(sqlSession, prCode);
	}

	@Override
	public void updateCPCStatus(int prCode) {
		ad.updateCPCStatus(sqlSession, prCode);
	}


}