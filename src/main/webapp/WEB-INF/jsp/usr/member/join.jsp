<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>



<script type="text/javascript">
	var JoinForm__submitDone = false;

	function JoinForm__submit(form) {
		if (JoinForm__submitDone) {
			alert('이미 처리중입니다');
			return;
		}
		// 			form.loginId.value = form.loginId.value.trim();
		var loginId = form.loginId.value.trim();
		var loginPw = form.loginPw.value.trim();
		var loginPwConfirm = form.loginPwConfirm.value.trim();
		var name = form.name.value.trim();

		console.log('form.loginId.value : ' + loginId);
		console.log('form.loginPw.value : ' + loginPw);
		console.log('form.loginPwConfirm.value : ' + loginPwConfirm);
		console.log('form.name.value : ' + name);

		if (loginId.length == 0) {
			alert('아이디를 입력해주세요');

			return;
		}

		if (loginId.equal) {
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return;
		}

		if (loginPw.length == 0) {
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return;
		}
		if (loginPwConfirm.length == 0) {
			alert('비밀번호 확인을 입력해주세요');
			form.loginPwConfirm.focus();
			return;
		}

		if (loginPw != loginPwConfirm) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPw.focus();
			return;
		}

		if (name.length == 0) {
			alert('이름을 입력해주세요');
			form.name.focus();
			return;
		}

		JoinForm__submitDone = true;
		form.submit();

	}
</script>




<form method="POST" action="doLogin" onsubmit="LoginForm__submit(this); return false;">
	<div>
		아이디 : <input autocomplete="off" type="text" placeholder="아이디를 입력해주세요" name="loginId" required />
	</div>
	<div>
		비밀번호 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요" name="loginPw" required />
	</div>
	<div>
		비밀번호 중복체크 : <input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요" name="loginPw2" required />
	</div>
	<div>
		이름 : <input autocomplete="off" type="text" placeholder="이름 입력해주세요" name="name" required />
	</div>
	<div>
		닉네임 : <input autocomplete="off" type="text" placeholder="닉네임을 입력해주세요" name="nickname" required />
	</div>
	<div>
		휴대폰번호 : <input autocomplete="off" type="text" placeholder="번호를 입력해주세요" name="cellphoneNum" required />
	</div>
	<div>
		이메일 : <input autocomplete="off" type="text" placeholder="이메일을 입력해주세요" name="email" required />
	</div>



	<button type="submit">로그인</button>
</form>



<div>
	<a style="color: green" href="../article/list">리스트로 돌아가기</a>
</div>

<%@ include file="../common/foot.jspf"%>