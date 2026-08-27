<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	.error{
		color : red;
	}
</style>
</head>
<body>
	<div>
		<div>
			<h3>회원 추가</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<div><label>아이디:</label></div>
					<div><form:input path="member.id" type="text" name="id"></form:input></div>
					<div class="error"><form:errors path="member.id"></form:errors></div>
				</div>
				
				<div>
					<div><label>비밀번호:</label></div>
					<div><form:input path="member.passwd" type="text" name="passwd"></form:input></div>
					<div class="error"><form:errors path="member.passwd"></form:errors></div>
				</div>
				
				<div>
					<div><label>이름:</label></div>
					<div><form:input path="member.name" type="text" name="name"></form:input></div>
					<div class="error"><form:errors path="member.name"></form:errors></div>
				</div>
				
				<div>
					<div><label>전화번호:</label></div>
					<div><form:input path="member.tel" type="text" name="tel"></form:input></div>
					<div class="error"><form:errors path="member.tel"></form:errors></div>
				</div>
				
				<div>
					<div><label>이메일:</label></div>
					<div><input type="text" name="email"></div>
				</div>
				
				<div>
					<div><label>역할:</label></div>
					<div><input type="number" name="role" value="1"></div>
				</div>
				
				<div><button>추가</button></div>
				<div><a href="../ list">취소</a></div>
			</form>
		</div>
	</div>
</body>
</html>