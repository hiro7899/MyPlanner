package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Photo;
import kr.ac.kopo.model.Post;

@Repository
public class PostDaoImpl implements PostDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Post> list() {
		return sql.selectList("post.list");
	}

	@Override
	public void add(Post item) {
		sql.insert("post.add", item);
	}

	@Override
	public void delete(String id) {
		sql.delete("post.delete", id);
	}

	@Override
	public Post item(String id) {
		return sql.selectOne("post.item", id);
	}

	@Override
	public void update(Post item) {
		sql.update("post.update", item);
	}

	@Override
	public void addPhoto(Photo photo) {
		sql.insert("post.add_photo", photo);
		
	}

	@Override
	public void updatePhoto(Photo photo) {
		sql.update("post.add_photo", photo);
		
	}

}
