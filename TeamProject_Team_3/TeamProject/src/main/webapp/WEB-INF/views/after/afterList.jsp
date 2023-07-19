<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
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

</style>



<main>
	<h1>수료생 게시판 목록</h1>
	<div id="afterWriteBtn">
		<a href="${pageContext.request.contextPath}/after/afterWrite"><button>글쓰기</button></a>
	</div>

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

	<div class="search">
		<form action="/smhrd/after/afterList">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="userid">글쓴이</option>	
			</select>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
</main>