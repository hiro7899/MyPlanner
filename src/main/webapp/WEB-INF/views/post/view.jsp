<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>
<style>
	.hide{
		display: none;
	}
</style>
</head>
<body>
	<div>
		<div>
			<h3>${item.name}</h3>
		</div>
		
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>내용</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>${item.detail}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div>
			<div>
				<div><button>댓글작성</button></div>
				<div class="hide"><jsp:include page="reply/add.jsp"></jsp:include></div>
			</div>
			<div>
			
			
				<div>
					<div><label>제품 이미지:</label></div>
					<c:if test="${item.photo == null || item.photo.size() < 1}">
						<div>제품이미지가 없습니다</div>
					</c:if>
									
					<c:forEach var="photo" items="${item.photo}">
						<div><img alt="제품 이미지" width="150" height="150" src="${pageContext.request.contextPath}/upload/${photo.uuid}_${photo.filename}"></div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div><a href="../list">이전</a></div>
	</div>
</body>
</html>