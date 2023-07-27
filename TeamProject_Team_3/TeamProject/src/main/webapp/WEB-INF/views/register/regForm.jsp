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
.password2_ok{
color:#008000;
display: none;
}
</style>
<script>
var r1 = false;
var r2 = false;
var r3 = false;
</script>
<script>
function checkId(){
	console.log(1);
   var mem_id = $('#mem_id').val(); //id값이 "id"인 입력란의 값을 저장
   var reg_id = /^[a-z]+$/;
   $.ajax({
       url:'./idCheck', //Controller에서 요청 받을 주소
       type:'post', //POST 방식으로 전달
       data:{mem_id:mem_id},
       success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
    	   if (!reg_id.test(mem_id)){
    		   $('.id_reg').css("display","inline-block"); 
    		   $('.id_ok').css("display","none"); 
               $('.id_already').css("display", "none");
               r1=false;
    	   }
    	   else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
               $('.id_ok').css("display","inline-block"); 
               $('.id_already').css("display", "none");
               $('.id_reg').css("display","none");
               r1=true;
           } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
               $('.id_already').css("display","inline-block");
               $('.id_ok').css("display", "none");
               $('.id_reg').css("display","none");
               r1=false;
               //alert("아이디를 다시 입력해주세요");
               //$('#mem_id').val('');
           }
       },
       error:function(){
           alert("에러입니다");
       }
   })
};
</script>
<script>
function checkPassword() {
    var mem_password = $('#mem_password').val();
    var reg_password = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,16}$/;

    if (!reg_password.test(mem_password)) {
        $('.password_reg').css("display", "inline-block");
        $('.password_ok').css("display", "none");
        r2 = false;
    } else {
        $('.password_ok').css("display", "inline-block");
        $('.password_reg').css("display", "none");
        r2 = true;
    }
    enableOrDisableSignUpButton();
};
</script>
<script>
function checkPassword2() {
	var mem_password = $('#mem_password').val();
    var mem_password2 = $('#mem_password2').val();

    if (mem_password != mem_password2) {
        $('.password2_reg').css("display", "inline-block");
        $('.password2_ok').css("display", "none");
    } else {
        $('.password2_ok').css("display", "inline-block");
        $('.password2_reg').css("display", "none");
        r3 = true;
    }
    enableOrDisableSignUpButton();
};

function enableOrDisableSignUpButton() {
    if (r1 && r2 && r3) { // 모든 체크 조건을 만족하면 버튼 활성화
        enableSignUpButton();
    } else { // 하나라도 만족하지 않으면 버튼 비활성화
        disableSignUpButton();
    }
}
</script>
<script>
// 버튼 활성화 함수
function enableSignUpButton() {
    $('input[type="submit"]').prop('disabled', false);
}

// 버튼 비활성화 함수
function disableSignUpButton() {
    $('input[type="submit"]').prop('disabled', true);
}
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
			<li>비밀번호 : <input type="password" name="mem_password" id="mem_password" oninput="checkPassword()" minlength="8" maxlength="16" placeholder="비밀번호는 영어 소문자, 숫자, 특수문자 조합 8자 이상 16자 미만" size="50px"/></li><span class="password_ok">사용 가능한 비밀번호입니다.</span><span class="password_reg">비밀번호는 영어 소문자, 숫자, 특수문자 조합만 사용할 수 있어요.</span>
			<li>비밀번호 확인 : <input type="password" name="mem_password2" id="mem_password2" oninput="checkPassword2()" minlength="5" maxlength="16" placeholder="비밀번호와 똑같이 작성해주세요" size="50px"/></li><span class="password2_ok">사용 가능한 비밀번호입니다.</span><span class="password2_reg">비밀번호가 다릅니다.</span>
			<li>나이 : <input type="text" name="mem_age" id="mem_age" /></li>
			<li>이메일 : <input type="email" name="mem_email" id="mem_email" /></li>
			<li>이름 : <input type="text" name="mem_name" id="mem_name" /></li>
  			<li>기수 입력 : <input type="text" name="mem_ca" id="mem_ca" /></li>
			<li><input type="submit" value="회원가입" disabled /></li>
		</ul>
	</form>
</main>