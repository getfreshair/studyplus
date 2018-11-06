package always.awake.studyplus.sgDetail.model.service;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public int selectJoinStatus(int grCode, int memCode);

	public SGDetail selectOneGrDetailTotal(int grCode, int memCode);

	public SGDetail selectOneJoinGrTop(int grCode, int memCode);

	public int selectJoinAbleChk(int grCode);

	public int insertGroupJoin(int grCode, int memCode);

	
	
	
		
}
