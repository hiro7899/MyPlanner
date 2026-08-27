package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.Plandao;
import kr.ac.kopo.model.Plan;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	Plandao dao;
	
	@Override
	public List<Plan> list() {
		return dao.list();
	}

	@Override
	public void add(Plan item) {
		dao.add(item);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public Plan item(Long id) {
		return dao.item(id);
	}

	@Override
	public List<Plan> list(String memberId) {
		return dao.list(memberId);
	}

}
