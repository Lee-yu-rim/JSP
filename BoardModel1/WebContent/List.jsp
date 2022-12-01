<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%
	//DAO 생성 및 DB 연결
	BoardDAO dao = new BoardDAO(application);

	//사용자가 입력한 검색 조건을 Map에 저장 -> 검색기능 구현
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null) {  //검색하는 값이 있어야 실행할 수 있도록 해줌(값이 없는데 검색이 실행되면 안되므로!)
		param.put("searchField", searchField);  //파라메터로 넘어온 입력한 값들
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);  //전체 게시글 수 확인
	List<BoardDTO> boardLists = dao.selectList(param);  //게시물 목록
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="./Common/Link.jsp" />
	
	<h2>목록 보기(List)</h2>
	<!-- 검색폼 -->
	<form method="get">   <!-- form 태그에 action 속성이 생략된 경우는 url에 표시된 주소가 action 속성이 된다.(현재 페이지가 다시 실행됨 -->
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 테이블 -->
	<table border="1" width="90%">
		<!-- 각 컬럼의 이름 -->
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<!-- 목록의 내용 -->
		<%
			if(boardLists.isEmpty()) {
				//게시물이 하나도 없을 때
		%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다.
			</td>
		</tr>
		<%
			}else {
				//게시물이 있을 때
				int virtualNum = 0;  //화면상에서의 게시물 번호
				for(BoardDTO dto : boardLists) {  //boradLists의 값은 배열형태이므로 for문으로 값 가져오기
					virtualNum = totalCount--;  //전체 게시물 수에서 시작해 1씩 감소
		%>
		<tr align="center">
			<!-- content 제외 모든 항목 가져오기 -->
			<td><%=virtualNum %></td>  <!-- 게시물 번호 -->
			<td align="left">  <!-- 제목(+ 하이퍼링크) -->
				<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>  <!-- View.jsp?num = dto.getNum() : get 방식으로 값을 보내고 바로 가져오기 -->
				<!-- http://localhost:8081/BoarderModel1/View.jsp?num=2 글을 선택하면 주소창 값에 파라메터값이 보임 -->
			</td>
			<td align="center"><%=dto.getId() %></td>   <!-- 작성자 아이디 -->
			<td align="center"><%=dto.getVisitcount() %></td>  <!-- 조회수 -->
			<td align="center"><%=dto.getPostdate() %></td>  <!-- 작성일 -->
		</tr>
		<%
				}  //for문
			}  //if문
		%>
	</table>
	
	<!-- 목록 하단의 [글쓰기] 버튼 -->
	<table border="1" width="90%">
		<tr align="right">
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>