package always.awake.studyplus.sgDetail.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

//	public List<HashMap<String, Object>> selectGroupMemberRankList(int grCode, Date date, int periodType);


	
	
	
		
}
