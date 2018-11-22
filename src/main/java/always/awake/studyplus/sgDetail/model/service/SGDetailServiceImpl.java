package always.awake.studyplus.sgDetail.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.sgDetail.model.dao.SGDetailDao;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Service
public class SGDetailServiceImpl implements SGDetailService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SGDetailDao gd;
	
	@Override
	public int selectJoinStatus(int grCode, int memCode) {
		int joinStatus = gd.selectJoinStatus(sqlSession, grCode, memCode);
		System.out.println("가입여부 확인 서비스 res -> joinStatus : < " + joinStatus + " >");
		return joinStatus;
	}
	
	@Override
	public SGDetail selectOneGrDetailLeftTop(int grCode) {
		SGDetail grLeftTop = gd.selectOneGrDetailLeftTop(sqlSession, grCode);
		return grLeftTop;
	}
	
	@Override
	public SGDetail selectOneGrDetailRightTop(int grCode) {
		SGDetail grRightTop = gd.selectOneGrDetailRightTop(sqlSession, grCode);
		return grRightTop;
	}
	
	@Override
	public SGDetail selectOneJoinGrDetailTop(int grCode, int memCode) {
		SGDetail joinGrTop = gd.selectOneJoinGrDetailTop(sqlSession, grCode, memCode);
		return joinGrTop;
	}

	@Override
	public int selectJoinAbleChk(int grCode) {
		int joinAbleCnt = gd.selectJoinAbleChk(sqlSession, grCode);
		return joinAbleCnt;
	}

	@Override
	public int insertGroupJoin(int grCode, int memCode) {
		int groupJoin = gd.insertGroupJoin(sqlSession, grCode, memCode);
		return groupJoin;
	}

	@Override
	public List<HashMap<String, Object>> selectGroupMemberList(int grCode) {
		List<HashMap<String, Object>> memberList = gd.selectGroupMemberList(sqlSession, grCode);
		System.out.println("1번 메뉴 service result : \n" + memberList);
		return memberList;
	}

	@Override
	public int updateChangeLeader(int grCode, int afterLeaderCode, int nowLeaderCode) {
		int updateChangeResult = gd.updateChangeLeader(sqlSession, grCode, afterLeaderCode, nowLeaderCode);
		return updateChangeResult;
	}

	@Override
	public int updateDeleteGroupMember(int grCode, int delMemCode) {
		int updateDelResult = gd.updateDeleteMember(sqlSession, grCode, delMemCode);
		return updateDelResult;
	}

	@Override
	public HashMap<String, Object> selectChangeDatesInfo(int changeDates) {
		HashMap<String, Object> selectChangeDates =  gd.selectChangeDatesInfo(sqlSession, changeDates);
		return selectChangeDates;
	}

	@Override
	public HashMap<String, Object> selectChangeMonthsInfo(int changeMonths) {
		HashMap<String, Object> selectChangeDates =  gd.selectChangeMonthsInfo(sqlSession, changeMonths);
		return selectChangeDates;
	}

	@Override
	public List<HashMap<String, Object>> selectGroupMemberRankList(int grCode, String thisDay, int periodType) {
		List<HashMap<String, Object>> list = gd.selectGroupMemberRankList(sqlSession, grCode, thisDay, periodType);
		System.out.println("2번 메뉴 service result : \n" + list);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectGroupMemberTimeList(int grCode, String thisDay) {
		List<HashMap<String, Object>> list = gd.selectGroupMemberTimeList(sqlSession, grCode, thisDay);
		System.out.println("3번 메뉴 service result : \n" + list);
		return list;
	}

	@Override
	public int insertGroupBoardWrite(int grCode, String contents, int loginUserCode, int boardType) {
		int insertResult =  gd.insertGroupBoardWrite(sqlSession, grCode, contents, loginUserCode, boardType);
		return insertResult;
	}

	@Override
	public void studygroupModify(Map<String, Object> studygroupInfo) {
		gd.studygroupModify(sqlSession, studygroupInfo);
	}

}
