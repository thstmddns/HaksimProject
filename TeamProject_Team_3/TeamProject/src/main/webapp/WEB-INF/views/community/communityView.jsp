<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	 .afterView li {
	 	margin-top:10px;
	 	list-style-type: none;
	 }
</style>

<script>
function boardDelChk () {
		// 확인(true), 취소(false)
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "/smhrd/community/boardDel?com_num=${dto.com_num}";
		}
	}

</script>

<main>
   <h1>커뮤니티 글 게시판 내용 보기</h1>
   <ul class="communityView">
      <li>글번호 : ${dto.com_num}</li>
      <li>제목 : ${dto.com_title}</li>
      <li>글쓴이 : ${dto.mem_id}</li>
      <li><br>글내용<br/> ${dto.com_content}</li>
      <li>등록일 : ${dto.com_wdate}</li>
      <li>조회수 : ${dto.com_hit}</li>
   </ul>
   
   	<div>
		<a href="javascript:boardDelChk()">삭제</a>
	</div>
 <%-- <!--  작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 x -->

  <div align="right">
      <a href='/smhrd/community/communityList?nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'><button>목록</button></a>
      <!-- 작성자가 아닌 경우 글에 대한 수정, 삭제 권한 부여 o -->
      <c:if test="${logId == dto.mem_id}">   
            <a href='/smhrd/board/boardEdit?no=${dto.no}&nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'><button>수정</button></a>
            <a href="javascript:delChk()"><button>삭제</button></a>
      </c:if>
   </div> --%>
	
</main>