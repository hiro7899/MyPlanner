<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
</head>
<body>
	<div>
		<header>
			<jsp:include page="nav/main_nav.jsp"></jsp:include>
	
			<div id="visual">
				<div id="main_text">당신이 원하는 모든 플랜</div>
	
				<div id="cont_text">스터디 플랜, 여행 계획 등 내가 원하는 모든 플랜을 만들어 보세요</div>
	
				<div id="main_btn"><a href="plan/mypage"><img alt="플래너 만들기" src="/resources/images/main/main_btn.png"></a></div>
			</div>
		</header>
		
		<div class="sub_visual">
			<div id="sub_visual_1"><img src="/resources/images/main/sub_image_1.jpg"></div>
			<div id="sub_visual_2"><img src="/resources/images/main/sub_image_2.jpg"></div>
			<!-- clear 클래스는 float 클리어용  -->
			<div class="clear"></div>
		</div>
		
		<!--  
		<div>
			<div class="post">
				<div>공유게시판</div>
				<div>나만의 계획을 공유해보세요</div>
			</div>
			
			<div class="first_card">
				<div>
					<p>인기 게시글</p>
					<div class="right_arrow"></div>
				</div>
				
				<div>
				</div>
			</div>
			
			<div class="second_card">
				
			</div>
		</div>
		-->
		
		
		<div>
			<c:if test="${sessionScope != null && member.role == 99}">
				<div>
					<ul>
						<li><a href="plan/list">플래너 관리</a></li>
						<li><a href="member/list">회원 관리</a></li>
						<li><a href="post/list">게시글 관리</a></li>
					</ul>
				</div>
			</c:if>
		</div>
		
		<footer>
			<jsp:include page="foot.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>