package kr.or.smhrd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AdminBoardDAO;

@Service
public class AdminBoardServiceImp implements AdminBoardService {
	@Autowired
	AdminBoardDAO dao;
	
}
