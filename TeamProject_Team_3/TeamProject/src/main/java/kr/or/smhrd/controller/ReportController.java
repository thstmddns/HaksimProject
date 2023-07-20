package kr.or.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.smhrd.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	ReportService service;
	
	
}
