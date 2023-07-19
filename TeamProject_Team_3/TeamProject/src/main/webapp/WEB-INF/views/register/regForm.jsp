<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
	<h1>회원가입폼</h1>
	<form method="post" action="/smhrd/register/registerOk">
		<ul>
			<li>아이디 : <input type="text" name="mem_id" id="mem_id" /></li>
			<li>비밀번호 : <input type="password" name="mem_password" id="mem_password" /></li>
			<li>비밀번호 확인 : <input type="password" name="mem_password2" id="mem_password2" /></li>
			<li>나이 : <input type="text" name="mem_age" id="mem_age" /></li>
			<li>이메일 : <input type="email" name="mem_email" id="mem_email" /></li>
			<li>이름 : <input type="text" name="mem_name" id="mem_name" /></li>
  			<li>기수 타입 : <input type="text" name="mem_ca" id="mem_ca" /></li>
			<li><button>회원가입하기</button></li>
		</ul>
	</form>
</main>