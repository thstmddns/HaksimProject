<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function changeAuth(){
		location.href="/smhrd/admin/"
	}
</script>

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
		width: 20%;	
		border : 0px solid #00468C;
		border-bottom: 1px solid #00468C;
	}
	#noticeList > li:nth-child(4n+3) {
		width: 40%;	
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
				<li>아이디</li>
				<li>이름</li>
				<li>이메일</li>
				<li>회원분류</li>
				<li>기수번호</li>
				<li>인증여부</li>
				
				<c:forEach var="mDTO" items="${member}">
					<li><a href="/smhrd/admin/memberView?id=${mDTO.mem_id }">${mDTO.mem_id}</a></li>
					<li>${mDTO.mem_name}</li>
					<li>${mDTO.mem_email}</li>
					<c:if test="${mDTO.mem_type == '0' }">
						<li>미인증</li>
					</c:if>
					<c:if test="${mDTO.mem_type == '1' }">
						<li>학생</li>
					</c:if>
					<c:if test="${mDTO.mem_type == '2' }">
						<li>수료생</li>
					</c:if>
					<li>${mDTO.mem_ca}</li>
					<li>${mDTO.mem_auth}</li>
				</c:forEach>
			</ul>
			</form>
		</div>
		
		<div>
			<h2>신고내역 리스트</h2>
			<form>
			<ul id="reportList">
				<li>번호</li>
				<li>아이디</li>
				<li>내용</li>
				<li>위치</li>
				
				<c:forEach var="rDTO" items="${report}">
					<li>${rDTO.report_num}</li>
					<li>${rDTO.mem_id}</li>
					<li>${rDTO.report_content}</li>
					<li><a href="${rDTO.report_url}">${rDTO.report_url}</a></li>
				</c:forEach>
			</ul>
			</form>
		</div>
		
		<div>
			<h2>공지사항 리스트</h2>
			<form>
			<ul id="noticeList">
				<li>번호</li>
				<li>아이디</li>
				<li>제목</li>
				<li>작성일</li>
				
				<c:forEach var="nDTO" items="${notice}">
					<li>${nDTO.notice_num}</li>
					<li>${nDTO.mem_id}</li>
					<li>${nDTO.notice_title}</li>
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