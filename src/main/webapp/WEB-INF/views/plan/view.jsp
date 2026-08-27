<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.name}</title>
<link rel="stylesheet" type="text/css" href="/resources/css/calender.css">
</head>
<body>
	<header>
		<jsp:include page="../nav/nav.jsp"></jsp:include>
	</header>
	<div>
		<div class="title">
			<p>날짜를 클릭하면 계획을 작성할 수 있습니다.</p>
		</div>
		
		<div class="calendar">
			<div class="calendar_header">
				<button id="prev">◀</button>
				<h3 id="monthYear"></h3>
				<button id="next">▶</button>
			</div>
			<div class="calendar_body">
				<div class="weekdays" id="weekdays"></div>
				<div class="days" id="days"></div>
			</div>
			
			<!-- 팝오버 -->
			<div id="popover" class="popover" style="display: none;">
				<div class="popover-header">Plan</div>
				<div class="popover-body">
					<textarea id="plan-input" placeholder="계획을 입력해주세요"></textarea>
					<button id="save-plan">저장</button>
					<button id="close-popover">닫기</button>
				</div>
			</div>
		</div>
		<script src="/resources/js/calender.js"></script>
	</div>
	
	<footer>
		<jsp:include page="../foot.jsp"></jsp:include>
	</footer>
</body>
</html>