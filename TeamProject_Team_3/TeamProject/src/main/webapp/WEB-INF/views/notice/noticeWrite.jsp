<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>


<main>
	<h2 class="board">글쓰기/공지</h2>
	
	<form method="post" id="frm" action="/smhrd/notice/noticeWriteOk" enctype="multipart/form-data" class="writeFrm">
	<ul>
		<li class="text"># 제목</li>
		<li><input type="text" name="notice_title" size=111px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="notice_content" id="content"></textarea></li>
		<div>
		<li><input type="submit" value="등록"/></li>
		</div>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>