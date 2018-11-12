package always.awake.studyplus.need.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import always.awake.studyplus.need.model.vo.Need;

@Repository
public class NeedDaoImpl implements NeedDao{

	@Override
	public Need selectNeedData(SqlSessionTemplate sqlSession, int member_Code) {
		
		return sqlSession.selectOne("Need.selectNeedData", member_Code);
	}

	@Override
	public void insertWater(SqlSessionTemplate sqlSession, int member_Code, String water) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("water", Integer.parseInt(water));
		
		sqlSession.insert("Need.insertWater", hmap);
	}

	@Override
	public void updateLv(SqlSessionTemplate sqlSession, int member_Code, int i) {
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("member_Code", member_Code);
		hmap.put("need_Level", i);
		
		sqlSession.insert("Need.updateLv", hmap);	
	}

	@Override
	public void initGiveLove(SqlSessionTemplate sqlSession, int member_Code) {
		
		sqlSession.delete("Need.initGiveLove", member_Code);
	}

	@Override
	public void initNeed(SqlSessionTemplate sqlSession, int member_Code) {
		
		sqlSession.update("Need.initNeed", member_Code);
	}

}
