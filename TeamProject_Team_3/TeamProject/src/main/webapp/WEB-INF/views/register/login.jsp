<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function logChk(){
		if(document.getElementById("mem_id").value==""){
			alert("아이디를 입력하세요")
			return false;
		}
		if(document.getElementById("mem_password").value==""){
			alert("비밀번호를 입력하세요")
			return false;
		}
		return true;
	}
</script>
<main>
	<h1>로그인폼</h1>
	<form method="post" action="/smhrd/register/loginOk" onsubmit="return logChk()">
		<ul>
			<li><input type="text" name="mem_id" id="mem_id" placeholder="아이디입력"/></li>
			<li><input type="password" name="mem_password" id="mem_password" placeholder="비밀번호입력"/></li>
			<li><input type="submit" value="로그인" /></li>
			<li>
			<!-- 이름과 연락처를 입력받아 DB에서 아이디, 이메일을 조회 후 아이디를 이메일로 보낸다. -->
				<div><a href="/smhrd/register/idSearch">아이디 찾기</a>이메일로 보내기</div>
				<div><a href="/smhrd/register/passwordSearch">비밀번호 찾기</a></div>
				<div><a href="/smhrd/register/regForm">회원가입</a></div>
			</li>			
		</ul>
	</form>
</main>