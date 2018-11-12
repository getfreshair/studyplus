package always.awake.studyplus.need.model.service;

import always.awake.studyplus.need.model.vo.Need;

public interface NeedService {

	Need selectNeedData(int member_Code);

	void insertWater(int member_Code, String water);

	void updateLv(int member_Code, int i);

	void initGiveLove(int member_Code);

	void initNeed(int member_Code);

}
