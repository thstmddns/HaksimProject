<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
<<<<<<< HEAD
#afterWriteBtn{
	margin-left:100px;	
}

.after_List {
	margin-left:100px;
	margin-right:100px;
	padding: 0px;
	overflow:auto;
	list-style-type: none;
}
	
.after_List > li{
	 float:left;
	 height:40px;
	 line-height:40px;
	 border-bottom:1px solid #ddd;
	 width:10%;
	 text-align:center;
}

.after_List > li:nth-child(6n+3) {
	 width:50%;
	 /*말줄임표시*/
	 white-space:nowrap;  /*줄 바꾸지 않기*/
	 overflow:hidden;   /*넘친값 숨기기*/
	 text-overflow:ellipsis;   /* ... 표시하기 */
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


#adminList{
	padding: 0px;
}
=======
	.after_List {
		overflow:auto;
		list-style-type: none;
	}
	.after_List>li{
	 	float:left;
	 	width:10%;
	 	height:40px;
	 	line-height:40px;
	 	border-bottom:1px solid #ddd;
	 	text-align:center;
	 }
	 .after_List>li:nth-child(5n+2) {
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
>>>>>>> a5ceef1db85b52c0e587c99b4380b7ccf2fa5d55

</style>



<main>
	<h1>수료생 게시판 목록</h1>
	<div id="afterWriteBtn">
		<a href="${pageContext.request.contextPath}/after/afterWrite"><button>글쓰기</button></a>
	</div>
<<<<<<< HEAD

	<div>
		<ul class="after_List">
			<li>no</li>
			<li>제목</li>
			<li>내용</li>
			<li>글쓴이</li>
			<li>등록일</li>
			<li>조회수</li>
			
			<c:forEach var="dto" items="${list}">
				<li>${dto.grad_num}</li>
				<li><a href="/smhrd/after/afterView/${dto.grad_num}">${dto.grad_title}</a></li>
				<li>${dto.grad_content}</li>
				<li>${dto.mem_id}</li>
				<li>${dto.grad_wdate}</li>
				<li>${dto.grad_hit}</li>	
			</c:forEach>
		</ul>
	</div>

=======
	<div>총 레코드 수 : ${pDTO.totalRecord}개</div>
	<ul class="after_List">
		<li>no</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<c:forEach var="dto" items="${list}">
			<li>${dto.grad_num}</li>
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
				<li><a href="/smhrd/after/afterList">front</a></li>
			</c:if>
			<!-- 이전 페이지 -->
			<c:if test="${pDTO.nowPage==1}">
			<li>prev</li>
			</c:if>
			<c:if test="${pDTO.nowPage>1}">
			<li><a href='/smhrd/after/afterList?nowPage=${pDTO.nowPage-1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<!--	   변수 	     시작값 						끝값	   증가값 -->
			<!-- totalPage보다 큰 페이지 번호는 출력 x -->
			<c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum+pDTO.onePageNumCount-1}" step="1">
				<c:if test="${p<=pDTO.totalPage}">
					<c:if test="${p==pDTO.nowPage}">
						<li style="background:#FFDCE1"><a href='/smhrd/after/afterList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>
					<c:if test="${p!=pDTO.nowPage}">
						<li><a href='/smhrd/after/afterList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>
				</c:if>	
			</c:forEach>
				
			<!-- 다음 페이지 -->
			<c:if test="${pDTO.totalPage<=pDTO.nowPage}">
				<li>next</li>
			</c:if>
			<c:if test="${pDTO.totalPage>pDTO.nowPage}">
				<li><a href='/smhrd/after/afterList?nowPage=${pDTO.nowPage+1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
			</c:if>
			<c:if test="${pDTO.totalPage>pDTO.nowPage}">
				<li><a href="/smhrd/after/afterList?nowPage=${pDTO.totalPage}">back</a></li>
			</c:if>
			
		</ul>
	</div>
	
	
	
>>>>>>> a5ceef1db85b52c0e587c99b4380b7ccf2fa5d55
	<div class="search">
		<form action="/smhrd/after/afterList">
			<select name="searchKey">
				<option value="grad_title">제목</option>
				<option value="grad_content">글내용</option>
				<option value="mem_id">글쓴이</option>	
			</select>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
</main>