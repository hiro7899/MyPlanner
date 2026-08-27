package kr.ac.kopo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.PostDao;
import kr.ac.kopo.model.Post;
import kr.ac.kopo.model.Photo;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	PostDao dao;

	@Override
	public List<Post> list() {
		return dao.list();
	}
	
	@Transactional
	@Override
	public void add(Post item) {
		item.setPoint(0);
		
		dao.add(item);
		if(item.getPhoto() != null)
			for(Photo photo : item.getPhoto()) {
				photo.setPostId(item.getId());			
				dao.addPhoto(photo);
			}
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public Post item(String id) {
		return dao.item(id);
	}
	
	@Transactional
	@Override
	public void update(Post item) {
		dao.update(item);
		
		if(item.getPhoto() != null)
			for(Photo photo : item.getPhoto()) {
				photo.setPostId(item.getId());			
				dao.updatePhoto(photo);
			}
	}
	
	

}
