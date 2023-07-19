<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	 .dataView li {
	 	margin-top:10px;
	 	list-style-type: none;
	 }
</style>



<main>
	<h1>수료생 게시판 글 내용 보기</h1>
	<ul class="dataView">
		<li>번호 : ${dto.grad_num}</li>
		<li>글쓴이 : ${dto.mem_id}</li>
		<li>조회수 : ${dto.grad_hit}</li>
		<li>등록일 : ${dto.grad_wdate}</li>
		<li>제목 : ${dto.grad_title}</li>
		<li><br>글내용<br/> ${dto.grad_content}</li>
	</ul>	

</main>