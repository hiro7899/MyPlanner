package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Plan;

@Repository
public class PlandaoImpl implements Plandao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Plan> list() {
		return sql.selectList("plan.list");
	}

	@Override
	public void add(Plan item) {
		sql.insert("plan.add", item);
	}

	@Override
	public void delete(String id) {
		sql.delete("plan.delete", id);
	}

	@Override
	public Plan item(Long id) {
		return sql.selectOne("plan.item", id);
	}

	@Override
	public List<Plan> list(String memberId) {
		return sql.selectList("plan.user_list", memberId);
	}
}
