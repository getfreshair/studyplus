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
	private SGDetailDao gd;
	
	@Override
	public int selectJoinStatus(int memCode) {
		System.out.println("서비스");
		
		int joinStatus = gd.selectJoinStatus(sqlSession, memCode);
		
		return joinStatus;
	}
	
	@Override
	public SGDetail selectOneGroup(int sgCode) {
		System.out.println("서비스");
		
		SGDetail group = gd.selectOneGroup(sqlSession, sgCode);
		
		System.out.println("서비스의 SGDetail : " + group.toString());
		return group;
	}


	
	

}
