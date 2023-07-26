<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main>
	<h1 class="Sub">공지 게시판</h1>
	<c:if test="${logType >= 3}">
		<div id="noticeWriteBtn">
			<a href="${pageContext.request.contextPath}/notice/noticeWrite"><button type="button" id="writeBtn" class="btn btn-outline-primary" style="margin:10px;">게시글 작성</button></a>
		</div>
	</c:if>

	<div>
	<div style="margin:30px;">총 레코드 수 : ${pDTO.totalRecord}개</div>
		<ul class="List">
			<li>no</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>등록일</li>
			<li>조회수</li>
			
			<c:forEach var="notice" items="${notice}">
				<li>${notice.notice_num}</li>
				<li><a href="/smhrd/notice/noticeView?no=${notice.notice_num}">${notice.notice_title}</a></li>
				<li>${notice.mem_id}</li>
				<li>${notice.notice_wdate}</li>
				<li>${notice.notice_hit }</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="page">
		<ul>
			<!-- 가장 첫 페이지시 이전페이지 버튼 비활성화 -->	
			<c:if test="${pDTO.nowPage==1 }">
				<li>prev</li>			
			</c:if>
			<!-- 이전 페이지 -->
			<c:if test="${pDTO.nowPage>1 }">
				<li><a href='/smhrd/notice/noticeList?nowPage=${pDTO.nowPage-1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
			</c:if>
			
			<!-- forEach : 변수, 시작, 끝, 증가값(생략가능) -->
			<c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum + pDTO.onePageNumCount - 1}" step="1"> 
				<c:if test="${p <= pDTO.totalPage}">
					<!-- 선택한 페이지 번호 표시 -->
					<c:if test="${p == pDTO.nowPage }">		
						<li style="background: #00468C; border-radius: 50%; width:25px; height:25px;">
							<a style="color: white" href='/smhrd/notice/noticeList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a>
						</li>
					</c:if>
					
					<!-- 선택되지 않은 페이지 번호들 표시x -->
					<c:if test="${p != pDTO.nowPage }">		
						<li><a href='/smhrd/notice/noticeList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
					</c:if>					
				</c:if>
			</c:forEach>
			
			<c:if test="${pDTO.nowPage >= pDTO.totalPage }">
				<li>next</li>
			</c:if>
			<c:if test="${pDTO.nowPage < pDTO.totalPage }">
				<li><a href='/smhrd/notice/noticeList?nowPage=${pDTO.nowPage+1 }<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
			</c:if>
		</ul>
	</div>


	<div class="search">
		<form action="/smhrd/notice/noticeList">
			<select name="searchKey">
				<option value="notice_title">제목</option>
				<option value="notice_content">글내용</option>
				<option value="mem_id">글쓴이</option>	
			</select>
			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
			<input type="submit" value="Search" class="searchBtn"/>
		</form>
	</div>
	
</main>