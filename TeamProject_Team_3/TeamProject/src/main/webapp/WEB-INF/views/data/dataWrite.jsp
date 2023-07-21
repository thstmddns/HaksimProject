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
		})
	});
</script>

<main>
	<h1>게시판 글쓰기</h1>
	<form method="post" action="/smhrd/data/dataWrite">
		<ul>
		<h3>제목</h3>
		<li><input type="text" name="subject"/></li>
		<h3>글내용</h3>
		<li><textarea name="content" id="content"></textarea></li>
		<h3>첨부파일</h3>
		<li id='filelist'>
			<div>
				<input type="file" name="filename" id="filename" />
				<input type="button" value="+"/>	
			</div>
		</li>
		<li><input type="submit" value="글등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>