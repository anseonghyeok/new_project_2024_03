<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Article Modify"></c:set>
<%@ include file="../common/head.jspf"%>



<div>번호 : ${article.id}</div>
<div>날짜 : ${article.regDate}</div>


<form method="POST" action="doModify">
	<input type="hidden" value="${id}" name="id" />

	<div>기존제목 : ${article.title}</div>
	<div>
		제목 : <input type="text" name="title" value="">
	</div>

	<div>기존내용 : ${article.body}</div>
	<div>
		내용 : <input type="text" name="body" value="">
		<!-- 	<textarea type="text" name="body"></textarea> -->
	</div>
	<button type="submit">수정</button>
</form>


<div>
	<a style="color: green" href="list">리스트로 돌아가기</a>
</div>



<%@ include file="../common/foot.jspf"%>