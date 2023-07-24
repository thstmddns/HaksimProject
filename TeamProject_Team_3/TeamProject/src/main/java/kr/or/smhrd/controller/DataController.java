package kr.or.smhrd.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.smhrd.dto.AfterDTO;
import kr.or.smhrd.dto.DataDTO;
import kr.or.smhrd.dto.DataFileDTO;
import kr.or.smhrd.dto.DataReplyDTO;
/*import kr.or.smhrd.dto.DataFileDTO;*/
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.service.DataService;

@Controller
@RequestMapping("/data")
public class DataController {
	
	@Autowired
	DataService service;
	
	   @GetMapping("/dataList")
	   public ModelAndView dataList(PagingDTO pDTO) {
	      
	      pDTO.setTotalRecord(service.totalRecord(pDTO));
	      List<DataDTO> list = service.dataList(pDTO);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list);
	      mav.addObject("pDTO", pDTO);
	      mav.setViewName("data/dataList");
	      return mav;
	   }
	
	@GetMapping("/dataWrite")
	public ModelAndView dataWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("data/dataWrite");
		return mav;
	}
	
/*	@GetMapping("/dataOpen")
	public ModelAndView dataOpen(int data_num) {
		  service.hitCount(data_num);
	         DataDTO dto = service.getBoard(data_num);
	         ModelAndView mav = new ModelAndView();
	         mav.addObject("dto", dto);
	         mav.setViewName("data/dataOpen");
	         return mav;*/
	
	   @GetMapping("/dataOpen/{data_num}")
	   public ModelAndView afterView(@PathVariable("data_num")  int data_num) {
	      ModelAndView mav = new ModelAndView();
	      service.hitCount(data_num);
	      mav.addObject("dto", service.getBoard(data_num));
	      mav.addObject("fileList", service.dataFileSelect(data_num));
	      mav.setViewName("data/dataOpen");
	      return mav;
	   }
	   
	   @GetMapping("/dataDel")
	   public ModelAndView dataDel (int data_num) {
		   int result = service.dataDelete(data_num);
		   
		   ModelAndView mav = new ModelAndView();
		   if(result>0) {
			   	mav.setViewName("redirect:dataList");
		   } else {
			   	mav.addObject("data_num", data_num);
			   	mav.setViewName("redirect:dataOpen");
		   }
		   return mav;
	   }
	   
	   //글등록 DB기록
	   @PostMapping("/dataWriteOk")
	   public ModelAndView dataWriteOk(HttpServletRequest request, DataDTO dto){
	      // 파일을 업로드할 경로가 필요 /upload 실제주소. 절대 경로. Java io는 절대주소 필요 request.getSession()
	      String path = request.getSession().getServletContext().getRealPath("/upload");
	      System.out.println("path->"+path);
	      
	      // dto -> 제목, 글내용 있음, 그것은 DataDTO dto에
	      //             no->시퀀스,     hit, writedate->defaut값
	      dto.setMem_id("King");
	      
	      //--------파일 업로드 -----------------------------
	      // 1. 파일 업로드를 위해서는 request객체를 multipartRequset객체로 형변환
	      MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;
	      
	      // 2.multipartFile객체를 얻어오기
	      List<MultipartFile> fileList = mr.getFiles("filename");
	      System.out.println("fileList.size() ->"+ fileList.size());
	      
	      //업로드할 파일들을 보관할 컬렉션
	      List<DataFileDTO> upFileList = new ArrayList<DataFileDTO>();
	      
	      ModelAndView mav = new ModelAndView();
	      
	      if(fileList!=null) {// 첨부파일이 있을 때 if 1
	         
	         for(int i=0; i<fileList.size(); i++){// 첨부파일 수 만큼 반복 수행 for 1
	            MultipartFile mf = fileList.get(i);// 첨부된 MultipartFile객체 얻어오기
	            
	            String orgFileName = mf.getOriginalFilename(); // 파일명 얻어오기
	            System.out.println("orgFileName->"+orgFileName);
	            
	            if(orgFileName != null && !orgFileName.equals("")) {//업로드한 파일이 있으며, 파일명이 존재하면 if 2
	               
	               File f = new File(path, orgFileName);
	               if(f.exists()) { // true: 파일이 있다. false:파일이 없다.
	                  //파일명 변경
	                  // - 파일명과 확장자 분리
	                  int point = orgFileName.lastIndexOf(".");
	                  String orgFile = orgFileName.substring(0,point); // 시작점과 끝점-1까지
	                  String orgExt = orgFileName.substring(point+1); // "." 다음부터 ~ 끝까지 : 시작점만 언급하면 끝까지
	               
	                  for(int renameNum=1; ;renameNum++) {//1,2,3,4 ........ 동일한 파일 올라가면 (1), (2) 이런식으로 rename
	                     String newFileName = orgFile + " ("+ renameNum+ ")."+orgExt;
	                     f = new File(path, newFileName);
	                     // 파일이 없을 때까지
	                     if(!f.exists()) {//없을 때
	                        // 새로 만들어진 파일명을 업로드할 때 사용하여야 하므로
	                        orgFileName = newFileName;
	                        break; // 반복문 중지
	                     }
	                  } // for
	               }
	               // 업로드 수행
	               try {
	                  mf.transferTo(new File(path,orgFileName));
	               }catch(Exception e) {e.printStackTrace();}
	               
	               System.out.println("업로드된 파일명->"+orgFileName);
	               // dto에 데이터 넣기
	               DataFileDTO upFileDTO = new DataFileDTO();
	               upFileDTO.setFilename(orgFileName);
	               upFileList.add(upFileDTO);

	            } // if 2
	         } // for 1
	      } // if 1 
	      
	      	try {
	    	  	// DB 처리
	    	  	// 원글 insert -> 생성된 시퀀스 번호를 결과로 받아야 파일명을 DB에 추가할 때 사용해야 함
	    	  	int result = service.dataInsert(dto);
	      		// 파일명이 있는 dto에 원글번호 추가
	      		for(int i=0; i<upFileList.size(); i++) {
	    	  		upFileList.get(i).setData_num(dto.getData_num());
	      		}
	      		// 파일명 DB insert -> 
	      		int resultFile = service.dataFileInsert(upFileList);
	      	
	      	// 정상적으로 구현
	      	mav.setViewName("redirect:dataList");
	      	} catch(Exception e) {
				/* e.printStackTrace(); */
	      		// 에러 발생 시 ->
	      		
	      		// 원글 지우기(dto.no)
	      		service.dataDelete(dto.getData_num());
	      		// 파일명(DB) 지우기
	      		service.dataFileDelete(dto.getData_num());
	      		// 파일 삭제(upFileList)
	      		for(int i=0; i<upFileList.size(); i++) {
	      			fileDelete(path, upFileList.get(i).getFilename());
	      		}
	      		// 글 등록 실패한 경우
	      		e.printStackTrace();
	      		mav.setViewName("data/dataResult");
	      	}
	      	return mav;
	      	}
	// -- 파일 삭제 메소드
		private void fileDelete(String path, String filename) {
				try {
					File f = new File(path, filename);
					f.delete();
				} catch(Exception e) {}
		}
}