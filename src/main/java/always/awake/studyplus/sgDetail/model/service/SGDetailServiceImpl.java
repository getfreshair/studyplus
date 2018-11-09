package always.awake.studyplus.sgDetail.model.service;

import java.util.HashMap;
import java.util.List;

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
	public int selectJoinStatus(int grCode, int memCode) {
		int joinStatus = gd.selectJoinStatus(sqlSession, grCode, memCode);
		System.out.println("가입여부 확인 서비스 res -> joinStatus : < " + joinStatus + " >");
		return joinStatus;
	}
	
	@Override
	public SGDetail selectOneGrDetailJoinBefore(int grCode) {
		SGDetail group = gd.selectOneGrDetailJoinBefore(sqlSession, grCode);
		return group;
	}

	@Override
	public SGDetail selectOneJoinGrDetailTop(int grCode, int memCode) {
		SGDetail joinGrTop = gd.selectOneJoinGrDetailTop(sqlSession, grCode, memCode);
		return joinGrTop;
	}

	@Override
	public int selectJoinAbleChk(int grCode) {
		int joinAbleCnt = gd.selectJoinAbleChk(sqlSession, grCode);
		return joinAbleCnt;
	}

	@Override
	public int insertGroupJoin(int grCode, int memCode) {
		int groupJoin = gd.insertGroupJoin(sqlSession, grCode, memCode);
		return groupJoin;
	}

	@Override
	public List<HashMap<String, Object>> selectGroupMemberList(int grCode) {
		List<HashMap<String, Object>> memberList = gd.selectGroupMemberList(sqlSession, grCode);
		return memberList;
	}

	@Override
	public int updateChangeLeader(int grCode, int afterLeaderCode, int nowLeaderCode) {
		int updateChangeResult = gd.updateChangeLeader(sqlSession, grCode, afterLeaderCode, nowLeaderCode);
		return updateChangeResult;
	}

	@Override
	public int updateDeleteGroupMember(int grCode, int delMemCode) {
		int updateDelResult = gd.updateDeleteMember(sqlSession, grCode, delMemCode);
		return updateDelResult;
	}
	
	
	
	

}
