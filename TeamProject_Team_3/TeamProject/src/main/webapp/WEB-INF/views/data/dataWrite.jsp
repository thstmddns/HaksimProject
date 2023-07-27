<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/smhrd/inc/ckeditor.js"></script>

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
		})
	});
</script>

<main>
	<h2 class="board">글쓰기/자료공유</h2>
	<form method="post" id="frm" action="/smhrd/data/dataWriteOk" enctype="multipart/form-data" class="writeFrm">
	<ul>
		<li class="text"># 제목</li>
		<li><input type="text" name="data_title"  size=112px style="line-height:30px; border:1px solid #D2D2D2;"/></li>
		<li class="text"># 내용</li>
		<li><textarea name="data_content" id="data_content"></textarea></li>
		<li class="text"># 첨부파일</li>
		<li id='filelist'>
			<div>
				<input type="file" name="filename" id="filename"/>
				<input type="button" value="+"/>	
			</div>
		</li>
		<div>
		<li><input type="submit" value="등록"/></li>
		</div>
		
	</ul>
	</form>
</main>

<script>
	CKEDITOR.ClassicEditor.create(document.getElementById("data_content"), option);
</script>

