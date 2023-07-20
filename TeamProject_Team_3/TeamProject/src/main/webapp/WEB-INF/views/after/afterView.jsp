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
					$("#afterReplyList").html("");
					console.log(replyResult);
					$(replyResult).each(function(i, coment){
						var tag = "<li><div>";
						tag += "<b>"+coment.mem_id+"</b>";
						
							tag += "<input type='button' value='Edit'/>";
							tag += "<input type='button' value='Del' title='"+coment.grad_review_num+"'/>";
							tag += "<p>"+coment.grad_review_content+"<p></div>";  // 댓글 내용
							
							// -- 수정폼
							tag += "<div style='display:none'>";
							tag += "<form>";
							tag += "<textarea style='width:400px' name='grad_review_content'>";
							// 글 내용 수정, 댓글번호
							tag += coment.grad_review_content;
							tag += "</textarea>";
							tag += "<input type='hidden' name='grad_review_num' value='"+coment.grad_review_num+"'/>";
							tag += "<input type='button' value='수정하기'/>";
							tag += "</form>";
							tag += "</div>";
							tag += "</li>";
						
						$("#afterReplyList").append(tag);
				
					});
				},
				error:function(e) {
					console.log(e.responseText); 
				}
			});
		}
		
		// 댓글 쓰기
		$("#afterReplyFrm").submit(function() {
			
			event.preventDefault();  
			
			if($("#gradComent").val() == "") {
				alert("댓글을 입력하세요");
				return false;
			}
			
			var params = $("#afterReplyFrm").serialize();
			console.log('params', params);
			
			$.ajax({
				url: '/smhrd/afterReply/replyWrite',
				data: params,
				type: 'POST',
				success:function(result) {
					console.log(result);
					
					$("#gradComent").val("");
					
					afterReplyList();
					
				},
				error:function(e){
					console.log(e.responseText);
				} 
			});
				
		});
		
		
		//댓글 수정폼
		$(document).on('click','#afterReplyList input[value=Edit]',function(){
			$(this).parent().css('display', 'none');
			
			$(this).parent().next().css('display', 'block');
		});
		
		// 댓글 수정(DB)
		$(document).on('click', '#afterReplyList input[value=수정하기]', function(){
			var params = $(this).parent().serialize();  
			
			$.ajax({
				url : '/smhrd/afterReply/replyEditOk',
				data : params,
				type : 'POST',
				success:function(result){
					if(result=='0'){
						alert('댓글이 수정되지 않았습니다');
					}else{
						afterReplyList();
					}
				},
				error:function(e){
					console.log("댓글 수정 실패", e.responseText);
				}
			});
		});
	
		// 댓글 삭제
		$(document).on('click', '#afterReplyList input[value=Del]', function() {
			if (!confirm("댓글을 삭제하시겠습니까?")) {
				return false;
			}
			var grad_review_num = $(this).attr('title')
			
			$.ajax({
				url : '/smhrd/afterReply/replyDel',
				data : {
					grad_review_num : grad_review_num
				},
				success:function(result) {
					if(result=='0'){
						alert('댓글이 삭제되지 않았습니다');
					}else{
						afterReplyList();
					}
				},
				error:function(e) {
					console.log("댓글 삭제 실패", e.responseText);
				}
			});
		});
	
	$(document).on('click','#afterReplyList input[value=Edit]',function(){
		$(this).parent().css('display', 'none');
		
		$(this).parent().next().css('display', 'block');
	});
	
	// 댓글 수정(DB)
	$(document).on('click', '#afterReplyList input[value=수정하기]', function(){
		var params = $(this).parent().serialize();  
		
		$.ajax({
			url : '/smhrd/afterReply/replyEditOk',
			data : params,
			type : 'POST',
			success:function(result){
				if(result=='0'){
					alert('댓글이 수정되지 않았습니다');
				}else{
					afterReplyList();
				}
			},
			error:function(e){
				console.log("댓글 수정 실패", e.responseText);
			}
		});
	});

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
				<input type="hidden" name="grad_num" value="${dto.grad_num }">  
				<textarea name="grad_review_content" id="gradComent"></textarea>
				<input type="submit" value="댓글 등록하기">
			</form>
		<hr/>
		<ul id="afterReplyList">
			
		</ul>
	</div>
</main>
