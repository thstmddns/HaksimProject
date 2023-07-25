<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.afterWrite li {
		margin-top:10px;
		list-style-type: none;
	}
</style>

<main>
	<h1>커뮤니티 게시판 글쓰기</h1>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/smhrd/community/communityWriteOk" enctype="multipart/form-data">
	<ul class="communityWrite">
		<select name="com_type" id="com_type">
				<option value="1">고민</option>
				<option value="2">건의</option>
				<option value="3">소통</option>	
		</select>
		<li>제목</li>
		<li><input type="text" name="com_title" size=130px style="line-height:30px"/></li>
		<li>글내용</li>
		<li><textarea name="com_content" id="com_content"></textarea></li>
		<li><input type="submit" value="글등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("com_content"), option);
</script>