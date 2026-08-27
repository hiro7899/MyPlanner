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
			<h3>회원 관리</h3>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>역할</th>
						<th>관리</th>
					</tr>		
				</thead>
				
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="7">검색 된 플랜이 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.id}</td>
							<td>${item.passwd}</td>
							<td>${item.name}</td>
							<td>${item.tel}</td>
							<td>${item.email}</td>
							<td>${item.role}</td>
							<td><a href="delete/${item.id}"><button>삭제</button></a>
							<a href="update/${item.id}"><button>변경</button></a></td>
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