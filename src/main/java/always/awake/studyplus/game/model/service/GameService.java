package always.awake.studyplus.game.model.service;

import java.util.ArrayList;
import java.util.List;

import always.awake.studyplus.game.model.vo.PlayGameUsers;

public interface GameService {
	public int inusertGameUserInfo(int member_code) ;

	public int deleteGameUserInfo(int member_Code);

	public List<Object> selectGamePlayer(int member_code);

	public List<Integer> selectGamePlayerList();
}
