<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<title>마이페이지</title>
</head>
<body>
	<header>
		<jsp:include page="../nav/nav.jsp"></jsp:include>
	</header>
	
	<div class="container">
		<c:if test="${list.size() >= 1}">
			<div>
				<button id="active_update" type="button">플래너 관리</button>
			</div>
		</c:if>
		
		<div class="items">
			<div>
				<c:if test="${list.size() < 1}">
					<div></div>
				</c:if>
				
				<c:forEach var="item" items="${list}">
					<div>
						<div><a href="view/${item.id}"><button class="plan">${item.name}</button></a></div>
						<div class="hide">
							<div class="delete"><a href="user_delete/${item.id}">삭제</a></div>
							<div class="update"><a href="user_update/${item.id}">이름변경</a></div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div>
				<div><a href="user_add"><button id="add_button"><img alt="플랜 만들기" src="/resources/images/mypage/plus.svg"></button></a></div>
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../foot.jsp"></jsp:include>
	</footer>
</body>
</html>