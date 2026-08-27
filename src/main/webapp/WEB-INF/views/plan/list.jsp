<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<div>
			<h3>플래너</h3>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>플랜번호</th>
						<th>작성자</th>
						<th>플랜이름</th>
						<th>관리</th>
					</tr>		
				</thead>
				
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="4">검색 된 플랜이 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.id}</td>
							<td>${item.memberId}</td>
							<td><a href="view/${item.id}">${item.name}</a></td>
							<td><a href="delete/${item.id}">삭제</a><a href="update/${item.id}">변경</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<div><a href="add">추가</a></div>
			<div><a href="..">이전</a></div>
		</div>
	</div>
</body>
</html>