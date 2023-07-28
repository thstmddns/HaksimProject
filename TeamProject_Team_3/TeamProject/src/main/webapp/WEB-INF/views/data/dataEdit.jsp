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
	#filelist b {
		cursor: pointer;
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
		// 수정 시 파일 삭제 할 경우 파일명은 화면에서 숨김,
		// hidden input은 name속성을 설정
		$("#filelist b").click(function () {
				// 삭제된 파일명 숨김
				$(this).parent().css("display","none");
				// 삭제된 파일명을 가진 input을 name속성 설정

				// attr() : 속성과 값 / prop() : 속성만
				// name="name" / checked, readonly, selected, ...
				$(this).parent().next().attr("name", "delFile");
		});
		
	});
</script>

<main>
	<h2 class="board">게시글 수정/자료공유</h2>
	<!-- 파일첨부가 있을 경우  form 태그에 enctype속성을 반드시 기술해야됨 -->
	<form method="post" id="frm" action="/smhrd/data/dataEditOk" enctype="multipart/form-data" class="editFrm">
	<!-- 현재 수정하는 글의 글 번호를 폼에 보관 (나중에 수정 기준이 되는 레코드 번호를 사용) -->
	<input type="hidden" name="data_num" value="${dto.data_num }">
	<ul>
		<li class="text"># 제목</li>
		<li><input type="text" name="data_title" value="${dto.data_title }" size=111px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="data_content" id="data_content">${dto.data_content }</textarea></li>
		<li class="text"># 첨부파일</li>
		<li id='filelist'>
			<!-- 이미 첨부된 파일을 다시 수정할 수 있도록 하는 -->
			<c:forEach var="fileDTO" items="${fileList }">
				<div>${fileDTO.filename } <b>X</b></div>
				<!-- 첨부파일 수의 따라서 히든버튼의 수가 생성됨 -->
				<input type="hidden" name="" value="${fileDTO.filename } ">
			</c:forEach>
			
			<div>
				<input type="file" name="filename" id="filename" />
				<input type="button" value="+"/>	
			</div>
		</li>
		<li><input type="submit" value="게시글 수정"/></li>
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("data_content"), option);
</script>