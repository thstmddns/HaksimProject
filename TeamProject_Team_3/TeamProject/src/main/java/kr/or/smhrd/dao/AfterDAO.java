package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface AfterDAO {
		// 수료생 글 목록
		public List<AfterDTO> getAfterList(PagingDTO pDTO);
		// 총 레코드 수
		public int totalRecord(PagingDTO pDTO);
		
		
		// 수료생 글 선택(1개)
		public AfterDTO afterSelect(int grad_num);
		// 조회수 증가
		public void hitCount(int grad_num);
		
		// 수료생 글 등록
		public int afterInsert(AfterDTO dto);
		//파일명 등록
		public int afterFileInsert(List<AfterFileDTO> fileList);
		// 게시글 수정 
		public int afterEdit(AfterDTO dto);
		
		// 글 삭제
		public int afterDelete(int grad_num);
		
		
		// 해당 글의 첨부파일 선택
		public List<AfterFileDTO> afterFileSelect(int grad_num);
}
