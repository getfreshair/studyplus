package always.awake.studyplus.sgDetail.model.service;

import always.awake.studyplus.sgDetail.model.vo.SGDetail;

public interface SGDetailService {

	public SGDetail selectOneGroup(int sgCode, int userCode);

	public int selectGrJoinStatus(int sgCode, int userCode);
	
	
	
		
}
