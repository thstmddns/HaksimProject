<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>


<main>
	<h2 class="board">글쓰기/커뮤니티</h2>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/smhrd/community/communityWriteOk" enctype="multipart/form-data" class="writeFrm">
	<ul class="communityWrite" id="cate">
		<select name="com_type" id="com_type">
				<option value="1">고민</option>
				<option value="2">건의</option>
				<option value="3">소통</option>
				<option value="4">맛집공유</option>	
		</select>
		<li class="text"># 제목</li>
		<li><input type="text" name="com_title"  size=112px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="com_content" id="com_content"></textarea></li>
		<li><input type="submit" value="등록"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("com_content"), option);
</script>