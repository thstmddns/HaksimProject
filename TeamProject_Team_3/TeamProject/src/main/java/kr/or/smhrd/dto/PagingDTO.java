package kr.or.smhrd.dto;

public class PagingDTO {
   private int nowPage = 1;         
   private int onePageRecord = 15;      
   
   private int totalRecord;         
   private int totalPage;            
   
   private int onePageNumCount = 5;   
   private int startPageNum = 1;      
   
   private int lastPageRecord = 15;      
   
   private String searchKey;         

   private String searchWord;         
   
   private int grad_type = 0;         
   
   private int com_type = 0;
   
   public int getNowPage() {
      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;

      startPageNum = ((nowPage-1) / onePageNumCount ) * onePageNumCount + 1;
   }
   public int getOnePageRecord() {
      return onePageRecord;
   }
   
   public void setOnePageRecord(int onePageRecord) {
      this.onePageRecord = onePageRecord;
   }

   public int getTotalRecord() {
      return totalRecord;
   }

   public void setTotalRecord(int totalRecord) {
      this.totalRecord = totalRecord;
   
      // 총 페이지 수 계산하기
      // ceil():올림, round():반올림, floor():내림
      totalPage = (int)Math.ceil((double)totalRecord / onePageRecord);
      
      // 마지막 페이지의 남아있는 레코드 수 
      lastPageRecord = onePageRecord;
      if(totalPage == nowPage) {
         if(totalRecord % onePageRecord != 0) {
            lastPageRecord = (totalRecord % onePageRecord);
         }
      }
   }

   public int getTotalPage() {
      return totalPage;
   }

   public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
   }

   public int getOnePageNumCount() {
      return onePageNumCount;
   }

   public void setOnePageNumCount(int onePageNumCount) {
      this.onePageNumCount = onePageNumCount;
   }

   public int getStartPageNum() {
      return startPageNum;
   }

   public void setStartPageNum(int startPageNum) {
      this.startPageNum = startPageNum;
   }

   public int getLastPageRecord() {
      return lastPageRecord;
   }

   public void setLastPageRecord(int lastPageRecord) {
      this.lastPageRecord = lastPageRecord;
   }

   public String getSearchKey() {
      return searchKey;
   }

   public void setSearchKey(String searchKey) {
      this.searchKey = searchKey;
   }

   public String getSearchWord() {
      return searchWord;
   }

   public void setSearchWord(String searchWord) {
      this.searchWord = searchWord;
   }

   public int getGrad_type() {
      return grad_type;
   }

   public void setGrad_type(int grad_type) {
      this.grad_type = grad_type;
   }

   public int getCom_type() {
      return com_type;
   }

   public void setCom_type(int com_type) {
      this.com_type = com_type;
   }
   
}