package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Photo;
import kr.ac.kopo.model.Post;

public interface PostDao {

	List<Post> list();

	void add(Post item);

	void delete(String id);

	Post item(String id);

	void update(Post item);

	void addPhoto(Photo photo);

	void updatePhoto(Photo photo);
	

}
