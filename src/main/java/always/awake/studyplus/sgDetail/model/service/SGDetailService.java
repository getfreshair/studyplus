package always.awake.studyplus.sgDetail.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public int selectJoinStatus(int grCode, int memCode);

	public SGDetail selectOneGrDetailLeftTop(int grCode);

	public SGDetail selectOneGrDetailRightTop(int grCode);

	public SGDetail selectOneJoinGrDetailTop(int grCode, int memCode);

	public int selectJoinAbleChk(int grCode);

	public int insertGroupJoin(int grCode, int memCode);

	public List<HashMap<String, Object>> selectGroupMemberList(int grCode);

	public int updateChangeLeader(int grCode, int afterLeaderCode, int nowLeaderCode);

	public int updateDeleteGroupMember(int grCode, int delMemCode);

	public HashMap<String, Object> selectChangeDatesInfo(int changeDates);

	public HashMap<String, Object> selectChangeMonthsInfo(int changeMonths);

	public List<HashMap<String, Object>> selectGroupMemberRankList(int grCode, String thisDay, int periodType);

	public List<HashMap<String, Object>> selectGroupMemberTimeList(int grCode, String thisDay);

	public List<HashMap<String, Object>> selectGroupBoardList(int grCode, int loginUserCode);

	public int insertGroupBoardWrite(int grCode, String contents, int loginUserCode, int boardType);

	public List<HashMap<String, Object>> selectOneBoardDetailShow(int grCode, int boardCode);

	public List<HashMap<String, Object>> selectBoardReply(int boardCode);

	public HashMap<String, Object> selectBoardTopInfo(int boardCode, int grCode, int loginUserCode);

	public int insertReply(int boardCode, String replyContent, int loginUserCode);

}
