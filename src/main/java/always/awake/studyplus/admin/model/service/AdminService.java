package always.awake.studyplus.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import always.awake.studyplus.admin.model.vo.Member;

public interface AdminService {

	public List<Member> searchMember(Map<String, Object> map);
}
