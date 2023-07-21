<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#pw_submit").click(function(){
			console.log(1)
			console.log(JSON.stringify({
				mem_name:$("#mem_name").val(),
				mem_id:$("#mem_id").val(),
				mem_email:$("#mem_email").val()
			}));
			$.ajax({
				url : '/smhrd/register/passwordSearchOk',
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				data:JSON.stringify({
					mem_name:$("#mem_name").val(),
					mem_id:$("#mem_id").val(),
					mem_email:$("#mem_email").val()
				}),
				type:"post",
				success:function(result){
					if(result=='Y'){
						alert("비밀번호를 이메일로 전송하였습니다.")
						location.href="/smhrd/register/login";
					}else{
						alert("일치하는 정보가 존재하지 않습니다.")
					}
				},error:function(){
					console.log("비밀번호 찾기 에러 발생")
				}
			});
		});
	});
</script>
<main>
	<h1>비밀번호 찾기</h1>
	<ul>
		<li>이름 : <input type="text" name="mem_name" id="mem_name"/></li>
		<li>아이디 : <input type="text" name="mem_id" id="mem_id"/></li>
		<li>이메일 : <input type="text" name="mem_email" placeholder="예)sm7@smhrd.or.kr" id="mem_email"/></li>
		<li><input type="button" value="비밀번호찾기" id="pw_submit"/></li>		
	</ul>
</main>