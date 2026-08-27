package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Plan;

public interface PlanService {

	List<Plan> list();

	void add(Plan item);

	void delete(String id);

	Plan item(Long id);

	List<Plan> list(String memberId);

}
