package utils;

public class BoardPage {
	//정적메소드 생성
	//totalCount : 전체 게시글 수
	//totalPages : 전체 페이지 수
	//pageSize : 1페이지 당 게시글 수 10
	//blockPage : 1블럭당 페이지 수 5개
	//pageNum : 현재 페이지 번호
	//reqUrl : 파라미터로 요청하는 페이지 주소
	public static String pagingStr(int totalCount, int totalPages, int pageSize, int blockPage
			, int pageNum, String reqUrl, String searchField, String searchWord) {
		String pageStr = "";
		
		//블럭번호 변수 선언
		//1-5페이지 1
		//6-10페이지 6
		//11-15페이지 11
		int pageTemp = ((pageNum-1)/blockPage*blockPage)+1;
		//블럭번호 pageTemp가 1이 아닐때만 이전블럭 첫페이지가기가 나타나게함
		if(pageTemp != 1) {
			//http://localhost:8090/el_chap05/boardlist.jsp?pageNum=1
			pageStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전블럭]</a>";
		}
		//각 페이지 번호 출력(1,2,3,4,5 또는 6,7,8,9,10)
		int blockCount = 1;
		//blockCount 1-5까지 반복
		//시작은 pageTemp값으로 1씩 증가
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			//현재 페이지일때는 링크를 걸지 않음
			//&nbsp; 빈칸을 나나탬 html문자첨부기호
			if(pageTemp == pageNum) {
				pageStr += "&nbsp"+pageTemp+"&nbsp;";
			} else {
				if(searchWord != null && !searchWord.equals("")) {
					pageStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;"
							+searchField+"&searchWord="+searchWord+"&pageNum="
							+pageTemp+"'>"+pageTemp+"</a?&nbsp;";
				}else {
					pageStr += "&nbsp;<a href='"+reqUrl+"?pageNum="
							+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
				}
				
			}
			pageTemp++;
			blockCount++;
		}
		//다음페이지 블럭 바로가기
		if(pageTemp <= totalPages) {
			pageStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"'>[다음블럭]</a>";
			pageStr += "<a href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";
		}
		return pageStr;
	}
}
