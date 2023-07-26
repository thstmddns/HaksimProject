<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>커뮤니티 게시판 글 수정</h1>
	
	<form method="post" id="frm" action="/smhrd/community/communityEditOk" enctype="multipart/form-data">
	
	<input type="hidden" name="com_num" value="${dto.com_num }">
	<ul class="communityEdit">
		<li>제목</li>
		<li><input type="text" name="com_title" value="${dto.com_title}" size=135px style="line-height:30px"/></li>
		<li>글내용</li>
		<li><textarea name="com_content" id="com_content" >${dto.com_content}</textarea></li>
		<li><input type="submit" value="글수정"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("com_content"), option);
</script>