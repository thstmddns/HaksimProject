package kr.or.smhrd.service;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface NoticeService {

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
