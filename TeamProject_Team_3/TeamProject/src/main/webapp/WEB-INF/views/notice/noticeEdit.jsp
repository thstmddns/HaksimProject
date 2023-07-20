<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
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
<script>
	// document가 로딩이 완료되면 ready 이벤트에 의해서 호출됨
	$(function(){
		// 이벤트 선택자, 
		$(document).on('click','#frm input[value="+"]',function(){
			// 파일 첨부 추가
			var tag = "<div><input type='file' name='filename'/><input type='button' value='+' /></div>";
			$("#filelist").append(tag);
			
			// 추가된 파일첨부 '+' >> '-'
			$(this).val('-');
		});
		
		$(document).on('click','#frm input[value="-"]',function(){
			$(this).parent().remove();
		});
		
		// 수정시 파일 삭제를 할 경우 파일명은 화면에서 숨기고
		// hidden input은 name 속성 설정해주기
		$("#filelist b").click(function() {
			$(this).parent().css("display", "none");    // 삭제된 파일명 숨기기
			// 삭제된 파일명을 가진 input을 name 속성 설정하기
			// html 속성을 바꾸는 함수 -> attr: 속성과 값, 		prop: 속성만 있을 때
			//                       name = "name"  checked, readonly, selected, ...
			$(this).parent().next().attr("name", "delFile");
		
		});
	});
</script>

<main>
	<h1>자료실 글 수정</h1>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/home/data/dataEditOk" enctype="multipart/form-data">
	<!-- 현재 수정글의 글번호를 폼에 보관(보이지x) => 수정 기준이 되는 레코드 번호로 사용 -->
	<input type="hidden" name="no" value="${dto.no }">
	<ul class="dataEdit">
		<li>제목</li>
		<li><input type="text" name="subject" value="${dto.subject}" size=135px style="line-height:30px"/></li>
		<li>글내용</li>
		<li><textarea name="content" id="content" >${dto.content}</textarea></li>
		<li>첨부파일</li>
		<li id='filelist'>
			<!-- 이미 첨부된 파일을 다시 수정할 수 있도록 해주기 -->
			<c:forEach var="fileDTO" items="${fileList}">
				<div>${fileDTO.filename}&nbsp&nbsp&nbsp<b>X</b></div>
				<input type="hidden" name="" value="${fileDTO.filename}"/>
			</c:forEach>
			<br>
			<div>
				<input type="file" name="filename" id="filename" />
				<input type="button" value="+"/>	
			</div>
		</li>
		<li><input type="submit" value="글수정"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
</script>