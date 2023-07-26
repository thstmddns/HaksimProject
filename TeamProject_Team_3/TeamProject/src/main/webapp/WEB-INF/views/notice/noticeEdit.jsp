<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>
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

<main>
	<h1>글 수정 페이지</h1>
	
	<form method="post" id="frm" action="/smhrd/notice/noticeEditOk" enctype="multipart/form-data">
		<input type="hidden" name="notice_num" value="${dto.notice_num}">
		<ul class="dataEdit">
			<li>제목</li>
			<li><input type="text" name="notice_title" value="${dto.notice_title}" size=135px style="line-height:30px"/></li>
			<li>글내용</li>
			<li><textarea name="notice_content" id="content" >${dto.notice_content}</textarea></li>
			<li><input type="submit" value="글수정" /></li>
		</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>