<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form method="post" action="/smhrd/community/communityEditOk">
	
		<input type="hidden" name="com_num" value="${dto.com_num}">
		<input type="hidden" name="nowPage" value="${pDTO.nowPage}">
		<c:if test="${pDTO.searchWord!=null}">
			<input type="hidden" name="searchKey" value="${pDTO.searchKey}">
			<input type="hidden" name="searchWord" value="${pDTO.searchWord}">
		</c:if>
	
	<ul>
		<li>제목</li>
		<li><input type="text" name="com_title" id="com_title" value="${dto.com_title}"/></li>
		<li>글내용</li>
		<textarea name="com_content" id="com_content">${dto.com_content}</textarea>
		<input style="margin-top:10px" align="right" type="submit" value="글수정"/>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("com_content"), option);
</script>