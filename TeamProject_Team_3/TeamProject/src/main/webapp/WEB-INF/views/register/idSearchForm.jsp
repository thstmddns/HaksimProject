<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script>
$(function(){
	$("#id_submit").click(function(){
		console.log(JSON.stringify({
			mem_name:$("#mem_name").val(),
			mem_email:$("#mem_email").val()
		}));
		$.ajax({
			url : '/smhrd/register/idSearchResult',
			headers: {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			data:JSON.stringify({
				mem_name:$("#mem_name").val(),
				mem_email:$("#mem_email").val()
			}),
			type:"post",
			success:function(result){
				if(result.resultTxt=='Y'){
					location.href="/smhrd/register/idSearchResult";
				}else{
					alert("일치하는 정보가 존재하지 않습니다.")
				}
			},error:function(){
				console.log("아이디 찾기 에러 발생")
			}
		});
	});
});
</script> -->
<main>
	<h1>아이디 찾기</h1>
	<form action="/smhrd/register/idSearchResult" method="post">
		<ul>		
			<li>이름 : <input type="text" name="mem_name" id="mem_name"/></li>
			<li>이메일 : <input type="text" name="mem_email" id="mem_email" placeholder="예)sm7@smhrd.or.kr" /></li>
			<li><input type="submit" value="아이디찾기" /></li>
		</ul>
	</form>
</main>