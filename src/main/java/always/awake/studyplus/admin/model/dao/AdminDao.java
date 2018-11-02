package always.awake.studyplus.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

}
