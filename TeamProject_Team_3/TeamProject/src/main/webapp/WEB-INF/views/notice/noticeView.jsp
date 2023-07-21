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
			location.href = "/smhrd/notice/NoticeDel";
		}
	} 
</script>


<main>
	<h1>수료생 게시판 글 내용 보기</h1>
	<ul class="NoticeView">
		<li>번호 : ${notice.notice_num}</li>
		<li>글쓴이 : ${notice.mem_id}</li>
		<li>조회수 : ${notice.notice_hit}</li>
		<li>등록일 : ${notice.notice_wdate}</li>
		<li>제목 : ${notice.notice_title}</li>
		<li><br>글내용<br/> ${notice.notice_content}</li>
		
	</ul>
	
	<!-- 작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 x -->
	<div align="right">
		<a href='/smhrd/notice/noticeList'><button>목록</button></a>
		<%-- <a href='/smhrd/notice/noticeList?nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'><button>목록</button></a> --%>
		<!-- 작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 o -->
		<c:if test="${logId == dto.userid}">	
				<a href='/smhrd/notice/noticeEdit?notice_num=${notice.notice_num}&nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'><button>수정</button></a>
				<a href="javascript:noticeDel()"><button>삭제</button></a>
		</c:if>
	</div>
	
	

</main>