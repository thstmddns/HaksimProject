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
                var tag = "<li><div>";
                tag += "<b>"+coment.mem_id+"</b>";
                
                   tag += "<input type='button' value='Edit'/>";
                   tag += "<input type='button' value='Del' title='"+coment.data_review_num+"'/>";
                   tag += "<p>"+coment.data_review_content+"<p></div>";  // 댓글 내용
                   
                   // -- 수정폼
                   tag += "<div style='display:none'>";
                   tag += "<form>";
                   tag += "<textarea style='width:400px' name='data_review_content'>";
                   // 글 내용 수정, 댓글번호
                   tag += coment.data_review_content;
                   tag += "</textarea>";
                   tag += "<input type='hidden' name='data_review_num' value='"+coment.data_review_num+"'/>";
                   tag += "<input type='button' value='Edit'/>";
                   tag += "</form>";
                   tag += "</div>";
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
	
	dataReplyList();
});
</script>

<main>
   <h1>자료 공유 게시판 글 내용 보기</h1>
   <ul class="dataOpen">
      <li>번호 : ${dto.data_num}</li>
      <li>글쓴이 : ${dto.mem_id}</li>
      <li>조회수 : ${dto.data_hit}</li>
      <li>등록일 : ${dto.data_wdate}</li>
      <li>제목 : ${dto.data_title}</li>
      <li><br>글내용<br/> ${dto.data_content}</li>
   </ul>   
   
   <div>
      <a href="/smhrd/data/dataEdit?data_num=${dto.data_num }">수정</a>
      <a href="javascript:dataDelChk()">삭제</a>
   </div>
   
   <div id="dataReply">
         <!-- <form method="post" id="dataReplyFrm"> -->
         <form method="post"   id="dataReplyFrm">
            <input type="hidden" name="data_num" value="${dto.data_num }">  
            <textarea name="data_review_content" id="dataComent"></textarea>
            <input type="submit" value="댓글 등록하기">
         </form>
      <hr/>
      <ul id="dataReplyList">
         
      </ul>
      
   </div>
</main>