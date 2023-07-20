package kr.or.smhrd.dao;



import java.util.List;

import kr.or.smhrd.dto.AfterReplyDTO;

public interface AfterReplyDAO {
	// ´ñ±Û µî·Ï
	public int aReplyInsert(AfterReplyDTO dto);
	// ´ñ±Û ¸ñ·Ï °¡Á®¿À±â
	public List<AfterReplyDTO> aReplySelect(int grad_num);
	// ´ñ±Û ¼öÁ¤
	public int aReplyUpdate(AfterReplyDTO dto);
	// ´ñ±Û »èÁ¦
	public int aReplyDelete(int grad_review_num);
}
