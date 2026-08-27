package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.service.MemberService;

@Controller
public class RootController {
	
	@Autowired
	MemberService service;

	@GetMapping("/")
	String index() {
		return "index";
	}
	
	@GetMapping("/signup")
	String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	String signup(Member item) {
		service.signup(item);
		
		return "redirect:.";
	}
	
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(Member item, HttpSession session) {
		if(service.login(item)) {
			session.setAttribute("member", item);
			
			return "redirect:.";
		} else {
			return "redirect:login";
		}
	}
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		
		if(session != null)
			session.invalidate();
		
		return "redirect:.";
	}
	
	
}
