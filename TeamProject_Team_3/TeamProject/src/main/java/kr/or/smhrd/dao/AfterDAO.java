package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface AfterDAO {
      // 글 목록 선택(paging, search)
      public List<AfterDTO> getAfterList(PagingDTO pDTO);
      // 총 레코드 수
      public int totalRecord(PagingDTO pDTO);
      
      
      // 1개의 레코드 선택(게시글 내용 보기)
      public AfterDTO afterSelect(int grad_num);
      // 조회수 증가
      public void hitCount(int grad_num);
      
      // 글 등록
      public int afterInsert(AfterDTO dto);
      
      
      // 게시글 수정 
      public int afterEdit(AfterDTO dto);
      
      // 게시글 삭제
      public int afterDelete(int grad_num);
      
      
}