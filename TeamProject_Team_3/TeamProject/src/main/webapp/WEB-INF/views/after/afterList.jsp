<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	$(function() {
		
		$('.cateChk').click(function(){
			typePageGo();
		});
		
		const searchParams = new URLSearchParams(location.search);

		for(const param of searchParams){
			var key = param[0];
			var val = param[1];
			
			if(key = 'grad_type'){
				if(val == 0){
					$('#cateChk0').prop("checked", true);
				} else if(val == 1){
					$('#cateChk1').prop("checked", true);
				} else if(val == 2){
					$('#cateChk2').prop("checked", true);
				} else if(val == 3){
					$('#cateChk3').prop("checked", true);
				}
			}
		}
	}); 
	
	function typePageGo(){
		var grad_type = document.querySelector('input[name="cateChk"]:checked').value;
		console.log(grad_type);
		location.href = 'http://localhost:8080/smhrd/after/afterList?grad_type=' + grad_type;
	}

</script>
<main>
	<h1 class="Sub">수료생 게시판</h1>
	<div>
		<h5 style="margin:30px;">Category</h5>
		<div style="margin:30px;">
		<input type='radio' name='cateChk' class='cateChk' value='0' id='cateChk0'/> 전체
		<input type='radio' name='cateChk' class='cateChk' value='1' id='cateChk1'/> 멘토링
		<input type='radio' name='cateChk' class='cateChk' value='2' id='cateChk2'/> 채용공고
		<input type='radio' name='cateChk' class='cateChk' value='3' id='cateChk3'/> 기타
		<br>
		</div>
		<a href="${pageContext.request.contextPath}/after/afterWrite"><button type="button" class="btn btn-outline-primary" id="writeBtn" style="margin:10px;">게시글 작성</button></a>
	</div>
	<div style="margin:30px;">총 레코드 수 : ${pDTO.totalRecord}개</div>
	<ul class="List2">
		<li>no</li>
		<li>카테고리</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<c:forEach var="dto" items="${list}">
			<li>${dto.grad_num}</li>
			<c:if test="${dto.grad_type == 1}">
				<li>멘토링</li>
			</c:if>
			<c:if test="${dto.grad_type == 2}">
				<li>채용공고</li>
			</c:if>
			<c:if test="${dto.grad_type == 3}">
				<li>기타</li>
			</c:if>
			<li><a href="/smhrd/after/afterView/${dto.grad_num}">${dto.grad_title}</a></li>
			<li>${dto.mem_id}</li>
			<li>${dto.grad_wdate}</li>
			<li>${dto.grad_hit}</li>	
		</c:forEach>
	</ul>
	<div class="page">
		<ul>
			
			<!-- 맨 앞 페이지 -->
			<c:if test="${pDTO.nowPage>1}">
				<li><a href="/smhrd/after/afterList?grad_type=${pDTO.grad_type}">front</a></li>
			</c:if>
			<!-- 이전 페이지 -->
			<c:if test="${pDTO.nowPage==1}">
			<li>prev</li>
			</c:if>
			<c:if test="${pDTO.nowPage>1}">
			<li><a href='/smhrd/after/afterList?grad_type=${pDTO.grad_type}&nowPage=${pDTO.nowPage-1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<!--	   변수 	     시작값 						끝값	   증가값 -->
			<!-- totalPage보다 큰 페이지 번호는 출력 x -->
			<c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum+pDTO.onePageNumCount-1}" step="1">
				<c:if test="${p<=pDTO.totalPage}">
					<c:if test="${p==pDTO.nowPage}">
						<li style="background: #00468C; border-radius: 50%; width:25px; height:25px;"><a href='/smhrd/after/afterList?grad_type=${pDTO.grad_type}&nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>' style="color: white">${p}</a></li>
					</c:if>
					<c:if test="${p!=pDTO.nowPage}">
						<li><a href='/smhrd/after/afterList?grad_type=${pDTO.grad_type}&nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>
				</c:if>	
			</c:forEach>
				
			<!-- 다음 페이지 -->
			<c:if test="${pDTO.totalPage<=pDTO.nowPage}">
				<li>next</li>
			</c:if>
			<c:if test="${pDTO.totalPage>pDTO.nowPage}">
				<li><a href='/smhrd/after/afterList?grad_type=${pDTO.grad_type}&nowPage=${pDTO.nowPage+1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
			</c:if>
			<c:if test="${pDTO.totalPage>pDTO.nowPage}">
				<li><a href="/smhrd/after/afterList?grad_type=${pDTO.grad_type}&nowPage=${pDTO.totalPage}">back</a></li>
			</c:if>
			
		</ul>
	</div>
	
	
	
	<div class="search">
		<form action="/smhrd/after/afterList">
			<select name="searchKey">
				<option value="grad_title">제목</option>
				<option value="grad_content">글내용</option>
				<option value="mem_id">글쓴이</option>	
			</select>
			<input type="hidden" name="grad_type" id="grad_type" class="grad_type" value="${pDTO.grad_type}"/>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
</main>