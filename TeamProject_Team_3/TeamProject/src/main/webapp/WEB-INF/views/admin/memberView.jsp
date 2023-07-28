<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main>
	<div class="memberD">
	<h2 style="text-align:center;">학생 상세 정보</h2>
	<ul>
		<form style="padding:20px; font-size:1.1em; border:1px solid #bebebe; border-radius:5px;">
		<li># 아이디 : ${member.mem_id }</li>
		<li># 이름 :  ${member.mem_name}</li>
		<c:if test="${member.mem_type == 1}">
			<li># 분류 : 학생</li>
		</c:if>
		<c:if test="${member.mem_type == 2}">
			<li># 분류 : 선생님</li>
		</c:if>
		<c:if test="${member.mem_type == 3}">
			<li># 분류 : 관리자</li>
		</c:if>
		
		<li># 나이 : ${member.mem_age}</li>
		<li># 이메일 : ${member.mem_email}</li>
		<li># 기수 번호 : ${member.mem_ca}</li>
		<li># 인증 여부 : ${member.mem_auth }</li>
		<li style="justify-content:right;">
			<div style="margin-top:15px;">
				<a href="/smhrd/admin/memberEdit?id=${member.mem_id}"><input type="button" value="수정" style="background-color:#00468C; color:white; border-radius:5px;"/></a>
				<a href="/smhrd/admin/adminList"><input type="button" value="목록" style="background-color:#00468C; color:white; border-radius:5px;"/></a>
			</div>
		</li>
		</form>
	</ul>
	</div>
</main>