<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function idSearch(){
		if(document.getElementById("mem_name").value==""){
			alert("이름을 입력하세요")
			return false;
		}
		if(document.getElementById("mem_email").value==""){
			alert("이메일을 입력하세요")
			return false;
		}
		return true;
	}
</script>
<main>
	<h1>아이디 찾기</h1>
	<form method="post" action="/smhrd/register/idSearchResult" onsubmit="return idSearchResult()">
		<ul>
			<li>이름 : <input type="text" name="mem_name" /></li>
			<li>이메일 : <input type="email" name="mem_email" placeholder="예)sm7@smhrd.or.kr" /></li>
			<li> <input type="button" value="아이디찾기" /></li>
		</ul>
	</form>
</main>