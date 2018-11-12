package always.awake.studyplus.need.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.need.model.dao.NeedDao;
import always.awake.studyplus.need.model.vo.Need;

@Service
public class NeedServiceImpl implements NeedService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	NeedDao nd;
	
	@Override
	public Need selectNeedData(int member_Code) {
		
		Need need = nd.selectNeedData(sqlSession, member_Code);
		
		return need;
	}

	@Override
	public void insertWater(int member_Code, String water) {
		
		nd.insertWater(sqlSession, member_Code, water);	
	}

	@Override
	public void updateLv(int member_Code, int i) {
		
		nd.updateLv(sqlSession, member_Code, i);	
	}

	@Override
	public void initGiveLove(int member_Code) {
		
		nd.initGiveLove(sqlSession, member_Code);
	}

	@Override
	public void initNeed(int member_Code) {
		
		nd.initNeed(sqlSession, member_Code);
	}

}
