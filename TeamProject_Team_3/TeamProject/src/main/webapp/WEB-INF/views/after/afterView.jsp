<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 .dataView li {
 	margin-top:10px;
 }
</style>
<script>
	function dataDel() {
		if(confirm("자료실 글을 삭제하시겠습니까?")) {
			location.href = "/home/data/dataDel?no=${dto.no}";
		}
	}


</script>


<main>
	<h1>수료생 게시판 글 내용 보기</h1>
	<ul class="dataView">
		<li>번호 : ${dto.grad_num}</li>
		<li>글쓴이 : ${dto.mem_id}</li>
		<li>조회수 : ${dto.grad_hit}</li>
		<li>등록일 : ${dto.grad_wdate}</li>
		<li>제목 : ${dto.grad_title}</li>
		<li><br>글내용<br/> ${dto.grad_content}</li>
		<li><br/>첨부파일 : 
			<c:forEach var="fDTO" items="${fileList}">
				<a href="<%=request.getContextPath()%>/upload/${fDTO.filename}" download>${fDTO.filename}</a>
			</c:forEach>
		</li>
	</ul>
	<hr/>
	<!-- 본인이 쓴 글일 때 수정/삭제 가능 -->
	<c:if test="${logId==dto.userid}">
		<div>
			<a href="/smhrd/after/afterEdit?no=${dto.grad_num}">수정</a>
			<a href="javascript:dataDel()">삭제</a>
		</div>
	</c:if>

</main>