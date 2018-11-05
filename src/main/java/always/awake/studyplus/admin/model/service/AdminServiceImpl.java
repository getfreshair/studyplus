package always.awake.studyplus.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.admin.model.dao.AdminDao;
import always.awake.studyplus.admin.model.vo.Banner;
import always.awake.studyplus.admin.model.vo.DispauseBoard;
import always.awake.studyplus.admin.model.vo.Member;
import always.awake.studyplus.admin.model.vo.PageInfo;

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


	
	
	
	
}