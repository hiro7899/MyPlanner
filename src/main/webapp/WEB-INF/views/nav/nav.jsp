<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/resources/css/nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
</head>
<body>
	<div class="menu">
		<c:if test="${sessionScope.member == null}">
			<div id="logo">
				<a href=".."><img src="/resources/images/nav/logo.png"></a>
			</div>
			
			<div id="post">
				<a href="post/list">공유게시판</a>
			</div>
				
			<div id="recommend">
				<a href="post/recommend/list">여행지추천</a>
			</div>
			
			<div id="question">
				<a href="#"><img src="/resources/images/nav/question.png"></a>
			</div>
				
			<div id="login">
				<a href="login"><img src="/resources/images/nav/login_button.png"></a>
			</div>
			
			<div id="signup">
				<a href="signup">회원가입</a>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.member != null}">
			<div id="logo">
				<a href=".."><img src="/resources/images/nav/logo.png"></a>
			</div>
			
			<div id="post">
				<a href="post/list">공유게시판</a>
			</div>
				
			<div id="recommend">
				<a href="post/recommend/list">여행지추천</a>
			</div>
			
			<div id="question">
				<a href="#"><img src="/resources/images/nav/question.png"></a>
			</div>

			<div id="member">
				<div><a href="plan/mypage">${sessionScope.member.name}님의 Planner</a></div>
			</div>
			
			<div>
				<div><a href="/logout">로그아웃</a></div>
			</div>
		</c:if>
	</div>
</body>
</html>