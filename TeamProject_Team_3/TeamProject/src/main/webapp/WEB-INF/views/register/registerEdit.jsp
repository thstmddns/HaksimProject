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
	<h1>회원정보 수정</h1>
	
	<form method="post" id="frm" action="/smhrd/register/registerEditOk" enctype="multipart/form-data">
	
	<input type="hidden" name="mem_id" value="${mem_id.mem_id }">
		<ul class="memberEdit">
			<li>비밀번호</li>
			<li><input type="text" name="mem_password" value="${mem_id.mem_password}" /></li>
			<li>멤버등급</li>
			<li><input type="text" name="mem_type" value="${mem_id.mem_type}" /></li>
			<li>이메일</li>
			<li><input type="text" name="mem_email" value="${mem_id.mem_email}" /></li>
			<li>이름</li>
			<li><input type="text" name="mem_name" value="${mem_id.mem_name}" /></li>
			<li>멤버기수</li>
			<li><input type="text" name="mem_ca" value="${mem_id.mem_ca}" /></li>
			<li><input type="submit" value="회원정보 수정"/></li>
		</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("mem_id"), option);
</script>