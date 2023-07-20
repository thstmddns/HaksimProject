<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
<style>
	.ck-editor__editable[role="textbox"] {/* editing area */
	   min-height: 200px;
	}
	.ck-content .image {/* block images */
		max-width: 80%;
		margin: 20px auto;
	}
	.dataEdit li {
		margin-top:10px;
	}
	#filelist b {
		cursor:pointer;
	}
	
</style>
<script>
	$(function(){
		$(document).on('click','#frm input[value="+"]',function(){

			var tag = "<div><input type='file' name='filename'/><input type='button' value='+' /></div>";
			$("#filelist").append(tag);
			$(this).val('-');
		});
		
		$(document).on('click','#frm input[value="-"]',function(){
			$(this).parent().remove();
		});

		$("#filelist b").click(function() {
			$(this).parent().css("display", "none");    
			$(this).parent().next().attr("name", "delFile");
		
		});
	});
</script>

<main>
	<h1>글 수정 페이지</h1>
	
	<form method="post" id="frm" action="/smrhd/notice/noticeEdit" enctype="multipart/form-data">
	<input type="hidden" name="no" value="${notice.notice_num }">
	<ul class="dataEdit">
		<li>제목</li>
		<li><input type="text" name="subject" value="${notice.notice_title}" size=135px style="line-height:30px"/></li>
		<li>글내용</li>
		<li><textarea name="content" id="content" >${notice.notice_content}</textarea></li>
		<li><input type="submit" value="글수정"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>