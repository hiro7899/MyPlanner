<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<div>
		<div>
			<h3>게시글 작성</h3>
		</div>
		
		<div>
			<form method="post">
				<div>
					<div><label>제목</label></div>
					<div><input type="text" name="name"></div>
				</div>
				
				<div>
					<div><label>내용</label></div>
					<div><textarea name="detail"></textarea></div>
				</div>
				
				<div>
					<div><label>카테고리</label></div>
					<div><input type="number" name="category"></div>
				</div>
				
				<div>
					<div><label>이미지 추가</label></div>
					<div><input type="file" name="uploadFile"></div>
				</div>
				
				<div><a href="add"><button>추가</button></a></div>
				<div><a href="list"><button type="button">취소</button></a></div>
			</form>
		</div>
	</div>
</body>
</html>