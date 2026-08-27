package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Member;

public interface MemberDao {

	List<Member> list();

	void add(Member item);

	void delete(String id);
	
	void update(Member item);

	Member item(String id);


}
