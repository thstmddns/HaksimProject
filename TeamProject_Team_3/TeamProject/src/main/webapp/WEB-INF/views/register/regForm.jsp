<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <style>
		.id_ok{
		color:#00468C;
		display: none;
		margin-bottom:10px;
		}
		
		.id_already{
		color:#6A82FB; 
		display: none;
		}
		*{
	    padding: 0;
	    margin: 0;
	    border: none;
		}
	</style>
    <script>
	    function checkId(){
	       var mem_id = $('#mem_id').val(); //id값이 "id"인 입력란의 값을 저장
	       $.ajax({
	           url:'./idCheck', //Controller에서 요청 받을 주소
	           type:'post', //POST 방식으로 전달
	           data:{mem_id:mem_id},
	           success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	               if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                   $('.id_ok').css("display","inline-block"); 
	                   $('.id_already').css("display", "none");
	               } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                   $('.id_already').css("display","inline-block");
	                   $('.id_ok').css("display", "none");
	                   //alert("아이디를 다시 입력해주세요");
	                   //$('#mem_id').val('');
	               }
	           },
	           error:function(){
	               alert("에러입니다");
	           }
	       });
       };
       </script>
<main>
	<div class="wrapper">
	<h2 style="text-align:center;">Join</h2>
	
	<form method="post" action="/smhrd/register/registerOk" class="Form">
		<ul>
			<li style="margin-bottom:15px;">
			<select name="mem_type" id="mem_type">
				<option value='1'>학생</option>
				<option value='2'>선생님</option>	
				<option value='3'>관리자</option>	
			</select>
			</li>
			<li>
			<input type="text" name="mem_id" id="mem_id" oninput="checkId()" placeholder="아이디(영어 소문자 5자 이상 16자 미만)"/>
			<span class="id_ok">사용 가능한 아이디 입니다</span>
			<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
			</li>
			<li><input type="password" name="mem_password" id="mem_password"  placeholder="비밀번호(영어 소문자/숫자/특수문자 조합 8자 이상 16자 미만)"/></li>
			<li><input type="password" name="mem_password2" id="mem_password2" placeholder="비밀번호 확인"/></li>
			<li><input type="text" name="mem_age" id="mem_age"  placeholder="나이(만 나이)"/></li>
			<li><input type="email" name="mem_email" id="mem_email"  placeholder="이메일"/></li>
			<li><input type="text" name="mem_name" id="mem_name"  placeholder="이름"/></li>
  			<li><input type="text" name="mem_ca" id="mem_ca"  placeholder="기수"/></li>
			<li><input type="submit" value="회원가입" /></li>
		</ul>
	</form>
	</div>
</main>