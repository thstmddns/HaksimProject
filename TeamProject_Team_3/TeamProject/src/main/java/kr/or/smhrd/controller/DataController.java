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
import org.springframework.web.bind.annotation.ResponseBody;
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
import kr.or.smhrd.dto.ReportDTO;
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
	   public ModelAndView dataDel (int data_num, HttpSession session) {
		   int result = service.dataDelete(data_num, (String)session.getAttribute("logId"));
		   
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
		   dto.setMem_id((String)request.getSession().getAttribute("logId"));
		   
		   // 파일을 업로드할 경로가 필요 /upload 실제주소. 절대 경로. Java io는 절대주소 필요 request.getSession()
	      String path = request.getSession().getServletContext().getRealPath("/upload");
	      System.out.println("path->"+path);
	      
	      // dto -> 제목, 글내용 있음, 그것은 DataDTO dto에
	      //             no->시퀀스,     hit, writedate->defaut값
	     
	      
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
	      		service.dataDelete(dto.getData_num(), dto.getMem_id());
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
		// 글수정 이동
		@GetMapping("/dataEdit")
		public ModelAndView dataEdit(int data_num) {
			 ModelAndView mav = new ModelAndView();
			   // 현재글
			   mav.addObject("dto", service.getBoard(data_num));
			   // 첨부파일
			   mav.addObject("fileList", service.dataFileSelect(data_num));
			   // 뷰 페이지
			   mav.setViewName("data/dataEdit");
			   // dataEdit에서 dto, fDTO사용 가능해짐
			   return mav;
			}
			
		//자료실 글 수정하기
		   @PostMapping("/dataEditOk") //no, subject, content, filename, delFile
		   public ModelAndView dataEditOk(DataDTO dto, HttpSession session, HttpServletRequest request) {
		      
		      //1. 기존에 업로드된 파일목록 DB에서 가져오기
			  
		      List<DataFileDTO> orgFileList = service.dataFileSelect(dto.getData_num());
		      
		      //2. 저장위치
		      String path = session.getServletContext().getRealPath("/upload");
		      
		      //3. 새로 추가한 파일 업로드하기-> MultipartHttpServletRequest(request객체)
		      MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		      
		      //4. 업로드된 파일(MultipartFile)목록
		      List<MultipartFile> fileList = mr.getFiles("filename");
		      //새로 업로드한 파일명들
		      List<DataFileDTO> newFileList = new ArrayList<DataFileDTO>();
		      
		      //5. 업로드된 파일이 있으면 업로드(rename)
		      if(fileList != null) {
		         for(int i=0;i<fileList.size(); i++) {
		            MultipartFile mf = fileList.get(i);
		            //파일명구하기
		            String orgFileName = mf.getOriginalFilename();
		            if(orgFileName != null && !orgFileName.equals("")){//파일명이 있으면
		               File f = new File(path, orgFileName);
		               if(f.exists()) {//같은 파일명을 가진 파일이 존재하면
		                  //기존파일명과 중복검사
		                  int p = orgFileName.lastIndexOf(".");
		                  String fileNoExt = orgFileName.substring(0, p);
		                  String ext = orgFileName.substring(p+1);
		                  
		                  for(int fileNum=1; ; fileNum++) {
		                     String newFile = fileNoExt+" ("+fileNum+")."+ext;
		                     f = new File(path, newFile);
		                     if(!f.exists()) {
		                        orgFileName = newFile;
		                        break;
		                     }//if
		                  }//for
		               }//if   
		               //업로드
		               try {
		                  mf.transferTo(new File(path, orgFileName));
		                  DataFileDTO fDTO = new DataFileDTO();
		                  fDTO.setData_num(dto.getData_num());
		                  fDTO.setFilename(orgFileName);
		                  newFileList.add(fDTO);
		               } catch (Exception e) {e.printStackTrace();}
		            }//if
		         }//for
		      }//if
		      //DB등록
		      /*
		       *    원래 DB파일     -> List<DataFileDTO> orgFileList
		       *  새로 업로드된 파일 -> ListMDataFileDTO> newFileList
		       *  삭제된파일       -> List<String> delFile
		       */
		      // orgFileList에 새로 업로드된 파일목록을 추가하기
		      //orgFileList.addAll(newFileList);
		      for(DataFileDTO newDTO:newFileList) {
		         orgFileList.add(newDTO);
		      }
		      if(dto.getDelFile()!=null) {//삭제파일이 있으면
		         for(int i=0;i<dto.getDelFile().size();i++) {
		            String del = dto.getDelFile().get(i);
		            for(int idx=0;idx<orgFileList.size();idx++) {
		               DataFileDTO resetFile = orgFileList.get(idx);
		               if(del.equals(resetFile.getFilename())) {//삭제할 파일명과 orgFileList에 있는 파일명이 같으면
		               orgFileList.remove(idx);
		               break;
		               }//if
		               }//for
		         }//for
		      }//if
		      //----
		      ModelAndView mav=new ModelAndView();
		      try {
		         //원 레코드 업데이트
		         int result = service.dataUpdate(dto);
		         //파일목록 ->삭제, 추가
		         service.dataFileDelete(dto.getData_num());
		         service.dataFileInsert(orgFileList);
		         //삭제한 파일을 /upload폴더에서 제거
		         if(dto.getDelFile()!=null) {
		            for(String delFilename:dto.getDelFile()) {
		               fileDelete(path, delFilename);
		            }//for
		         }//if
		         //글내용보기로 이동
		         mav.setViewName("redirect:dataOpen/"+dto.getData_num());
		      } catch (Exception e) {
		         e.printStackTrace();
		         
		         //새로업로드된 파일 삭제
		         for(DataFileDTO fDTO: newFileList) {
		            fileDelete(path, fDTO.getFilename());
		        }
		        //글내용수정
		        mav.setViewName("redirect:dataEdit?data_num="+dto.getData_num());
		      	}
		      	return mav;
			}
		   
		   @PostMapping("/dataReportOk") 
			@ResponseBody
			public String dataReportOk(ReportDTO Rdto, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
			  Rdto.setMem_id((String)session.getAttribute("logId"));
			
			  
			  int result = service.dReportInsert(Rdto);
			  
			  return result+""; 
			}

}