<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h1{
		text-align: center;
	}
	.community_list, .page>ul{
		overflow: auto;
	}

	.community_list > li{
		float: left;  
		height: 40px; 
		line-height: 40px; 
		border-bottom: 1px solid #ddd; 
		width: 10%;
		text_align:center;
	}
	
	a:link, a:visited, a:hover{
		text-decoration: none;
		color: black;
	}	
	
	.community_list > li:nth-child(5n+3) {
		width: 60%;	
		white-space: nowrap;	/* 줄 바꾸지 않기 */
		overflow: hidden;	/* 넘치는 값 숨기기 */
		text-overflow: ellipsis;	/* ... 표시 */
	}


</style>

<main>
	<h1>커뮤니티 게시판</h1>
	
	<div>
		<a href="/smhrd/community/communityWrite"><button >글쓰기</button></a>
		
	</div>
	
	<ul class="community_list">
		<li>no</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<!-- 
			var: 변수 
			items: 데이터 
		-->
		<c:forEach var="dto" items="${list}">		
			<li>${dto.com_num}</li>
			<li>${dto.com_title }</a></li>
			<li>${dto.mem_id }</li>
			<li>${dto.com_wdate }</li>
			<li>${dto.com_hit}</li>	
		</c:forEach>
	</ul>
	

</main>