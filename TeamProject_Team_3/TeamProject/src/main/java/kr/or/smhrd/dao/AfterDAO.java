package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.AfterFileDTO;
import kr.or.smhrd.dto.PagingDTO;

public interface AfterDAO {
		// ����� �� ���
		public List<AfterDTO> getAfterList(PagingDTO pDTO);
		// �� ���ڵ� ��
		public int totalRecord(PagingDTO pDTO);
		
		
		// ����� �� ����(1��)
		public AfterDTO afterSelect(int grad_num);
		// ��ȸ�� ����
		public void hitCount(int grad_num);
		
		// ����� �� ���
		public int afterInsert(AfterDTO dto);
		//���ϸ� ���
		public int afterFileInsert(List<AfterFileDTO> fileList);
		// �Խñ� ���� 
		public int afterEdit(AfterDTO dto);
		
		// �� ����
		public int afterDelete(int grad_num);
		
		
		// �ش� ���� ÷������ ����
		public List<AfterFileDTO> afterFileSelect(int grad_num);
}
