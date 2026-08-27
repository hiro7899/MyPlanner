package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Member;

public interface MemberService {

	List<Member> list();

	void add(Member item);

	void delete(String id);

	void signup(Member item);

	boolean login(Member item);

	Member item(String id);

	void update(Member item);

}
