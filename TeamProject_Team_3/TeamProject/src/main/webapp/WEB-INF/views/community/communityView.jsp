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
				var len = replyResult.length;
				$(replyResult).each(function(i, coment){
					var tag = "<li><div class='replyFrm'>";
					tag += "<b>"+(len-i)+"빠</b>";
					
					    if(coment.mem_id=='${logId}'){
						tag += "<input type='button' value='Edit'/>";
						tag += "<input type='button' value='Del' title='"+coment.com_review_num+"'/>";
						tag += "<p>"+coment.com_review_content+"<p></div>";  // 댓글 내용 */ */						
						// -- 수정폼
						tag += "<div style='display:none' class='replyFrm'>";
						tag += "<form>";
						tag += "<textarea style='width:420px; margin-left:25px;' name='com_review_content'>";
						// 글 내용 수정, 댓글번호
						tag += coment.com_review_content;
						tag += "</textarea>";
						tag += "<input type='hidden' name='com_review_num' value='"+coment.com_review_num+"'/>";
						tag += "<input type='button' value='수정하기'/>";
						tag += "</form>";
						tag += "</div>";
						
					    }else {
							tag += "<input type='button' value='신고'/>";
							tag += "<p>"+coment.com_review_content+"</p></div>";
							tag += "<div id='cReportReplyFrm' style='display:none' class='reportFrm'>";
							tag += "<form id='cReportReply'>";
							tag +="<input type='hidden' name='com_num' value='"+coment.com_num+"'/>";
							tag += "<input type='hidden' name='com_review_num' value='"+coment.com_review_num+"'/>";
							tag +="<input type='hidden' name='com_reportReply_url' id='com_reportReply_url' value='"+window.location.href+"'>";
							tag +="<input type='hidden' name='board' value='com_review'/>";
							<!-- 어떤 게시판의 몇번 글인지 보내기 -->
							tag += "<li><b>신고사유를 선택해주세요</b></li>";
							tag +="<input type='radio' name='report_content' value='홍보/영리 목적' class='reportChk' id='reportChk'>홍보/영리 목적";
							tag +="<br>";
							tag +="<input type='radio' name='report_content' value='욕설및비방' class='reportChk' id='reportChk'>욕설 및 비방";
							tag +="<br>";
							tag +="<input type='radio' name='report_content' value='부적절한표현' class='reportChk' id='reportChk'>부적절한 표현";
							tag +="<br>";
							tag +="<input type='radio' name='report_content' value='거짓/불법정보' class='reportChk' id='reportChk'>거짓/불법정보";
							tag +="<br>";
							tag +="<input type='radio' name='report_content' value='기타' class='reportChk' id='reportChk'>기타";
							tag +="<br>";
							tag +="<input type='submit' value='신고하기'>";
							tag += "</form>";
							tag += "</div>";
						}
						
					    tag += "</li>";
						$("#communityReplyList").append(tag); 			
				});
			},
			error:function(e) {
				console.log(e.responseText); 
			}
		});
	}
	// 댓글 쓰기
	$("#communityReplyFrm").submit(function() {
		
		event.preventDefault();  
		
		if($("#communityComent").val() == "") {
			alert("댓글을 입력하세요");
			return false;
		}
		
		var params = $("#communityReplyFrm").serialize();
		console.log('params', params);
		
		$.ajax({
			url: '/smhrd/communityReply/replyWrite',
			data: params,
			type: 'POST',
			success:function(result) {
				console.log(result);
				
				$("#communityComent").val("");
				
				communityReplyList();
				
			},
			error:function(e){
			console.log(e.responseText);
			} 
		});
			
	});
	
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

$(document).on("click", "#communityReplyList input[value=Edit]", function() {
	$(this).parent().css("display", "none");
	$(this).parent().next().css("display", "block");
});

$(document).on('click','#comReportBtn',function(){
	$(this).css('display', 'none');
	
	$(this).next().css('display', 'block');
});


$("#comReportFrm").submit(function() {
	event.preventDefault();  
	
	if (!confirm("해당 게시글을 신고하시겠습니까?")) {
		return false;
	}
	
	if($("#comReportChk").val() == "") {
		alert("신고사유을 선택해주세요");
		return false;
	}

	$("#com_report_url").val(window.location.href);
	var params = $("#comReportFrm").serialize();		
	
		$.ajax({
		url: '/smhrd/community/communityReportOk',
		data: params,
		type: 'POST',
		success:function(result) {
			console.log(result);
			alert('신고가 접수되었습니다');
			$("#comReportFrm").css('display', 'none');
		},
		error:function(e){
			console.log(e.responseText);
			alert('신고가 접수되지 않았습니다');
		} 
	});		
});

// 댓글 신고 폼
$(document).on('click','#communityReplyList input[value=신고]',function(){
	
	$("#cReportReplyFrm").css('display', 'block');
});

// 댓글 신고하기 
$(document).on('click', '#communityReplyList input[value=신고하기]', function(){
	event.preventDefault();  

	if (!confirm("해당 댓글을 신고하시겠습니까?")) {
		return false;
	}
	
	if($("#reportChk").val() == "") {
		alert("신고사유을 선택해주세요");
		return false;
	}
	
	var params = $(this).parent().serialize();  //$("#reportReply").serialize();		
	console.log(params)
	
		$.ajax({
		url: '/smhrd/communityReply/communityReplyReportOk',
		data: params,
		type: 'POST',
		success:function(result) {
			console.log(result);
			alert('신고가 접수되었습니다');
			communityReplyList();
		},
		error:function(e){
			console.log(e.responseText);
			alert('신고가 접수되지 않았습니다');
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
	  <li>글쓴이 : 익명의 누군가</li>				
      <li>조회수 : ${dto.com_hit}</li>
      <li>등록일 : ${dto.com_wdate}</li>
      <li>제목 : ${dto.com_title}</li>
      <li><br>글내용<br/> ${dto.com_content}</li>
   	</ul>
     
   	<div>
   		<c:if test="${logId == dto.mem_id}">
   			<a href="/smhrd/community/communityEdit?com_num=${dto.com_num}">수정</a>
			<a href="javascript:boardDelChk()">삭제</a>
   		</c:if>
	</div>
	<!-- 신고 -->
	<c:if test="${logId != dto.mem_id}">
		<button id="comReportBtn">신고</button>
	</c:if>	
	<div style="display:none;">
		<form id="comReportFrm">
		<input type="hidden" name='com_num' value="${dto.com_num}">
		<input type="hidden" name='com_report_url' id="com_report_url" value="">
		<input type="hidden" name="board" value="community"/>
		<!-- 어떤 게시판의 몇번 글인지 보내기 -->
		<input type="radio" name="report_content" value="홍보/영리 목적" class="reportChk" id="comReportChk">홍보/영리 목적
		<br>
		<input type="radio" name="report_content" value="욕설및비방" class="reportChk" id="comReportChk">욕설 및 비방
		<br>
		<input type="radio" name="report_content" value="부적절한표현" class="reportChk" id="comReportChk">부적절한 표현
		<br>
		<input type="radio" name="report_content" value="거짓/불법정보" class="reportChk" id="comReportChk">거짓/불법정보
		<br>
		<input type="radio" name="report_content" value="기타" class="comReportChk">기타
		<br>
		<input type="submit" value="신고하기">
	</form>
	</div>
	
	<!-- 댓글 -->
	<div id="communityReply">

			<c:if test="${logStatus=='Y'}">
				<form method="post" id="communityReplyFrm" class='replyFrm'>

				<input type="hidden" name="com_num" value="${dto.com_num }">  
				<textarea style="margin-left:30px; width:380px;" name="com_review_content" id="communityComent"></textarea>
				<input type="submit" value="댓글 등록하기">
			</form>
			</c:if>
		<hr/>
		<ul id="communityReplyList">			
		</ul>
	</div>	
</main>