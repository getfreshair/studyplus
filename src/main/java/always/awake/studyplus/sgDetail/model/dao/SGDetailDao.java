package always.awake.studyplus.sgDetail.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailDao {

	int selectJoinStatus(SqlSessionTemplate sqlSession, int grCode, int memCode);

	SGDetail selectOneGrDetailLeftTop(SqlSessionTemplate sqlSession, int grCode);
	
	SGDetail selectOneGrDetailRightTop(SqlSessionTemplate sqlSession, int grCode);

	SGDetail selectOneJoinGrDetailTop(SqlSessionTemplate sqlSession, int grCode, int memCode);

	int selectJoinAbleChk(SqlSessionTemplate sqlSession, int grCode);

	int insertGroupJoin(SqlSessionTemplate sqlSession, int grCode, int memCode);

	List<HashMap<String, Object>> selectGroupMemberList(SqlSessionTemplate sqlSession, int grCode);

	int updateChangeLeader(SqlSessionTemplate sqlSession, int grCode, int afterLeaderCode, int nowLeaderCode);

	int updateDeleteMember(SqlSessionTemplate sqlSession, int grCode, int delMemCode);

	HashMap<String, Object> selectChangeDatesInfo(SqlSessionTemplate sqlSession, int changeDates);

	HashMap<String, Object> selectChangeMonthsInfo(SqlSessionTemplate sqlSession, int changeMonths);

	List<HashMap<String, Object>> selectGroupMemberRankList(SqlSessionTemplate sqlSession,
															int grCode, String thisDay, int periodType);



	
}