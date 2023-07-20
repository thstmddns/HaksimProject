<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>
<style>
	main {
	 	width:1000px;
	 	margin:0 auto;
	 }
	.ck-editor__editable[role="textbox"] {/* editing area */
	   min-height: 400px;
	}
	.ck-content .image {/* block images */
		max-width: 80%;
		margin: 20px auto;
	}
	.dataWrite li {
		margin-top:10px;
		list-style-type: none;
	}
</style>

<main>
	<h1>수료생 게시판 글쓰기</h1>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/smhrd/after/afterWriteOk" enctype="multipart/form-data">
	<ul class="dataWrite">
		<select name="grad_type" id="cateNum">
				<option value="1">멘토링</option>
				<option value="2">채용공고</option>
				<option value="3">기타</option>	
		</select>
		<li>제목</li>
		<li><input type="text" name="subject" size=130px style="line-height:30px"/></li>
		<li>글내용</li>
		<li><textarea name="content" id="content"></textarea></li>
		<li><input type="submit" value="글등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>