package always.awake.studyplus.studyPlanner.model.service;

import java.util.HashMap;
import java.util.List;

public interface StudyPlannerService {

	//일간 공부량 차트
	List<HashMap<String, Object>> selectTodayChart(List<HashMap<String, Object>> list);
	
	//월간 공부량 차트
	List<HashMap<String, Object>> selectMonthlyChart(List<HashMap<String, Object>> list);


}
