<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#noticeWriteBtn{
	margin-left:100px;	
}

.noticeList {
	margin-left:50px;
	margin-right:50px;
	padding: 0px;
	overflow:auto;
	list-style-type: none;
}
	
.noticeList > li{
	 float:left;
	 height:40px;
	 line-height:40px;
	 border-bottom:1px solid #ddd;
	 width:10%;
	 text-align:center;
}

.noticeList > li:nth-child(5n+3) {
	 width:60%;
	 /*말줄임표시*/
	 white-space:nowrap;  /*줄 바꾸지 않기*/
	 overflow:hidden;   /*넘친값 숨기기*/
	 text-overflow:ellipsis;   /* ... 표시하기 */
}

.search {
	 text-align:center;
	 height:40px;
	 margin-top:10px;
	 margin-bottom:10px;
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


#noticeList{
	padding: 0px;
}

</style>



<main>
	<h1>공지 게시판</h1>
	<div id="noticeWriteBtn">
		<a href="${pageContext.request.contextPath}/notice/noticeWrite"><button>글쓰기</button></a>
	</div>

	<div>
		<ul class="noticeList">
			<li>no</li>
			<li>제목</li>
			<li>내용</li>
			<li>글쓴이</li>
			<li>등록일</li>
			
			<c:forEach var="dto" items="${notice}">
				<li>${dto.notice_num}</li>
				<li><a href="/smhrd/notice/noticeView/${dto.notice_num}">${dto.notice_title}</a></li>
				<li>${dto.notice_content}</li>
				<li>${dto.mem_id}</li>
				<li>${dto.notice_wdate}</li>
			</c:forEach>
		</ul>
	</div>

	<div class="search">
		<form action="/smhrd/notice/noticeList">
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