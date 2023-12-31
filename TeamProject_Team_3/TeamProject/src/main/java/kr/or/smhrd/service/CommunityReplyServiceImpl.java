package kr.or.smhrd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.CommunityReplyDAO;
import kr.or.smhrd.dto.CommunityReplyDTO;
import kr.or.smhrd.dto.ReportDTO;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	@Inject
	CommunityReplyDAO dao;

	@Override
	public List<CommunityReplyDTO> replySelect(int com_num) {
		return dao.replySelect(com_num);
	}

	@Override
	public int replyDelete(int com_num) {
		return dao.replyDelete(com_num);
	}

	@Override
	public int replyUpdate(CommunityReplyDTO dto) {
		return dao.replyUpdate(dto);
	}

	@Override
	public int replyInsert(CommunityReplyDTO dto) {
		return dao.replyInsert(dto);
	}

	@Override
	public int sReportInsert(ReportDTO dto) {
		return dao.sReportInsert(dto);
	}


}

