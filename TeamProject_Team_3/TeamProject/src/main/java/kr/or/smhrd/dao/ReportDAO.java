package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.NoticeDTO;
import kr.or.smhrd.dto.ReportDTO;

public interface ReportDAO {
	// �Ű� ���� ����Ʈ
	public List<ReportDTO> getReportList();
	
	// �Ű� �Խñ� �� ��ȸ
	public ReportDTO ReportBoardView(int no);
	
	// �Ű� �Խñ� ����
	public int ReportBoardDel(int no, String id);
	
	// �Ű� ��� �� ��ȸ
	public ReportDTO ReportReplyView();
	
	// �Ű� ��� ���� 
	public int ReportReplyDel(int no, String id);

	public int ReportDel(int no);

}
