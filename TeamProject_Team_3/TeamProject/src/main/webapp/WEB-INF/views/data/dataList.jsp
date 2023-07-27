<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main>
	<h1 class="Sub">자료 공유 게시판</h1>
   <div class="WriteBtn">
      <a href="${pageContext.request.contextPath}/data/dataWrite"><button type="button" class="btn btn-outline-primary" id="writeBtn" style="margin:10px;">게시글 작성</button></a>
   </div>
   <div style="margin:30px;">총 레코드 수 : ${pDTO.totalRecord}개</div>
	
		<ul class="List">
			<li>no</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>등록일</li>
			<li>조회수</li>
			<c:forEach var="dto" items="${list}">		
				<li>${dto.data_num}</li>
				<li><a href="/smhrd/data/dataOpen/${dto.data_num}">${dto.data_title}</a></li>
				<li>${dto.mem_id }</li>
				<li>${dto.data_wdate }</li>
				<li>${dto.data_hit}</li>	
			</c:forEach>
		</ul>
		<div class="page">
      <ul>
         <!-- 맨 앞 페이지 -->
         <c:if test="${pDTO.nowPage>1}">
            <li><a href="/smhrd/data/dataList">front</a></li>
         </c:if>
         <!-- 이전 페이지 -->
         <c:if test="${pDTO.nowPage==1}">
         <li>prev</li>
         </c:if>
         <c:if test="${pDTO.nowPage>1}">
         <li><a href='/smhrd/data/dataList?nowPage=${pDTO.nowPage-1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
         </c:if>
         
         <!-- 페이지 번호 -->
         <!--      변수         시작값                   끝값      증가값 -->
         <!-- totalPage보다 큰 페이지 번호는 출력 x -->
         <c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum+pDTO.onePageNumCount-1}" step="1">
            <c:if test="${p<=pDTO.totalPage}">
               <c:if test="${p==pDTO.nowPage}">
                  <li style="background: #00468C; border-radius: 50%; width:25px; height:25px;"><a href='/smhrd/data/dataList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>' style="color: white">${p}</a></li>
               </c:if>
               <c:if test="${p!=pDTO.nowPage}">
                  <li><a href='/smhrd/data/dataList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
               </c:if>
            </c:if>   
         </c:forEach>
            
         <!-- 다음 페이지 -->
         <c:if test="${pDTO.totalPage<=pDTO.nowPage}">
            <li>next</li>
         </c:if>
         <c:if test="${pDTO.totalPage>pDTO.nowPage}">
            <li><a href='/smhrd/data/dataList?nowPage=${pDTO.nowPage+1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
         </c:if>
         <c:if test="${pDTO.totalPage>pDTO.nowPage}">
            <li><a href="/smhrd/data/dataList?nowPage=${pDTO.totalPage}">back</a></li>
         </c:if>
         
      </ul>
   </div>
   
			<div class="search">
      			<form action="/smhrd/data/dataList">
         			<select name="searchKey">
            		<option value="data_title">제목</option>
            		<option value="data_content">글내용</option>
            		<option value="mem_id">글쓴이</option>   
         		</select>
         			<input type="text" name="searchWord" id="searchWord" class="searchWord"/>
         			<input type="submit" value="Search" class="searchBtn"/>
      			</form>
   			</div>
</main>