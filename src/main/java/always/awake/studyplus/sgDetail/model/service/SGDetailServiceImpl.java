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
	public int selectJoinStatus(int sgCode, int memCode) {
		System.out.println("가입여부 확인 서비스");
		
		int joinStatus = gd.selectJoinStatus(sqlSession, sgCode, memCode);
		System.out.println("joinStatus 확인 서비스 : " + joinStatus);
		
		return joinStatus;
	}
	
	@Override
	public SGDetail selectOneGroup(int sgCode, int joinStatus) {
		System.out.println("그룹 디테일 조회하는 서비스");
		
		SGDetail group = gd.selectOneGroup(sqlSession, sgCode, joinStatus);
		
		System.out.println("그룹 디테일 조회하는 서비스의 SGDetail : " + group.toString());
		
		return group;
	}

	
	

}
