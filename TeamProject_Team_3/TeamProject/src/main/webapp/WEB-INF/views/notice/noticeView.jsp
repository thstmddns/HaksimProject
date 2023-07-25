<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
ul,li{
	margin: 0px;	
	padding: 0px;	
	list-style-type: none;
}
.NoticeView li {
	margin-top:10px;
}
</style>
<script>
	function noticeDel() {
		if(confirm("자료실 글을 삭제하시겠습니까?")) {
			location.href = "/smhrd/notice/noticeDel?no=${dto.notice_num}";
		}
	}; 
</script>


<main>
	<ul class="NoticeView">
		<li>번호 : ${dto.notice_num}</li>
		<li>글쓴이 : ${dto.mem_id}</li>
		<li>조회수 : ${dto.notice_hit}</li>
		<li>등록일 : ${dto.notice_wdate}</li>
		<li>제목 : ${dto.notice_title}</li>
		<li><br>글내용<br/> ${dto.notice_content}</li>
	</ul>
	
	<!-- 작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 x -->
	<div align="right">
		<a href='/smhrd/notice/noticeList'><button>목록</button></a>
		<c:if test="${logId == dto.mem_id}">	
				<a href='/smhrd/notice/noticeEdit?no=${dto.notice_num}'><button>수정</button></a>
				<a href="javascript:noticeDel()"><button>삭제</button></a>
		</c:if>
	</div>
	
	

</main>