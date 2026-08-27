package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Post;

public interface PostService {

	List<Post> list();

	void add(Post item);

	void delete(String id);

	Post item(String id);

	void update(Post item);

}
