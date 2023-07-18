<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main>
	<h1>수료생 게시판 목록</h1>
	<div>
		<a href="${pageContext.request.contextPath}/after/afterWrite"><button>글쓰기</button></a>
	</div>

	<div>
		<ul class="after_List">
			<li>no</li>
			<li>제목</li>
			<li>내용</li>
			<li>글쓴이</li>
			<li>등록일</li>
			<li>조회수</li>
			
			<c:forEach var="dto" items="${list}">
				<li>${dto.grad_num}</li>
				<li><a href="/smhrd/after/afterView/${dto.grad_num}">${dto.grad_title}</a></li>
				<li>${dto.grad_content}</li>
				<li>${dto.mem_id}</li>
				<li>${dto.grad_wdate}</li>
				<li>${dto.grad_hit}</li>	
			</c:forEach>
		</ul>
	</div>

	<div class="search">
		<form action="/smhrd/after/afterList">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="userid">글쓴이</option>	
			</select>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
</main>