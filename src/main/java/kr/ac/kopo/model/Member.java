package kr.ac.kopo.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

public class Member {
	
	@Min(value = 4, message = "아이디는 4자리 이상이어야 합니다")
	@Max(value = 16, message = "아이디는 16자리 이하여야 합니다")
	@NotEmpty(message = "아이디를 입력하셔야 합니다")
	private String id;
	
	@Min(value = 4, message = "비밀번호는 4자리 이상이어야 합니다")
	@Max(value = 16, message = "비밀번호는 16자리 이하여야 합니다")
	@NotEmpty(message = "비밀번호를 입력하셔야 합니다")
	private String passwd;
	
	@NotEmpty(message = "이름을 입력하셔야 합니다")
	private String name;
	
	@NotEmpty(message = "전화번호를 입력하셔야 합니다")
	private String tel;
	private String email;
	private Integer role;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	
}
