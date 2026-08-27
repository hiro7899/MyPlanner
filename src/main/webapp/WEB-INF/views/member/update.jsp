<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<div>
			<h3>회원 추가</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<div><label>아이디: ${item.id}</label></div>					
				</div>
				
				<div>
					<div><label>비밀번호:</label></div>
					<div><input type="text" name="passwd" value="${item.passwd}"></div>
				</div>
				
				<div>
					<div><label>이름:</label></div>
					<div><input type="text" name="name" value="${item.name}"></div>
				</div>
				
				<div>
					<div><label>전화번호:</label></div>
					<div><input type="text" name="phone" value="${item.tel}"></div>
				</div>
				
				<div>
					<div><label>이메일:</label></div>
					<div><input type="text" name="email" value="${item.email}"></div>
				</div>
				
				<div>
					<div><label>역할:</label></div>
					<div><input type="number" name="role" value="${item.role}"></div>
				</div>
				
				<div><button>변경</button></div>
				<div><a href="../list">취소</a></div>
			</form>
		</div>
	</div>
</body>
</html>