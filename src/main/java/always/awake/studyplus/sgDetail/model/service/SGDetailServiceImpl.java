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
	public SGDetail selectOneGroup(int sgCode) {
		System.out.println("서비스");
		
		SGDetail sg = sgd.selectOneGroup(sqlSession, sgCode);
		
		System.out.println("서비스의 SGDetail : " + sg);
		return sg;
	}
	
	

}
