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
	.afterEdit li {
		margin-top:10px;
	}
	#filelist b {
		cursor:pointer;
	}
	
</style>


<main>
	<h2 class="board">게시글 수정/수료생</h2>
	<form method="post" id="frm" action="/smhrd/after/afterEditOk" enctype="multipart/form-data" class="editFrm">
	
	<input type="hidden" name="grad_num" value="${dto.grad_num }">
	<ul class="afterEdit">
		<li class="text"># 제목</li>
		<li><input type="text" name="grad_title" value="${dto.grad_title}" size=112px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="grad_content" id="grad_content" >${dto.grad_content}</textarea></li>
		<li><input type="submit" value="게시글 수정"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("grad_content"), option);
</script>