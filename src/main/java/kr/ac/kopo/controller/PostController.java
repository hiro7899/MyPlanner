package kr.ac.kopo.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.Post;
import kr.ac.kopo.model.Photo;
import kr.ac.kopo.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	final String path = "post/";
	final String uploadPath = "d:/upload/";
	
	@Autowired
	PostService service;
	
	@GetMapping("/list")
	String list(Model model) {
		
		List<Post> list = service.list();
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(@SessionAttribute Member member, @Valid Post item, BindingResult bindingResult) {
		if(bindingResult.hasErrors())
			return path + "valid/add";
		
		
		
		item.setMemberId(member.getId());
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/delete/{id}")
	String delete(@PathVariable String id) {
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/update/{id}")
	String update(@PathVariable String id, Model model) {
		Post item = service.item(id);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{id}")
	String update(@PathVariable String id, List<MultipartFile> uploadFile, @Valid Post item, BindingResult bindingResult) {
		
		for(MultipartFile file : uploadFile) {
			if(file != null && !file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				
				try {
					file.transferTo(new File(uploadPath + uuid + "_" + filename));
					
					Photo photo = new Photo();
					photo.setFilename(filename);
					photo.setUuid(uuid);
					
									
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(bindingResult.hasErrors())
			return path + "valid/update";
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/view/{id}")
	String view(@PathVariable String id, Model model) {
		Post item = service.item(id);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
		

}
