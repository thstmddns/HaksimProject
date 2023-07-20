<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	ul,li{
		margin: 0px;	
		padding: 0px;	
		list-style-type: none;
	}
	
	div > div{
		border:1px solid #00468C;
		margin-bottom: 40px;
		background-color: #bbddff;
	}
	
	h2{
		text-align: center;
		margin: 10px;
		color: #ffffff;
	}
	#adminList{
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		height: 500px;
		align-items: center;
		padding:0px;
	}
	
	#studentList{
		width:800px;
		text-align: center;
		background-color: #ffffff;
		border:1px solid #00468C;
		overflow: auto;
		margin-bottom: 5px;
	}
	#studentList > li{
		float:left;
		width: 15%;
		border-bottom: 1px solid #00468C;	
	}
	#studentList > li:nth-child(6n+4) {
		width: 25%;	
		white-space: nowrap;	/* 줄 바꾸지 않기 */
		overflow: hidden;	/* 넘치는 값 숨기기 */
		text-overflow: ellipsis;	/* ... 표시 */
	}
	
	#reportList{
		width:800px;
		text-align: center;
		background-color: #ffffff;
		border:1px solid #00468C;
		overflow: auto;
		margin-bottom: 5px;
	}
	#reportList > li{
		float:left;
		width: 15%;	
		border-bottom: 1px solid #00468C;
	}
	#reportList > li:nth-child(4n+4) {
		width: 55%;	
		white-space: nowrap;	/* 줄 바꾸지 않기 */
		overflow: hidden;	/* 넘치는 값 숨기기 */
		text-overflow: ellipsis;	/* ... 표시 */
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
	#noticeList > li:nth-child(6n+5) {
		width: 25%;	
		white-space: nowrap;	/* 줄 바꾸지 않기 */
		overflow: hidden;	/* 넘치는 값 숨기기 */
		text-overflow: ellipsis;	/* ... 표시 */
	}
</style>

<main>
	<h1 align="center">관리자 페이지</h1>
	<div id="adminList">
		<div>
			<h2>학생 리스트</h2>
			<form>
			<ul id="studentList">
				<li>&nbsp;</li>
				<li>아이디</li>
				<li>이름</li>
				<li>이메일</li>
				<li>기수번호</li>
				<li>기수인증</li>
				<!-- 
				<c:forEach var="mDTO" items="${member}">
					<li><input type="checkbox"></li>
					<li>${mDTO}</li>
					<li>${mDTO}</li>
					<li>${mDTO}</li>
					<li>${mDTO}</li>
					<li>${mDTO}</li>
				</c:forEach>
				
				 -->
			</ul>
			</form>
		</div>
		
		<div>
			<h2>신고내역 리스트</h2>
			<form>
			<ul id="reportList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>내용</li>
				
				<c:forEach var="rDTO" items="${report}">
					<li><input type="checkbox"/></li>
					<li>${rDTO.report_num}</li>
					<li>${rDTO.mem_id}</li>
					<li>${rDTO.report_content}</li>
				</c:forEach>
			</ul>
			</form>
		</div>
		
		<div>
			<h2>공지사항 리스트</h2>
			<form>
			<ul id="noticeList">
				<li>&nbsp;</li>
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>내용</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${ notice}">
					<li><input type="checkbox"></li>
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
					<li>${nDTO.notice_content}</li>
					<li>${nDTO.notice_wdate}</li>
				</c:forEach>
			</ul>
			<div align="right" style="margin: 5px;">
				<a href="/smhrd/notice/noticeList"><input type="button" value="이동"></a>
			</div>
			</form>	
		</div>
	</div>
	
</main>