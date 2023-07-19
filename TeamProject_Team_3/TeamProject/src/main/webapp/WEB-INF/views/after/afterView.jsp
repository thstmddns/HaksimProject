<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	 .afterView li {
	 	margin-top:10px;
	 	list-style-type: none;
	 }
</style>


<script>
	function afterDelChk () {
		// 확인(true), 취소(false)
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "/smhrd/after/afterDel?grad_num=${dto.grad_num}";
		}
	}
	
	$(function(){
		// 댓글 목록 가져오기
		function afterReplyList() {
			
			$.ajax({
				url: '/smhrd/afterReply/replyList',
				data: {
					grad_num:${dto.grad_num}   // 원글 글번호 보내기
				},
				success:function(replyResult) {
					//$("#afterReplyList").html("");
					console.log(replyResult);
					$(replyResult).each(function(i, coment){
						var tag = "<li><div>";
						tag += "<b>"+coment.mem_id+"</b>";
						// 수정, 삭제
						if(coment.userid=='${logId}') { // 'goguma'==goguma -> logId에 '' 붙여야함
							tag += "<input type='button' value='Edit'/>";
							tag += "<input type='button' value='Del' title='"+coment.grad_review_num+"'/>";
							tag += "<p>"+coment.grad_review_content+"<p></div>";  // 댓글 내용
							
							// -- 수정폼
							tag += "<div style='display:none'>";
							tag += "<form>";
							tag += "<textarea style='width:400px' name='coment'>";
							// 글 내용 수정, 댓글번호
							tag += coment.grad_review_content;
							tag += "</textarea>";
							tag += "<input type='hidden' name='coment.grad_review_num' value='"+coment.grad_review_num+"'/>";
							tag += "<input type='button' value='수정하기'/>";
							tag += "</form>";
							tag += "</div>";
						}else {
							tag += "<p>"+coment.grad_review_content+"</p></div>";
						}
						tag += "</li>";
						
						$("#afterReplyList").append(tag);
				
					});
				},
				error:function(e) {
					console.log(e.responseText); 
				}
			});
		}
		afterReplyList();
	});
</script>

<main>
	<h1>수료생 게시판 글 내용 보기</h1>
	<ul class="afterView">
		<li>번호 : ${dto.grad_num}</li>
		<li>글쓴이 : ${dto.mem_id}</li>
		<li>조회수 : ${dto.grad_hit}</li>
		<li>등록일 : ${dto.grad_wdate}</li>
		<li>제목 : ${dto.grad_title}</li>
		<li><br>글내용<br/> ${dto.grad_content}</li>
	</ul>	
	
	<div>
		<a href="javascript:afterDelChk()">삭제</a>
	</div>
	
		<!-- 댓글 달기 -->
	<div id="afterReply">
			<form method="post" id="afterReplyFrm">
				<input type="hidden" name="gradNum" value="${dto.grad_num }">  
				<textarea name="gradComent" id="gradComent"></textarea>
				<input type="submit" value="댓글 등록하기">
			</form>
			<!-- 액션태그 생략하면 기본이 자신 페이지로 이동 -->
		<hr/>
		<ul id="afterReplyList">
			
		</ul>
	</div>
</main>
