<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
/* 글 삭제 */
function dataDelChk () {
		if(confirm("글을 삭제하시겠습니까?")) {
				location.href = "/smhrd/data/dataDel?data_num=${dto.data_num}";
		}
}

/* 댓글 목록 */
$(function(){
    function dataReplyList() {
       
       $.ajax({
          url: '/smhrd/dataReply/replyList',
          data: {
             data_num:${dto.data_num}   // 원글 글번호 보내기
          },
          success:function(replyResult) {
             $("#dataReplyList").html("");
             console.log(replyResult);
             $(replyResult).each(function(i, coment){
                var tag = "<li><div class='replyFrm'>";
                tag += "<b>"+coment.mem_id+"</b>";
                if(coment.mem_id=='${logId}') {
                   tag += "<input type='button' value='Edit'/>";
                   tag += "<input type='button' value='Del' title='"+coment.data_review_num+"'/>";
                   tag += "<p>"+coment.data_review_content+"<p></div>";  // 댓글 내용
                   
                   // -- 수정폼
                   tag += "<div style='display:none' class='replyFrm'>";
                   tag += "<form>";
                   tag += "<textarea style='width:680px; margin-left:35px;' name='data_review_content'>";
                   // 글 내용 수정, 댓글번호
                   tag += coment.data_review_content;
                   tag += "</textarea>";
                   tag += "<input type='hidden' name='data_review_num' value='"+coment.data_review_num+"'/>";
                   tag += "<input type='button' value='Edit'/>";
                   tag += "</form>";
                   tag += "</div>";
                   
                }else {
                	tag += "<input type='button' value='신고'/>";
					tag += "<p>"+coment.data_review_content+"</p></div>";
					tag += "<div id='dReportReplyFrm' style='display:none' class='reportFrm'>";
					tag += "<form id='dReportReply'>";
					tag +="<input type='hidden' name='data_num' value='"+coment.data_num+"'/>";
					tag += "<input type='hidden' name='data_review_num' value='"+coment.data_review_num+"'/>";
					tag +="<input type='hidden' name='data_reportReply_url' id='data_reportReply_url' value='"+window.location.href+"'>";
					tag +="<input type='hidden' name='board' value='data_review'/>";
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
                
                $("#dataReplyList").append(tag);
          
             });
          },
          error:function(e) {
             console.log(e.responseText); 
          }
       });
      
    }

	// 댓글 쓰기
	$("#dataReplyFrm").submit(function() {
		event.preventDefault();  
		if($("#dataComent").val() == "") {
			alert("댓글을 입력하세요");
			return false;
		}
		var params = $("#dataReplyFrm").serialize();
		console.log('params', params);
		$.ajax({
			url: '/smhrd/dataReply/replyWrite',
			data: params,
			type: 'POST',
			success:function(result) {
				console.log(result);
				$("#dataComent").val("");
				dataReplyList();
			},
			error:function(e){
				console.log(e.responseText);
			} 
		});	
	});

/* 댓글 수정 */
$(document).on('click', '#dataReplyList input[value=Edit]', function() {
		var params = $(this).parent().serialize();
		
		$.ajax({
			url : "/smhrd/dataReply/replyEditOk",
			data : params,
			type : "POST",
			success : function(result) {
					if(result=="0") {
							alert("댓글이 수정되지 않았습니다");
					} else {
							dataReplyList();
					}
			},
			error : function(e) {
					console.log("댓글 수정 실패", e.responseText);
			}
		});
});

/* 댓글 삭제 */
$(document).on('click', '#dataReplyList input[value=Del]', function() {
		if (!confirm("댓글을 삭제하시겠습니까?")) {
				return false;
		}
		var data_review_num = $(this).attr("title")
		
		$.ajax({
				url : "/smhrd/dataReply/replyDel",
				data : {
						data_review_num : data_review_num
				},
				success : function(result) {
						if(result=="0") {
								alert("댓글이 삭제되지 않았습니다");
						} else {
								dataReplyList();
						}
				},
				error : function(e) {
						console.log("댓글 삭제 실패", e,responseText);
				}
		});
});


	$(document).on("click", "#dataReplyList input[value=Edit]", function() {
			$(this).parent().css("display", "none");
			$(this).parent().next().css("display", "block");
	});
	
	$(document).on('click','#dataReportBtn',function(){
		$(this).css('display', 'none');
	
		$(this).next().css('display', 'block');
	});
	
	
	$("#dataReportFrm").submit(function() {
		event.preventDefault();  
		
		if (!confirm("해당 게시글을 신고하시겠습니까?")) {
			return false;
		}
		
		if($("#dataReportChk").val() == "") {
			alert("신고사유을 선택해주세요");
			return false;
		}
	
		$("#data_report_url").val(window.location.href);
		var params = $("#dataReportFrm").serialize();		
		
			$.ajax({
			url: '/smhrd/data/dataReportOk',
			data: params,
			type: 'POST',
			success:function(result) {
				console.log(result);
				alert('신고가 접수되었습니다');
				$("#dataReportFrm").css('display', 'none');
			},
			error:function(e){
				console.log(e.responseText);
				alert('신고가 접수되지 않았습니다');
			} 
		});
			
	});
	
	// 댓글 신고 폼
	$(document).on('click','#dataReplyList input[value=신고]',function(){
		
		$("#dReportReplyFrm").css('display', 'block');
	});
	
	// 댓글 신고하기 
	$(document).on('click', '#dataReplyList input[value=신고하기]', function(){
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
			url: '/smhrd/dataReply/dataReplyReportOk',
			data: params,
			type: 'POST',
			success:function(result) {
				console.log(result);
				alert('신고가 접수되었습니다');
				dataReplyList();
			},
			error:function(e){
				console.log(e.responseText);
				alert('신고가 접수되지 않았습니다');
			} 
		});
			
	});
	
	dataReplyList();
});
</script>

<main>
	<div id="all">
   <ul class="dataOpen" id="view">
	<div align="right" class="onlyLog">
   	<c:if test="${logId == dto.mem_id}">
      <a href="/smhrd/data/dataEdit?data_num=${dto.data_num }">수정</a>
      <a href="javascript:dataDelChk()">삭제</a>
     </c:if>
   </div>
   
   	  <li>자료 공유 ></li>
      <h3 class="title">${dto.data_title}</h3>
      <li>by ${dto.mem_id}💡</li>
      <li>조회수 : ${dto.data_hit}</li>
      <li>등록일 : ${dto.data_wdate}</li>
      <div class="content">
		<li><br># 내용<br/></li>
		<li style="color:#bebebe">------------------------------------------------------------------------------------------------------------------------</li>
		<li><br> ${dto.data_content}</li>
	  </div>
      <div><li><br><br>
				<c:forEach var="fDTO" items="${fileList}">
            		<a href="<%=request.getContextPath()%>/upload/${fDTO.filename}" download  class="file">
            		📂&nbsp;${fDTO.filename}</a>
         		</c:forEach>
		</li>
		</div>
   </ul>   
   	
   <c:if test="${logId != dto.mem_id}">
		<button id="dataReportBtn" class="reportBTN">신고🚨</button>
	</c:if>
	
	<div style="display:none">
		<form id="dataReportFrm">
		<input type="hidden" name='data_num' value="${dto.data_num}">
		<input type="hidden" name='data_report_url' id="data_report_url" value="">
		<input type="hidden" name="board" value="data"/>
		<!-- 어떤 게시판의 몇번 글인지 보내기 -->
		<input type="radio" name="report_content" value="홍보/영리 목적" class="reportChk" id="dataReportChk">홍보/영리 목적
		<br>
		<input type="radio" name="report_content" value="욕설및비방" class="reportChk" id="dataReportChk">욕설 및 비방
		<br>
		<input type="radio" name="report_content" value="부적절한표현" class="reportChk" id="dataReportChk">부적절한 표현
		<br>
		<input type="radio" name="report_content" value="거짓/불법정보" class="reportChk" id="dataReportChk">거짓/불법정보
		<br>
		<input type="radio" name="report_content" value="기타" class="dataReportChk">기타
		<br>
		<input type="submit" value="신고하기">
	</form>
	</div>
   
   
   
   <div id="dataReply" class="reply">
   
   		<c:if test="${logStatus=='Y'}">
         <!-- <form method="post" id="dataReplyFrm"> -->
         <form method="post"   id="dataReplyFrm" class='replyFrm'>
            <input type="hidden" name="data_num" value="${dto.data_num }">  
            <textarea style="margin-left:35px; width:650px;" name="data_review_content" id="dataComent"></textarea>
            <input type="submit" value="댓글 등록하기">
         </form>
         </c:if>
      <hr/>
      <ul id="dataReplyList">
         
      </ul>
      
   </div>
   </div>
   <a href='/smhrd/data/dataList'><button class="backList">목록</button></a>
</main>