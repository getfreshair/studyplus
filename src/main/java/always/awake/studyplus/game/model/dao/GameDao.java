package always.awake.studyplus.game.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import always.awake.studyplus.game.model.vo.PlayGameUsers;

public interface GameDao {
	public int inusertGameUserInfo(SqlSessionTemplate sqlSession, int member_code);

	public int deleteGameUserInfo(SqlSessionTemplate sqlSession, int member_code);

	public List<Object> selectGamePlayer(SqlSessionTemplate sqlSession, int member_code);

	public List<Integer> selectGamePlayerList(SqlSessionTemplate sqlSession);

}
