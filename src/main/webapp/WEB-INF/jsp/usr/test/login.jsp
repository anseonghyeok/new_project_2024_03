<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login"></c:set>
<%@ include file="../common/head.jspf"%>








	<script src='<c:url value="/resources/js/member/member.js"/>'></script>
<center>
<div class="login">
  <form action="../member/doLogin" method="POST">        
            <input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" /><hr width="300" color="gray"><Br>
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" name="loginId" autocomplete="off"></td>
	</tr>
	<tr>
		<td>PW</td>
		<td><input type="password" name="loginPw" autocomplete="off"></td>
	</tr>
	</form>
	<tr align="center">
    <td colspan="2">
        <br>
        <a href="../test/findid" class="btn" style="width: 70px;">아이디 찾기</a>&nbsp;
        <input type="submit" value="로그인" class="btn" style="width: 70px;">&nbsp;
        <a href="../test/findpw" class="btn" style="width: 90px;">비밀번호 찾기</a>
    </td>
</tr>
</table>

  <div class="text-center mt-4">
            <p>아직 회원이 아니신가요? <a href="../test/join" class="text-blue-500">회원가입</a></p>
        </div>
</div>
</center>
<%@ include file="../common/foot.jspf"%>