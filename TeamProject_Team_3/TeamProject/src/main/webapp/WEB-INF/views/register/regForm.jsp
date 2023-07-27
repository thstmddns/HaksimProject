<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <style>
		.id_ok{
		color:#008000;
		display: none;
		}
		
		.id_already{
		color:#6A82FB; 
		display: none;
		}
		.password_ok{
		color:#008000;
		display: none;
		}
	</style>
    <script>
	    function checkId(){
	       var mem_id = $('#mem_id').val(); //id값이 "id"인 입력란의 값을 저장
	       var reg_id = /^[a-z]+$/;
	       $.ajax({
8
	        	   if (!reg_id.test(mem_id)){
	        		   $('.id_reg').css("display","inline-block"); 
	        		   $('.id_ok').css("display","none"); 
	                   $('.id_already').css("display", "none");
	        	   }
	        	   else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                   $('.id_ok').css("display","inline-block"); 
	                   $('.id_already').css("display", "none");
	                   $('.id_reg').css("display","none"); 
	               } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                   $('.id_already').css("display","inline-block");
	                   $('.id_ok').css("display", "none");
	                   $('.id_reg').css("display","none");
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
		<script>
		function checkPassword() {
		    var mem_password = $('#mem_password').val();
		    var reg_password = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,16}$/;

            if (!reg_password.test(mem_password)) {
                $('.password_reg').css("display", "inline-block");
                $('.password_ok').css("display", "none");
            } else {
                $('.password_ok').css("display", "inline-block");
                $('.password_reg').css("display", "none");
            }
        };
		</script>
<main>
	<h1>회원가입폼</h1>
	
	<form method="post" action="/smhrd/register/registerOk">
		<ul>
			<select name="mem_type" id="mem_type">
				<option value='1'>학생</option>
				<option value='2'>선생님</option>	
				<option value='3'>관리자</option>	
			</select>
			<li>아이디 : <input type="text" name="mem_id" id="mem_id" oninput="checkId()" minlength="5" maxlength="16" placeholder="아이디는 영어 소문자 5자 이상 16자 미만" size="30px"/></li><span class="id_ok">사용 가능한 아이디 입니다</span><span class="id_already">누군가 이 아이디를 사용하고 있어요.</span><span class ="id_reg">아이디는 영어 소문자만 사용할 수 있어요.</span>
			<li>비밀번호 : <input type="password" name="mem_password" id="mem_password" oninput="checkPassword()" minlength="8" maxlength="16" placeholder="비밀번호는 영어 소문자, 숫자, 특수문자 조합 8자 이상 16자 미만" size="40px"/></li><span class="password_ok">사용 가능한 비밀번호입니다.</span><span class="password_reg">비밀번호는 영어 소문자, 숫자, 특수문자 조합만 사용할 수 있어요.</span>
			<li>비밀번호 확인 : <input type="password" name="mem_password2" minlength="5" maxlength="16" id="mem_password2" placeholder="비밀번호는 영어 소문자, 숫자, 특수문자 조합 8자 이상 16자 미만" size="40px"/></li>
			<li>나이 : <input type="text" name="mem_age" id="mem_age" /></li>
			<li>이메일 : <input type="email" name="mem_email" id="mem_email" /></li>
			<li>이름 : <input type="text" name="mem_name" id="mem_name" /></li>
  			<li>기수 입력 : <input type="text" name="mem_ca" id="mem_ca" /></li>
			<li><button>회원가입하기</button></li>
		</ul>
	</form>
</main>