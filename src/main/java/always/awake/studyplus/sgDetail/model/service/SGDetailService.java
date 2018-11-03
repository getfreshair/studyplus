package always.awake.studyplus.sgDetail.model.service;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public int selectJoinStatus(int sgCode, int memCode);

	public SGDetail selectOneGroup(int sgCode, int joinStatus);

	
	
	
		
}
