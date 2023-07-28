<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.mEdit li{
		margin:5px;
	}
	.mEdit input[type="text"] {
		border-top: none;
	    border-left: none;
	    border-right: none;
	    border-bottom: 1px solid black;
	}

</style>
<main>
	<div class="wrapper" >
	<h2>${dto.mem_name}님의 정보 수정</h2>
	<form method="post" action="/smhrd/admin/memberEditOk" class="mEdit">
		<ul>
			<li>아이디&nbsp;&nbsp;<input type="text" name="mem_id" value="${dto.mem_id}" readonly></li>
			<li>이름&nbsp;&nbsp;<input type="text" name="mem_name" value="${dto.mem_name}" readonly></li>
			<li>분류&nbsp;&nbsp;<input type="text" name="mem_type" value="${dto.mem_type}"></li>
			<li>나이&nbsp;&nbsp;<input type="text" name="mem_age" value="${dto.mem_age}" readonly></li>
			<li>이메일&nbsp;&nbsp;<input type="text" name="mem_email" value="${dto.mem_email}"></li>
			<li>기수번호&nbsp;&nbsp;<input type="text" name="mem_ca" value="${dto.mem_ca}" readonly></li>
			<li>인증여부&nbsp;&nbsp;<input type="text" name="mem_auth" value="${dto.mem_auth}"></li>
			<div>
			<li style="margin-top:15px; justify-content:right;">
				<input type="submit" value="수정" style="background-color:#00468C; color:white; border-radius:5px; margin-right:10px;"/>
				<a href="/smhrd/admin/memberView?id=${dto.mem_id}"><input type="button" value="이전" style="background-color:#00468C; color:white; border-radius:5px;"/></a>
			</li>
			</div>
		</ul>
	</form>
	</div>
</main>