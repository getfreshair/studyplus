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

}
