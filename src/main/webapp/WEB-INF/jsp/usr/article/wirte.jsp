<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Article Write"></c:set>
<%@ include file="../common/head.jspf"%>




<form method="POST" action="doWrite">
	<input type="hidden" value="${memberId}" name="memberId" />

	<div>
		제목 : <input type="text" name="title" value="">
	</div>
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