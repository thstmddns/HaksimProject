<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>


<main>
	<h2 class="board">글쓰기/수료생</h2>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/smhrd/after/afterWriteOk" enctype="multipart/form-data" class="writeFrm">
	<ul class="afterWrite" id="cate">
	<li>
		<select name="grad_type" id="grad_type">
				<option value="1">멘토링</option>
				<option value="2">채용공고</option>
				<option value="3">기타</option>	
		</select></li>
		<li class="text"># 제목</li>
		<li><input type="text" name="grad_title"  size=112px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="grad_content" id="grad_content"></textarea></li>
		<li style="align:right;"><input type="submit" value="등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("grad_content"), option);
</script>