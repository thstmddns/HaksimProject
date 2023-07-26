package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface NoticeDAO {
	// �� ���
	public int NoticeWriteOk(NoticeDTO dto); 
		
	// �� ��� ��ȸ 
	public List<NoticeDTO> NoticeList(PagingDTO pDTO);
	
	// �� ���ڵ� ��
	public int totalRecord(PagingDTO pDTO);
	
	// �Ѱ��� ���ڵ� ����
	public NoticeDTO getNotice(int no);
		
	// ��ȸ�� ����
	public void hitCount(int no);
		
	// �ۼ���
	public int NoticeEditOk(NoticeDTO dto);
		
	// �� ����
	public int NoticeDel(int no);

}
