package kr.or.smhrd.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.RegisterDAO;
import kr.or.smhrd.dto.RegisterDTO;
@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Inject
	RegisterDAO dao;
	
	@Override
	public int registerInsert(RegisterDTO dto) {
		return dao.registerInsert(dto);
	}
	@Override
	public int idCheck(String mem_id) {
		int cnt = dao.idCheck(mem_id);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	@Override
	public RegisterDTO loginOk(String mem_id, String mem_password) {
		return dao.loginOk(mem_id, mem_password);
	}
	@Override
	public RegisterDTO passwordSearch(RegisterDTO dto) {
		return dao.passwordSearch(dto);
	}

	@Override
	public RegisterDTO idSearchResult(RegisterDTO dto) {
		return dao.idSearchResult(dto);
	}
	@Override
	public RegisterDTO registerSelect(String mem_id) {
		return dao.registerSelect(mem_id);
	}
	@Override
	public int memberEdit(RegisterDTO dto) {
		return dao.memberEdit(dto);
	}
	
	@Override
    public List<String> getAbsenteesEmail() {
        List<String> absenteesEmail = new ArrayList<String>();
        List<RegisterDTO> attendRegisterList = dao.attendRegister();

        for (RegisterDTO dto : attendRegisterList) {
            if (dto.getMem_attend() == 0) {
                absenteesEmail.add(dto.getMem_email());
            }
        }

        return absenteesEmail;
    }
	
	@Override
	public List<RegisterDTO> attendRegister() {
		return dao.attendRegister();
	}}

