package always.awake.studyplus.block.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.block.model.dao.BlockDao;
import always.awake.studyplus.block.model.vo.StudyTimeInfo;

@Service
public class BlockServiceImpl implements BlockService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BlockDao bd;
	
	// 그룹,목표 리스트 조회용 메소드
	@Override
	public HashMap<String,Object> selectStudyTimes(int member_Code) {
		HashMap<String,Object> dataMap = new HashMap<String,Object>();
		
		List goalList = bd.selectGoalTimes(sqlSession, member_Code);
		List groupList = bd.selectGroupTimes(sqlSession,member_Code);
		int todayStudyTime = bd.selectTodayStudyTime(sqlSession, member_Code);

		dataMap.put("goalList", goalList);
		dataMap.put("groupList",groupList);
		dataMap.put("todayStudyTime",todayStudyTime);
		
		return dataMap;
		
	}

	// 공부 시간 저장용 메소드
	@Override
	public int insertStudyTimes(HashMap<String, ArrayList<StudyTimeInfo>> list, int member_Code) {
		// 리턴값 저장용 변수 쓰레기값으로 초기화
		int result = -99;
		int result1 = -99;
		int result2 = -99;
		
		if(list.get("goalTimeList") != null) {
			result1 = bd.updateGoalStudyTime(sqlSession,list.get("goalTimeList"));
		}
	/*	if(list.get("studyTimeList") != null) {
			result2 = bd.insertStudyTime(sqlSession, list.get("studyTimeList"));
		}
		
		if ((result1 > 0 || result1 == -99 ) 
				&& (result2 > 0 || result2 == -99 )) {
			result = 1;
		} else {
			result = 0;
		}*/
		
		return result;
	}
}
