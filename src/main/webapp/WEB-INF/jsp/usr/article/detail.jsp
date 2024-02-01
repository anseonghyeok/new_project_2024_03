<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTICLE</title>
</head>
<body>
	<h1>Detail</h1>

	<hr />

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>작성자</th>
				<th>닉네임</th>
				<th>수정 날짜</th>


			</tr>
		</thead>
		<tbody>

			<c var="article" items="${article}">
			<tr>
				<td>${article.id }</td>
				<td>${article.regDate.substring(0,10) }</td>
				<td>${article.title }</td>
				<td>${article.memberId }</td>
				<td>${article.nickname }</td>
				<td>${article.updateDate.substring(0,10) }</td>

			</tr>
			</c>
		</tbody>

	</table>

	<div>
		<a href="modify?id=${article.id }">수정</a> <a href="delete?id=${article.id }">삭제</a>
	</div>




</body>
</html>