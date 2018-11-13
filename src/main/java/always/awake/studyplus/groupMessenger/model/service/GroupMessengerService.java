package always.awake.studyplus.groupMessenger.model.service;

import java.util.List;
import always.awake.studyplus.member.model.vo.Member;

public interface GroupMessengerService {

	List<Member> selectGroupMemberList(int group_Code);

}
