package utils;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
					//전체 게시물의 갯수 / 한 페이지에 보여질 게시물의 갯수(10) / 블록에 보여질 페이지 번호의 갯수(5) / 현재 페이지 번호 / 페이지 번호를 누르면 이동할 주소
		//List.jsp에서 구해놓은 변수들을 매개변수로 받아와서 식 만들기
		//[첫 페이지][이전 블록][1 2 3 4 5][다음 블록][마지막 페이지]
		
		String pagingStr = "";
		
		//전체 페이지 수 계산
		int totalPages = (int)(Math.ceil(((double)totalCount / pageSize)));   //ceil -> 소수점 자리 무조건 반올림 / 값이 소수점 형태로 나오므로 (int)로 정수화해줌
		
		//'이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;  //pageTemp는 항상 현재 블록의 첫번째 페이지 번호가 됨(현재 블록의 시작값)
		if(pageTemp != 1) {  //첫번째 페이지가 아닌 경우에만 화면에 출력되도록 해줌(1 페이지는 이전 블록이 없으므로)
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";  //첫 페이지를 누르면 1번 페이지로 가기  / BoardModel2/list.do -> uri
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";  //이전 블록 누르면 현재 페이지의 시작값-1을 해서 이전블록으로 가도록하기
			//reqUrl = BoardModel1Page/List.jsp(uri)
		}
		
		//각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) { 
			if(pageTemp == pageNum) {
				//현재 페이지에는 링크를 걸지 않음
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;  // 1 2 3 4 5 6
			blockCount++;  // 1 2 3 4 5 6
		}
		
		//'다음 페이지 블록 바로가기' 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
