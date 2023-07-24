package kr.or.smhrd.dao;

import java.util.List;

import kr.or.smhrd.dto.RegisterDTO;

public interface RegisterDAO {
	// ȸ������
	public int registerInsert(RegisterDTO dto);
	// ���̵� üũ
	public int idCheck(String mem_id);
	// �α���
	public RegisterDTO loginOk(String mem_id, String mem_password);
	//���̵� ã��
	public RegisterDTO passwordSearch(RegisterDTO dto);
}
