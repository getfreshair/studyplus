package always.awake.studyplus.block.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.block.model.dao.BlockDao;

@Service
public class BlockServiceImpl implements BlockService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BlockDao bd;
	
	// 그룹,목표 리스트 조회용 메소드
	@Override
	public HashMap<String, ArrayList<Object>> selectStudyTimes(int member_Code) {
		HashMap<String, ArrayList<Object>> dataMap = null;
		
		List goalList = bd.selectGoalTimes(sqlSession, member_Code);
		List groupList = bd.selectGroupTimes(sqlSession,member_Code);
		
		System.out.println(goalList);
		System.out.println(groupList);
		
		return dataMap;
		
	}
}