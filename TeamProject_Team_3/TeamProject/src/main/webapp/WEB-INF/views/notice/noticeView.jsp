<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function noticeDel() {
		if(confirm("자료실 글을 삭제하시겠습니까?")) {
			location.href = "/smhrd/notice/noticeDel?no=${dto.notice_num}";
		}
	}; 
</script>


<main>
	<div id="all">
	<ul class="NoticeView" id="view">
	<!-- 작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 x -->
	<div align="right" class="onlyLog">
		<c:if test="${logId == dto.mem_id && logType >= 3}">	
				<a href='/smhrd/notice/noticeEdit?no=${dto.notice_num}'>수정</a>
		</c:if>
		<c:if test="${logId == dto.mem_id || logType >= 3}">		
				<a href="javascript:noticeDel()">삭제</a>
		</c:if>
	</div>
		<li>공지 ></li>
		<h3 class="title">${dto.notice_title}</h3>
		<li>by ${dto.mem_id}📢</li>
		<li>조회수 : ${dto.notice_hit}</li>
		<li>등록일 : ${dto.notice_wdate}</li>
		<div class="content">
		<li><br># 내용<br/></li>
		<li style="color:#bebebe">------------------------------------------------------------------------------------------------------------------------</li>
		<li><br> ${dto.notice_content}</li>
		</div>
	</ul>
	
	
	
	</div>
		<a href='/smhrd/notice/noticeList'><button class="backList">목록</button></a>

</main>