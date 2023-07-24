<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	.communityView li {
	 margin-top:10px;
	 list-style-type: none;
}
	
</style>

<script>
function boardDelChk () {
		// 확인(true), 취소(false)
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "/smhrd/community/boardDel?com_num=${dto.com_num}";
		}
	}
$(function(){
	// 댓글 목록 가져오기
	function communityReplyList() {
		
		$.ajax({
			url: '/smhrd/communityReply/replyList',
			data: {
				com_num:${dto.com_num}   // 원글 글번호 보내기
			},
			success:function(replyResult) {
				$("#communityReplyList").html("");
				console.log(replyResult);
				$(replyResult).each(function(i, coment){
					var tag = "<li><div>";
					tag += "<b>"+coment.mem_id+"</b>";
					
						tag += "<input type='button' value='Edit'/>";
						tag += "<input type='button' value='Del' title='"+coment.com_review_num+"'/>";
						tag += "<p>"+coment.com_review_content+"<p></div>";  // 댓글 내용 */ */
						
						// -- 수정폼
						tag += "<div style='display:none'>";
						tag += "<form>";
						tag += "<textarea style='width:400px' name='com_review_content'>";
						// 글 내용 수정, 댓글번호
						tag += coment.com_review_content;
						tag += "</textarea>";
						tag += "<input type='hidden' name='com_review_num' value='"+coment.com_review_num+"'/>";
						tag += "<input type='button' value='수정하기'/>";
						tag += "</form>";
						tag += "</div>";
						tag += "</li>";
					
					$("#communityReplyList").append(tag); 
			
				});
			},
			error:function(e) {
				console.log(e.responseText); 
			}
		});
	}
	
	// 댓글 삭제
	$(document).on('click', '#communityReplyList input[value=Del]', function() {
		if (!confirm("댓글을 삭제하시겠습니까?")) {
			return false;
		}
		var com_review_num = $(this).attr('title')
		
		$.ajax({
			url : '/smhrd/communityReply/replyDel',
			data : {
				com_review_num : com_review_num
			},
			success:function(result) {
				if(result=='0'){
					alert('댓글이 삭제되지 않았습니다');
				}else{
					communityReplyList();
				}
			},
			error:function(e) {
				console.log("댓글 삭제 실패", e.responseText);
			}
		});
	});

//댓글 수정폼
$(document).on('click','#communityReplyList input[value=Edit]',function(){
	$(this).parent().css('display', 'none');	
	$(this).parent().next().css('display', 'block');
});

// 댓글 수정(DB)
$(document).on('click', '#communityReplyList input[value=수정하기]', function(){
	var params = $(this).parent().serialize();  
	
	$.ajax({
		url : '/smhrd/communityReply/replyEditOk',
		data : params,
		type : 'POST',
		success:function(result){
			if(result=='0'){
				alert('댓글이 수정되지 않았습니다');
			}else{
				communityReplyList();
			}
		},
		error:function(e){
			console.log("댓글 수정 실패", e.responseText);
		}
	});
});

communityReplyList();

});

</script>

<main>
   <h1>커뮤니티 글 게시판 내용 보기</h1>
   <ul class="communityView">
   	<li>번호 : ${dto.com_num}</li>
		<c:if test="${dto.com_type==1}">
			<li>고민 게시판</li>	
		</c:if>
		<c:if test="${dto.com_type==2}">
			<li>건의 게시판</li>
		</c:if>
		<c:if test="${dto.com_type==3}">
			<li>소통 게시판</li>
		</c:if>
				
      <li>글번호 : ${dto.com_num}</li>
      <li>제목 : ${dto.com_title}</li>
      <li>글쓴이 : ${dto.mem_id}</li>
      <li><br>글내용<br/> ${dto.com_content}</li>
      <li>등록일 : ${dto.com_wdate}</li>
      <li>조회수 : ${dto.com_hit}</li>
   	</ul>
     
   	<div>
   		<c:if test="${logId == dto.mem_id }">>
   			<a href="/smhrd/community/communityEdit?com_num=${dto.com_num}">수정</a>
			<a href="javascript:boardDelChk()">삭제</a>
   		</c:if>
	</div>
	<div id="communityReply">
			<form method="post" id="communityReplyFrm">
				<input type="hidden" name="comNum" value="${dto.com_num }">  
				<textarea name="communityComent" id="communityComent"></textarea>
				<input type="submit" value="댓글 등록하기">
			</form>
		<hr/>
		<ul id="communityReplyList">			
		</ul>
	</div>	
</main>