package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.Plan;
import kr.ac.kopo.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {
	final String path = "plan/";

	@Autowired
	PlanService service;
	
	@GetMapping("/list")
	String list(Model model) {
		
		List<Plan> list = service.list();
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(@SessionAttribute Member member, Model model, Plan item) {
		
		item.setMemberId(member.getId());
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/delete/{id}")
	String delete(@PathVariable String id) {
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/view/{id}")
	String view(@PathVariable Long id, Model model) {
		Plan item = service.item(id);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
	@GetMapping("/mypage")
	String mypage(@SessionAttribute(required= false) Member member, Model model, Plan item) {
		List<Plan> list = service.list(member.getId());
		model.addAttribute("list", list);
		
		return  path + "mypage";
	}
	
	@GetMapping("/user_add")
	String userAdd(@SessionAttribute Member member) {
		return path + "add";
	}
	
	@PostMapping("/user_add")
	String userAdd(@SessionAttribute Member member, Model model, Plan item) {
		item.setMemberId(member.getId());
		
		service.add(item);
		
		return "redirect:mypage";
	}
	
	@GetMapping("/user_delete/{id}")
	String userDelete(@PathVariable String id) {
		service.delete(id);
		
		return "redirect:../mypage";
	}
}
