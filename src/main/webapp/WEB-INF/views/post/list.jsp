<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<div>
			<h3>게시물 관리</h3>
		</div>
		
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>게시물번호</th>
						<th>작성자</th>
						<th>게시물 제목</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>좋아요</th>
						<th>관리</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="7">작성된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td><a href="view/${item.id}">${item.id}</a></td>
							<td>${item.memberId}</td>
							<td>${item.name}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${item.updateDate}" pattern="yyyy-MM-dd"/></td>
							<td>${item.point}</td>
							<td><a href="update/${item.id}"><button>변경</button></a>
								<a href="delete/${item.id}"><button>삭제</button></a></td>
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