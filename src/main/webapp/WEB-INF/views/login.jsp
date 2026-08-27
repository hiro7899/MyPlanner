<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
</head>
<body>
	<div>
		<header>
			<jsp:include page="nav/nav.jsp"></jsp:include>
		</header>
		
		<div id="color_logo">
			<a href=".."><img src="/resources/images/color_logo.svg"></a>
		</div>
		
		
		<div>
			<form method="post">
				<div>
					<div><input type="text" name="id" placeholder="아이디"></div>
				</div>	
				
				<div>
					<div><input type="password" name="passwd" placeholder="비밀번호"></div>
				</div>
				
				<div>
					<div><button>로그인</button></div>
				</div>
			</form>
		</div>
		
		<div class="find">
			<div><a href="#">아이디 찾기</a></div>
			<div class="color_binder"></div>
			<div><a href="#">비밀번호 찾기</a></div>
			<div class="color_binder"></div>
			<div><a href="signup">회원가입</a></div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="foot.jsp"></jsp:include>
	</footer>
</body>
</html>