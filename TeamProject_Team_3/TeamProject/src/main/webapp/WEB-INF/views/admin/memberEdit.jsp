<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<main>
	<h1>${dto.mem_name} 정보 수정</h1>
	<form method="post" action="/smhrd/admin/memberEditOk">
		<ul>
			<li>아이디 : <input type="text" name="mem_id" value="${dto.mem_id}" readonly></li>
			<li>이름 : <input type="text" name="mem_name" value="${dto.mem_name}" readonly></li>
			<li>분류 : <input type="text" name="mem_type" value="${dto.mem_type}"></li>
			<li>나이 : <input type="text" name="mem_age" value="${dto.mem_age}"></li>
			<li>이메일 : <input type="text" name="mem_email" value="${dto.mem_email}"></li>
			<li>기수번호 : <input type="text" name="mem_ca" value="${dto.mem_ca}" readonly></li>
			<li>인증여부 : <input type="text" name="mem_auth" value="${dto.mem_auth}"></li>
			<li>
				<input type="submit" value="수정">
				<a href="/smhrd/admin/memberView?id=${dto.mem_id}"><input type="button" value="이전"></a>
			</li>
		</ul>
	</form>
</main>