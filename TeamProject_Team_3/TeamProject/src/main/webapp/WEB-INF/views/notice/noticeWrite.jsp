<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>

<style>
ul,li{
		margin: 0px;	
		padding: 0px;	
		list-style-type: none;
}
.ck-editor__editable[role="textbox"] {/* editing area */
   min-height: 200px;
}
.ck-content .image {/* block images */
	max-width: 80%;
	margin: 20px auto;
}
</style>

<main>
	<h2 class="board">글쓰기/공지</h2>
	
	<form method="post" id="frm" action="/smhrd/notice/noticeWriteOk" enctype="multipart/form-data" class="writeFrm">
	<ul>
		<li>제목</li>
		<li><input type="text" name="notice_title" size=116px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li>글내용</li>
		<li><textarea name="notice_content" id="content"></textarea></li>
		<li><input type="submit" value="글등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>