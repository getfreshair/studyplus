package always.awake.studyplus.studyGroup.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.studyGroup.model.exception.StudyGroupException;
import always.awake.studyplus.studyGroup.model.vo.Files;
import always.awake.studyplus.studyGroup.model.vo.PageInfo;
import always.awake.studyplus.studyGroup.model.vo.StudyGroup;

@Repository
public class StudyGroupDaoImpl implements StudyGroupDao{

	@Override
	public void insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException {
		try{
			if(!(sqlSession.insert("StudyGroup.insertStudyGroup", studygroup) > 0)) {
				throw new StudyGroupException("스터디 그룹 기본 정보 저장 실패 했다요!"); 
			}
		}catch (Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
		
	}

	@Override
	public int selectMemberCode(SqlSessionTemplate sqlSession) throws StudyGroupException {
		int code = sqlSession.selectOne("StudyGroup.selectMemberCode");
		
		try {
			if(!(code > 0)) throw new StudyGroupException("회원 번호 조회 실패 했다요!");
			
			return code;
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public void insertStudyGroupFiles(SqlSessionTemplate sqlSession, Files files) throws StudyGroupException {
		try {
			if(!(sqlSession.insert("StudyGroup.insertStudyGroupFiles", files) > 0)) {
				throw new StudyGroupException("스터디 그룹 파일 등록이 안됏다요!");
			}
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public int selectStudyGroupListCount(SqlSessionTemplate sqlSession, PageInfo pi) throws StudyGroupException {
		int listCount = -1;
		
		try {
			if(!((listCount = sqlSession.selectOne("StudyGroup.selectStudyGroupListCount", pi)) > -1)) {
				throw new StudyGroupException("스터디 그룹 카운트 조회 실패 했다요! 쿼리 오류!");
			}
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
		
		return listCount;
	}
	
	@Override
	public List<Map<String, Object>> selectStudyGroupList(SqlSessionTemplate sqlSession, PageInfo pi)throws StudyGroupException {
		try {
			List<Map<String, Object>> sgListAndPi;
			
			RowBounds rowBounds = new RowBounds(pi.getOffset(), pi.getLimit());
			
			sgListAndPi = sqlSession.selectList("StudyGroup.selectStudyGroupList", pi, rowBounds);
			
			Map<String, Object> newPi = new HashMap<String, Object>();
			
			newPi.put("pi", pi);
			
			sgListAndPi.add(newPi);
			
			return sgListAndPi;
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> studyGroupSelectJoinSGList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {		
		try {
			return sqlSession.selectList("StudyGroup.studyGroupSelectJoinSGList", member_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> studyGroupSelectRecommendSGList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.studyGroupSelectRecommendSGList", member_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> studyGroupInSGRankingList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.studyGroupInSGRankingList", member_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> studyGroupInSGLastBoardList(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.studyGroupInSGLastBoardList", member_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> studyGroupInSGMyBoardArea(SqlSessionTemplate sqlSession, int member_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.studyGroupInSGMyBoardArea", member_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectStudyGroupSGRTRankList(SqlSessionTemplate sqlSession, int category_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.selectStudyGroupSGRTRankArea", category_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public void insertStudyGroupJoin(SqlSessionTemplate sqlSession, StudyGroup studygroup) throws StudyGroupException {
		try {
			sqlSession.insert("StudyGroup.insertStudyGroupJoin", studygroup);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGCategoryChart(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException {
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGCategoryChart", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGCategoryChartTime(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException {
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGCategoryChartTime", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGLocationChart(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException{
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGLocationChart", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGLocationChartTime(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException {
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGLocationChartTime", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGtimeZoneChart(SqlSessionTemplate sqlSession, int studygroup_Code) throws StudyGroupException {
		try {
			return sqlSession.selectList("StudyGroup.selectSGtimeZoneChart", studygroup_Code);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGTimeAmountChart(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException {
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGTimeAmountChart", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}

	@Override
	public List<Map<String, Object>> selectSGTimeAmountChartTime(SqlSessionTemplate sqlSession, int studygroup_Code, String period) throws StudyGroupException {
		try {
			Map<String, Object> searchInfo = new HashMap<String, Object>();
			
			searchInfo.put("studygroup_Code", studygroup_Code);
			searchInfo.put("period", period);
			
			return sqlSession.selectList("StudyGroup.selectSGTimeAmountChartTime", searchInfo);
		}catch(Exception e) {
			throw new StudyGroupException(e.getMessage());
		}
	}


}