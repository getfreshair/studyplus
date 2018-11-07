package always.awake.studyplus.sgDetail.model.service;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public int selectJoinStatus(int grCode, int memCode);

	public SGDetail selectOneGrDetailJoinBefore(int grCode);

	public SGDetail selectOneJoinGrDetailTop(int grCode, int memCode);

	public int selectJoinAbleChk(int grCode);

	public int insertGroupJoin(int grCode, int memCode);

	
	
	
		
}
