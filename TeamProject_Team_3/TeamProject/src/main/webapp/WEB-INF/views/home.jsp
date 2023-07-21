<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
ul, li{
		margin: 0px;	
		padding: 0px;	
		list-style-type: none;
	}

#container{
	display: flex;
	flex-direction: column;
	align-items: center;
	
}
#noticeList{
		width:800px;
		text-align: center;
		background-color: #ffffff;
		border:1px solid #00468C;
		overflow: auto;
		margin-bottom: 5px;
	}
	#noticeList > li{
		float:left;
		width: 15%;	
		border : 0px solid #00468C;
		border-bottom: 1px solid #00468C;
	}
	#noticeList > li:nth-child(5n+4) {
		width: 40%;
		white-space: nowrap;	/* 줄 바꾸지 않기 */
		overflow: hidden;	/* 넘치는 값 숨기기 */
		text-overflow: ellipsis;	/* ... 표시 */
	}
</style>

<main>	
	<div>
		<h1>배너자리</h1>	
		
	</div>
	
	<div id="container">
		
		<div class="noticeBoard">	
			<h1>공지 게시판</h1>
				<ul id="noticeList">
					<li>&nbsp;</li>
					<li>번호</li>
					<li>아이디</li>
					<li>제목</li>
					<li>작성일</li>
					
					<c:forEach var="nDTO" items="${notice}" >
						<li><input type="checkbox"></li>
						<li>${nDTO.notice_num}</li>
						<li>${nDTO.mem_id}</li>
						<li>${nDTO.notice_title}</li>
						<li>${nDTO.notice_wdate}</li>
					</c:forEach>
				</ul>
		</div>	
		
		<div class="">
			<h1>자료 공유 게시판</h1>
			<ul id="noticeList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${notice}" >
					<li><input type="checkbox"></li>
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
					<li>${nDTO.notice_wdate}</li>
				</c:forEach>
			</ul>
		</div>	
			
		<div class="communityBoard">
			<h1>커뮤니티 게시판</h1>
			<ul id="noticeList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${notice}" >
					<li><input type="checkbox"></li>
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
					<li>${nDTO.notice_wdate}</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="matzipBoard">
			<h1>맛집 공유 게시판</h1>
			<ul id="noticeList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${notice}" >
					<li><input type="checkbox"></li>
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
					<li>${nDTO.notice_wdate}</li>
				</c:forEach>
			</ul>
		</div>	
			
		<div class="gradBoard">
			<h1>수료생 게시판</h1>
			<ul id="noticeList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${notice}" >
					<li><input type="checkbox"></li>
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
					<li>${nDTO.notice_wdate}</li>
				</c:forEach>
			</ul>
		</div>
	
	</div>
	
</main>

