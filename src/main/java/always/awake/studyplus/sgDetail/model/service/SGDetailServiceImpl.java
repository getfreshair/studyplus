package always.awake.studyplus.sgDetail.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.sgDetail.model.dao.SGDetailDao;
import always.awake.studyplus.sgDetail.model.vo.SGDetail;

@Service
public class SGDetailServiceImpl implements SGDetailService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SGDetailDao sgd;
	
	@Override
	public int selectGrJoinStatus(int sgCode, int userCode) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public SGDetail selectOneGroup(int sgCode, int userCode) {
		System.out.println("서비스");
		
		SGDetail sg = sgd.selectOneGroup(sqlSession, sgCode, userCode);
		
		System.out.println("서비스의 SGDetail : " + sg.toString());
		return sg;
	}


	
	

}
