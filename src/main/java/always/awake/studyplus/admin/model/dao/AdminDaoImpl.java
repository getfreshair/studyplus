package always.awake.studyplus.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.admin.model.exception.AdminException;
import always.awake.studyplus.admin.model.vo.Banner;
import always.awake.studyplus.admin.model.vo.DispauseBoard;
import always.awake.studyplus.admin.model.vo.PageInfo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Map<String, Object>> searchMember(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		System.out.println("DAO"+(map.get("All") == null));
		
		
		return sqlSession.selectList("Admin.selectMember", map);
		
	}

	@Override
	public int penaltyMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Admin.penaltyMemberInsert", map);
	}

	@Override
	public int penaltyMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyMemberUpdate", map);
	}

	@Override
	public List<Map<String, Object>> getPenaltyList(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectList("Admin.getPenaltyList", map);
	}

	@Override
	public List<Map<String, Object>> getPenaltyEndList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.selectList("Admin.getPenaltyEndList",map);
	}
	//제재만료된 회원 차단 테이블 상태 변환
	@Override
	public int penaltyEndMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyEndMember", map);
	}
	//제재만료된 회원 상태 변환
	@Override
	public int penaltyEndMemberUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.penaltyEndMemberUpdate",map);
	}
	//제재회원이력 검색(아이디로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryById(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryById",hmap);
	}
	//제재회원이력 검색(멤버코드로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByCode(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryByCode",hmap);
	}
	//제재회원이력 검색(사유로)
	@Override
	public List<Map<String, Object>> searchPenaltyHistoryByReason(SqlSessionTemplate sqlSession,
			HashMap<String, Object> hmap) {
		return sqlSession.selectList("Admin.searchPenaltyHistoryByReason",hmap);
	}

	@Override
	public List<Map<String, Object>> getDispauseList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("Admin.getDispauseList",map);
	}

	@Override
	public int DispauseMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
	
		return sqlSession.update("Admin.updateDispauseMember", map);
	}

	@Override
	public List<DispauseBoard> searchDispauseList(SqlSessionTemplate sqlSession, String option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("keyword", keyword);
		return sqlSession.selectList("Admin.searchDispauseList", map);
		
	}

	@Override
	public int countArticle(SqlSessionTemplate sqlSession, String option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("Admin.countDispauseArticle", map);
		
	}

	@Override
	public List<Map<String, Object>> searchGroupList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.selectList("Admin.searchGroupList", map);
	}

	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("Admin.insertNotice",map);
	}

	@Override
	public int getNoticeListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getNoticeListCount" , map);
	}


	@Override
	public List<Map<String, Object>> getNoticeList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		PageInfo pi = (PageInfo) map.get("pi");
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		map.put("rowBounds", rowBounds);
		
		return sqlSession.selectList("Admin.getNoticeList",map,rowBounds);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("Admin.deleteNotice", map);
	}

	@Override
	public int getGroupBoardListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectOne("Admin.getGroupBoardListCount",map);
	}

	@Override
	public List<Map<String, Object>> getGroupBoardList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		PageInfo pi = (PageInfo) map.get("pi");
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		map.put("rowBounds", rowBounds);
		
		List<Map<String, Object>> list = sqlSession.selectList("Admin.getGroupBoardList",map,rowBounds);
		
		System.out.println("dao" + list);
		
		return list;
	}

	@Override
	public int updateBoardStatus(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
	
		return sqlSession.update("Admin.updateBoardStatus", map);
	}

	@Override
	public int insertCPP(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName) {
		System.out.println("dao왔다");
		System.out.println(b.getPr_Company());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b", b);
		map.put("originFileName", originFileName);
		map.put("changeName", changeName);
		
		int result = -99;
		
		try {
			result = sqlSession.insert("Admin.insertCPP", map);
		}catch(Exception e) {
			System.out.println("위에꺼");
			e.printStackTrace();
		}
		try {
			if(result > 0) {
				sqlSession.insert("Admin.insertFilesCPP", map);
			}
		}catch(Exception e) {
			System.out.println("아랫것");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertCPC(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b", b);
		map.put("originFileName", originFileName);
		map.put("changeName", changeName);
		int result = -99;
		
		try {
			result = sqlSession.insert("Admin.insertCPC", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(result>0) {
				sqlSession.insert("Admin.insertFilesCPC", map);
			}
		}catch(Exception e) {
			System.out.println("아랫것");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getPRList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Admin.getPRList");
	}

	@Override
	public List<Map<String, Object>> selectPR(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.selectList("Admin.selectPR", map);
	}

	@Override
	public int updateCPP(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b", b);
		map.put("originFileName", originFileName);
		map.put("changeName", changeName);
		int result = -99;
		
		try {
			result = sqlSession.update("Admin.updateCPP", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(result>0) {
				sqlSession.insert("Admin.updateCPPImg", map);
			}
		}catch(Exception e) {
			System.out.println("아랫것");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateCPC(SqlSessionTemplate sqlSession, Banner b, String originFileName, String changeName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b", b);
		map.put("originFileName", originFileName);
		map.put("changeName", changeName);
		int result = -99;
		
		try {
			result = sqlSession.update("Admin.updateCPC", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(result>0) {
				sqlSession.insert("Admin.updateCPCImg", map);
			}
		}catch(Exception e) {
			System.out.println("아랫것");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deletePR(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("Admin.deletePR", map);
	}

	@Override
	public List<Map<String, Object>> searchPRList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.selectList("Admin.searchPRList", map);
	}

	@Override
	public int getSingleRewardListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	
		return sqlSession.selectOne("Admin.getSingleRewardListCount" , map);
	}

	@Override
	public List<Map<String, Object>> getSingleRewardList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		PageInfo pi = (PageInfo) map.get("pi");
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		map.put("rowBounds", rowBounds);
		
		List<Map<String, Object>> list = sqlSession.selectList("Admin.getSingleRewardList",map,rowBounds);
		
		System.out.println("dao" + list);
		
		return list;
	}

	@Override
	public int updateSingleReward(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("Admin.updateSingleReward", map);
	}

	@Override
	public int searchSingleRewardHistoryCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectOne("Admin.searchSingleRewardHistoryCount", map);
	}

	@Override
	public List<Map<String, Object>> searchSingleRewardHistory(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		List<Map<String, Object>> list = sqlSession.selectList("Admin.searchSingleRewardHistory",map);
		
		System.out.println("dao" + list);
		
		return list;
	}

	@Override

	public Map<String, Object> selectImgAndLink(SqlSessionTemplate sqlSession, int member_Code) throws AdminException {
		try {
			return sqlSession.selectOne("Admin.selectImgAndLink", member_Code);
		}catch(Exception e) {
			throw new AdminException("광고 조회 실패요");
		}
	}

	@Override
	public int selectPRCount(SqlSessionTemplate sqlSession, int pr_Code, int member_Code) throws AdminException {
		try {
			Map<String, Integer> data = new HashMap<String, Integer>();
			
			data.put("pr_Code", pr_Code);
			data.put("member_Code", member_Code);
			
			return sqlSession.selectOne("Admin.selectPRCount", data);
		}catch(Exception e) {
			throw new AdminException("광고 이력 조회 실패요");
		}
	}

	@Override
	public void insertPRCount(SqlSessionTemplate sqlSession, int pr_Code, int member_Code) throws AdminException {
		try {
			Map<String, Integer> data = new HashMap<String, Integer>();
			
			data.put("pr_Code", pr_Code);
			data.put("member_Code", member_Code);
			
			sqlSession.selectOne("Admin.insertPRCount", data);
		}catch(Exception e) {
			throw new AdminException("광고 이력 조회 실패요");
		}
	}
	public List<Map<String, Object>> getGroupRewardList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.getGroupRewardList");
	}

	@Override
	public int updateGroupReward(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.insert("Admin.updateGroupReward", map);
	}

	@Override
	public List<Map<String, Object>> searchGroupRewardHistory(SqlSessionTemplate sqlSession,
			HashMap<String, Object> map) {
		
		return sqlSession.selectList("Admin.searchGroupRewardHistory", map);
	}

	@Override
	public List<Map<String, Object>> getTodayJoinMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.getTodayJoinMember");
	}

	@Override
	public List<Map<String, Object>> getTotalPenaltyMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.getTotalPenaltyMember");
	}

	@Override
	public List<Map<String, Object>> getTotalMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.getTotalMember");
	}

	@Override
	public List<Map<String, Object>> getCategoryMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.getCategoryMember");
	}

	@Override
	public List<Map<String, Object>> getJoinMemberMonth(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.getJoinMemberMonth");

	}

	@Override
	public List<Map<String, Object>> todayCreateGroupList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.todayCreateGroupList");
	}

	@Override
	public List<Map<String, Object>> todayCloseGroupList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.todayCloseGroupList");
	}

	@Override
	public List<Map<String, Object>> categoryGroupList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.categoryGroupList");
	}

	@Override
	public List<Map<String, Object>> weekGroupBoardList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.weekGroupBoardList");
	}

	@Override
	public List<Map<String, Object>> femaleGroupList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.femaleGroupList");
	}

	@Override
	public List<Map<String, Object>> maleGroupLIst(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.maleGroupLIst");
	}

	@Override
	public List<Map<String, Object>> totalGroupList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.totalGroupList");
	}

	@Override
	public List<Map<String, Object>> thisMonthBanner(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.thisMonthBanner");
	}

	@Override
	public List<Map<String, Object>> postBanner(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.postBanner");
	}

	@Override
	public List<Map<String, Object>> totalProfit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.totalProfit");
	}

	@Override
	public List<Map<String, Object>> categoryProfit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.categoryProfit");
	}

	@Override
	public List<Map<String, Object>> CPCandCPPprofit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.CPCandCPPprofit");
	}

	@Override
	public List<Map<String, Object>> yesterdayContact(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.yesterdayContact");
	}

	@Override
	public List<Map<String, Object>> todayContact(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.todayContact");
	}

	@Override
	public List<Map<String, Object>> totalContact(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.totalContact");
	}

	@Override
	public List<Map<String, Object>> contactByTime(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.contactByTime");
	}

	@Override
	public List<Map<String, Object>> contactByDay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Admin.contactByDay");
	}
}
