<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#adminList{
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
	}
	
	#studentList{
		width:500px;
		background-color: #ffffff;
		border:1px solid #008CCE;
	}
	#reportList{
		width:500px;
		margin-left: 10px;
		background-color: #ffffff;
		border:1px solid #008CCE;
	}
	#noticeList{
		width:500px;
		margin-left: 10px;
		background-color: #ffffff;
		border:1px solid #008CCE;
	}
	
	table{
		border: 1px solid #008CCE;
		text-align: center;
		width: 450px;
	}
	td{
		border: 1px solid #008CCE;
	}
</style>

<main>
	<h1>관리자 페이지</h1>
	<div id="adminList">
		<div id="studentList">
			<h3>학생 리스트</h3>
			<form>
			<table>
				<thead>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>기수</td>
						<td>인증여부</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mDTO" items="member">
						
					</c:forEach>
				</tbody>
				
			</table>
			</form>
		</div>
		
		<div id="reportList">
			<h3>신고내역 리스트</h3>
			<form>
			<table>
				<thead>
					<tr>
						<td>신고번호</td>
						<td>작성자</td>
						<td>신고내용</td>
						<td>접수일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rDTO" items="${report}">
						<tr>
							<td>${rDTO.report_num}</td>
							<td>${rDTO.mem_id }</td>
							<td>${rDTO.report_content }</td>
							<td>${rDTO.report_wdate }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			</form>
		</div>
		
		<div id="noticeList">
			<h3>공지사항 리스트</h3>
			<form>
			<table>
				<thead>
					<tr>
						<td>공지번호</td>
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="nDTO" items="${notice}">
						<tr>
							<td>${nDTO.notice_num }</td>
							<td>${nDTO.mem_id }</td>
							<td>${nDTO.notice_title }</td>
							<td>${nDTO.notice_wdate }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			</form>	
		</div>
	</div>
	
</main>