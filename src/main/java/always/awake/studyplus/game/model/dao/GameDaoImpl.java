package always.awake.studyplus.game.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.game.model.vo.PlayGameUsers;

@Repository
public class GameDaoImpl implements GameDao {

	@Override
	public int inusertGameUserInfo(SqlSessionTemplate sqlSession, int member_code) {
		return sqlSession.insert("Game.inusertGameUserInfo",member_code);
	}
	
	@Override
	public int deleteGameUserInfo(SqlSessionTemplate sqlSession, int member_code) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Game.deleteGameUserInfo",member_code);
	}

	@Override
	public List<Object> selectGamePlayer(SqlSessionTemplate sqlSession, int member_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Game.selectGamePlayer",member_code);
	}

	@Override
	public List<Integer> selectGamePlayerList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Game.selectGamePlayerList");
	}
}
