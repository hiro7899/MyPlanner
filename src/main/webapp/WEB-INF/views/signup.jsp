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
			<form method="post" action="signup">
				<div>
					<div><label>아이디</label></div>
					<div><input type="text" name="id"></div>
				</div>
				
				<div>
					<div><label>비밀번호</label></div>
					<div><input type="text" name="passwd"></div>
				</div>
				
				<div>
					<div><label>이름</label></div>
					<div><input type="text" name="name"></div>
				</div>
				
				<div>
					<div><label>전화번호</label></div>
					<div><input type="tel" name="phone"></div>
				</div>
				
				<div>
					<div><label>이메일</label></div>
					<div><input type="text" name="email"></div>
				</div>
				
				<div>
					<div><button>확인</button></div>
					<div><a href=".."><button type="button">취소</button></a></div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>