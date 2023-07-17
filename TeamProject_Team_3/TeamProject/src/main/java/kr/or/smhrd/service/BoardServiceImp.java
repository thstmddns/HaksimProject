package kr.or.smhrd.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.BoardDAO;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public void print() {
		System.out.println(dao.toString());
		
	}
	
	
}
