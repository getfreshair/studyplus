package always.awake.studyplus.game.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import always.awake.studyplus.game.model.dao.GameDao;

@Service
public class GameServiceImpl implements GameService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private GameDao gd;

	@Override
	public int inusertGameUserInfo(int member_code) {
		return gd.inusertGameUserInfo(sqlSession, member_code);
	}

	@Override
	public int deleteGameUserInfo(int member_code) {
		return gd.deleteGameUserInfo(sqlSession, member_code);
	}

	@Override
	public List<Object> selectGamePlayer(int member_code) {
		// TODO Auto-generated method stub
		return gd.selectGamePlayer(sqlSession,member_code);
	}
	@Override
	public List<Integer> selectGamePlayerList() {
		// TODO Auto-generated method stub
		return gd.selectGamePlayerList(sqlSession);
	}
}
