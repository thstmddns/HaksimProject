<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<main>
	<h1>학생 상세 조회</h1>
	<ul>
		<li>아이디 : ${member.mem_id }</li>
		<li>이름 :  ${member.mem_name}</li>
		
		<c:if test="${member.mem_type == 0}">
			<li>분류 : 미인증</li>
		</c:if>
		<c:if test="${member.mem_type == 1}">
			<li>분류 : 학생</li>
		</c:if>
		<c:if test="${member.mem_type == 2}">
			<li>분류 : 수료생</li>
		</c:if>
		<c:if test="${member.mem_type >= 4}">
			<li>분류 : 관리자</li>
		</c:if>
		
		<li>나이 : ${member.mem_age}</li>
		<li>이메일 : ${member.mem_email}</li>
		<li>기수번호 : ${member.mem_ca}</li>
		<li>인증여부 : ${member.mem_auth }</li>
		<li>
			<div>
				<a href="/smhrd/admin/memberEdit?id=${member.mem_id}"><input type="button" value="수정"/></a>
				<a href="/smhrd/admin/adminList"><input type="button" value="목록"/></a>
			</div>
		</li>
	</ul>
</main>