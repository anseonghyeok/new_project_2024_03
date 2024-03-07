<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>



    <form action="find_id.kh" method="post">
        <div class="container w350 m50">
        <div>
            <div class="row center m30">
            <h1 class="title-text">아이디를 잊으셨나요?</h1>
        </div>
            <h5 class="middle-text-left">가입정보를 입력하면 아이디를 확인하실수 있습니다.</h5>
        </div>
        
        <!-- 이름(영문) 입력창 -->
        <div class="row center m20"> 
            <input type="text" name="loginId" required placeholder="아이디를 입력해주세요"  class="underline fill" autocomplete="off">
        </div>
        <div class="row center m20"> 
            <input type="text" name="nickname" required placeholder="휴대폰번호를 입력해주세요" class="underline fill" autocomplete="off">
        </div>
        
        <!--이메일 입력창 -->
        <div class="row center m20"> 
            <input type="email" name="email" required placeholder="이메일을 입력해주세요" class="underline fill" autocomplete="off">
        </div>
        
        <!--아이디찾기 버튼 -->
        <div class="row center m20">
            <button type="submit" class="btn fill">아이디 찾기</button>
        </div>
			    	<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">아이디가 존재하지 않습니다.</h3>	
		</div>
		<% } %>        
    </div>
</form>
		
<%@ include file="../common/foot.jspf"%>