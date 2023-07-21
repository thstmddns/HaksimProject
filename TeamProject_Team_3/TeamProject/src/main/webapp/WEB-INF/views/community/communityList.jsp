<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.community_list {
		overflow:auto;
		list-style-type: none;
	}
	.community_list>li{
	 	float:left;
	 	width:10%;
	 	height:40px;
	 	line-height:40px;
	 	border-bottom:1px solid #ddd;
	 	text-align:center;
	 }
	 .community_list>li:nth-child(5n+2) {
	 	width:60%;
	 	/*말줄임표시*/
	 	white-space:nowrap;  /*줄 바꾸지 않기*/
	 	overflow:hidden;   /*넘친값 숨기기*/
	 	text-overflow:ellipsis;   /* ... 표시하기 */
	 }
	 .page>ul {
	 	overflow:auto;
	 	list-style-type: none;
	 	display:flex;
	 	justify-content:center;
	 	margin-top:10px;
	 }
	 .page li {
	 	float:left;
	 	width:40px;
	 	height:40px;
	 	text-align:center;
	 }
	.search {
	 	text-align:center;
	 	height:40px;
	 	margin-top:10px;
	 } 
	 .searchWord {
	 	width: 300px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 2px solid black;
    }
    .searchBtn {
       width: 100px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 1px solid black;
    }


</style>

<main>
	<h1 align="center">커뮤니티 게시판</h1>
	
	<div>
		<a href="/smhrd/community/communityWrite"><button >글쓰기</button></a>
		<span style="margin-left: 800px">총 게시글 수 : ${pDTO.totalRecord}</span>
	</div>
	
	<ul class="community_list">
		<li>no</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<!-- 
			var: 변수 
			items: 데이터 
		-->
		<c:forEach var="dto" items="${list}">	
			<li>${dto.com_num}</li>
			<li><a href="/smhrd/community/communityView/${dto.com_num}">${dto.com_title }</a></li>
			<li>${dto.mem_id }</li>
			<li>${dto.com_wdate }</li>
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
				<li><a href='/smhrd/community/communityList?nowPage=${pDTO.nowPage-1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
			</c:if>
			
			<!-- forEach : 변수, 시작, 끝, 증가값(생략가능) -->
			<c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum + pDTO.onePageNumCount - 1}" step="1"> 
				<c:if test="${p <= pDTO.totalPage}">
					<!-- 선택한 페이지 번호 표시 -->
					<c:if test="${p == pDTO.nowPage }">		
						<li style="background: #004d40; border-radius: 50%; width:25px; height:25px;">
							<a style="color: white" href='/smhrd/community/communityList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a>
						</li>
					</c:if>
					
					<!-- 선택되지 않은 페이지 번호들 표시x -->
					<c:if test="${p != pDTO.nowPage }">		
						<li><a href='/smhrd/community/communityList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>					
				</c:if>
			</c:forEach>
			
			
			<c:if test="${pDTO.nowPage >= pDTO.totalPage }">
				<li>next</li>
			</c:if>
			<c:if test="${pDTO.nowPage < pDTO.totalPage }">
				<li><a href='/smhrd/community/communityList?nowPage=${pDTO.nowPage+1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
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
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="Search"/>
		</form>
	</div>
	
</main>
	