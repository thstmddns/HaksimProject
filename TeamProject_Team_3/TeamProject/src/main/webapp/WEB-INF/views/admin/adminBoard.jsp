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
	
	
</style>

<main>
	<h1>관리자 페이지</h1>
	<div id="adminList">
		<div id="studentList">
			<h3>학생 리스트</h3>
			<form>
				
			</form>
		</div>
		
		<div id="reportList">
			<h3>신고내역 리스트</h3>
			<form>
			
			</form>
		</div>
		
		<div id="noticeList">
			<h3>공지사항 리스트</h3>
			<form>
			
			</form>	
		</div>
	</div>
	
</main>