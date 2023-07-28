<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<script>
	$(function() {
		$('.comChk').click(function(){
			typePage();
		});
		
		const searchParams = new URLSearchParams(location.search);

		for(const param of searchParams){
			var key = param[0];
			var val = param[1];
			
			if(key = 'com_type'){
				if(val == 0){
					$('#comChk0').prop("checked", true);
				} else if(val == 1){
					$('#comChk1').prop("checked", true);
				} else if(val == 2){
					$('#comChk2').prop("checked", true);
				} else if(val == 3){
					$('#comChk3').prop("checked", true);
				}
				else if(val == 4){
					$('#comChk4').prop("checked", true);
				}
			}
		}
	});
	
	function typePage(){
		var com_type = document.querySelector('input[name="comChk"]:checked').value;
		console.log(com_type);
		location.href = 'http://localhost:8080/smhrd/community/communityList?com_type='+com_type;
	}

</script>
<main>
	<h1 class="Sub">커뮤니티 게시판</h1>	
	<div>
		<h5 style="margin:30px;"># Category</h5>
		<div style="margin:30px;">
		<input type='radio' name='comChk' class='comChk' value='0' id='comChk0'/> 전체
		<input type='radio' name='comChk' class='comChk' value='1' id='comChk1'/> 고민
		<input type='radio' name='comChk' class='comChk' value='2' id='comChk2'/> 건의
		<input type='radio' name='comChk' class='comChk' value='3' id='comChk3'/> 소통
		<input type='radio' name='comChk' class='comChk' value='4' id='comChk4'/> 맛집공유
		<br>
		</div>
		<a href="${pageContext.request.contextPath}/community/communityWrite"><button type="button" class="btn btn-outline-primary"  id="writeBtn" style="margin:10px;">게시글 작성</button></a>
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
			<li>${dto.com_num}</li>
			
			<c:if test="${dto.com_type == 1}">
				<li>고민</li>
			</c:if>
			<c:if test="${dto.com_type == 2}">
				<li>건의</li>
			</c:if>
			<c:if test="${dto.com_type == 3}">
				<li>소통</li>
			</c:if>
			<c:if test="${dto.com_type == 4}">
				<li>맛집공유</li>
			</c:if>
			
			<!--<button class="">맛집추천</button>-->
			
			<li><a href="/smhrd/community/communityView/${dto.com_num}">${dto.com_title }</a></li>
			
			<li>익명</li>
			
			<li>${dto.com_wdate}</li>
			
			<li>${dto.com_hit}</li>	
		</c:forEach>
	</ul>
	<div class="page">
		<ul>
			<!-- 가장 첫 페이지시 이전페이지 버튼 비활성화 -->	
			<c:if test="${pDTO.nowPage==1 }">
				<li>prev</li>			
			</c:if>
			<!-- 이전 페이지 -->
			<c:if test="${pDTO.nowPage>1 }">
				<li><a href='/smhrd/community/communityList?com_type=${pDTO.com_type}&nowPage=${pDTO.nowPage-1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
			</c:if>
			
			<!-- forEach : 변수, 시작, 끝, 증가값(생략가능) -->
			<c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum + pDTO.onePageNumCount - 1}" step="1"> 
				<c:if test="${p <= pDTO.totalPage}">
					<!-- 선택한 페이지 번호 표시 -->
					<c:if test="${p == pDTO.nowPage }">		
						<li style="background: #00468C; border-radius: 50%; width:25px; height:25px;">
							<a style="color: white" href='/smhrd/community/communityList?com_type=${pDTO.com_type}&nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a>
						</li>
					</c:if>
					
					<!-- 선택되지 않은 페이지 번호들 표시x -->
					<c:if test="${p != pDTO.nowPage }">		
						<li><a href='/smhrd/community/communityList?com_type=${pDTO.com_type}&nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>					
				</c:if>
			</c:forEach>
			
			
			<c:if test="${pDTO.nowPage >= pDTO.totalPage }">
				<li>next</li>
			</c:if>
			<c:if test="${pDTO.nowPage < pDTO.totalPage }">
				<li><a href='/smhrd/community/communityList?com_type=${pDTO.com_type}&nowPage=${pDTO.nowPage+1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
			</c:if>
		</ul>
	</div>
	
	<div class="search">
		<form action="/smhrd/community/communityList">
			<select name="searchKey">
				<option value="com_title">제목</option>
				<option value="com_content">글내용</option>
				<option value="mem_id">글쓴이</option>
			</select>
			<input type="hidden" name="com_type" id="com_type" class="com_type" value="${pDTO.com_type}"/>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
	
</main>
	