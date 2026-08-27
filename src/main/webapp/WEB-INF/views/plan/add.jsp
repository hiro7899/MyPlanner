<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/add.css">
</head>
<body>
	<header>
		<jsp:include page="../nav/nav.jsp"></jsp:include>
	</header>
	<div class="container">
		<div class="mt-5">
			<h3>플래너 추가</h3>
		</div>
		
		<div>
			<form method="post">
				<div class="mt-3 mb-3">
					<div><input type="text" name="name" placeholder="제목"></div>
				</div>
				
				<div class="buttons">
					<div><a href="user_add"><button class="btn btn-sm btn-primary">추가</button></a></div>
					<div><a href="list"><button class="btn btn-sm btn-secondary" type="button">취소</button></a></div>
				</div>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="../foot.jsp"></jsp:include>
	</footer>
</body>
</html>