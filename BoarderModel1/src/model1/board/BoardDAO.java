package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import commom.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//전체 게시글을 카운트하는 메소드 생성
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		String query = "select count(*) from board";   //board 게시판의 전체글의 갯수를 가져온다.
		
		//검색 조건에 맞는 데이터만 보여주기
		if(map.get("searchWord") != null) {  //단어를 검색했을 경우
			//where 앞에 띄어쓰기 꼭 해주기!
			query += " where " + map.get("searchField")  //위의 쿼리문에 이어서 + 제목과 내용(searchField) 중에서
				+ "like '%" + map.get("searchWord") + "%'";  //검색한 단어(searchWord)가 포함되는 게시글
		}			
		
		try {
			stmt = con.createStatement();  //쿼리문 생성
			rs = stmt.executeQuery(query);  //쿼리문 실행
			rs.next();
			totalCount = rs.getInt(1);  //totalCount = 위의 count 컬럼(게시글 갯수)
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;  //전체 게시글의 갯수 반환
	}
	
	//검색 조건에 맞는 게시글 목록 반환하는 메소드
	public List<BoardDTO> selectList(Map<String, Object> map){
		
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "select * from board";
		
		if(map.get("searchWord") != null) { 
			query += " where " + map.get("searchField")  
				+ "like '%" + map.get("searchWord") + "%'";  
		}	
		
		query += " order by num desc";  //가장 최근글부터 조회
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);  //bbs에 배열형태의 데이터 저장
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
}
