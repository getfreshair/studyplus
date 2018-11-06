package always.awake.studyplus.sgDetail.model.service;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public int selectJoinStatus(int sgCode, int memCode);

	public SGDetail selectOneGrDetailTotal(int sgCode, int memCode, int joinStatus);

	public SGDetail selectOneJoinGrTop(int sgCode, int memCode);

	
	
	
		
}
