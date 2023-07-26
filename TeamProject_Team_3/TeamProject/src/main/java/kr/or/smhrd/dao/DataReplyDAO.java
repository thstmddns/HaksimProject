package kr.or.smhrd.dao;



import java.util.List;

import kr.or.smhrd.dto.AfterReplyDTO;
import kr.or.smhrd.dto.DataReplyDTO;

public interface DataReplyDAO {
   
   public int dReplyInsert(DataReplyDTO dto);
   
   public List<DataReplyDTO> dReplySelect(int data_num);
   
   public int dReplyUpdate(DataReplyDTO dto);
   
   public int dReplyDelete(int data_review_num);
}