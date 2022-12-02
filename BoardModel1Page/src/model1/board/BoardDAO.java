package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//전체 게시글을 카운트하는 메소드 생성
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		String query = "select count(*) from board";   //board 게시판의 전체글의 갯수를 가져온다.
		
		//검색어 있다면 이 조건문 실행
		if(map.get("searchWord") != null) {  //단어를 검색했을 경우
			//where 앞에 띄어쓰기 꼭 해주기!
			query += " where " + map.get("searchField") + " "  //위의 쿼리문에 이어서 + 제목과 내용(searchField) 중에서
				+ "like '%" + map.get("searchWord") + "%'";  //검색한 단어(searchWord)가 포함되는 게시글
		}			
		
		try {
			stmt = con.createStatement();  //쿼리문 생성
			rs = stmt.executeQuery(query);  //쿼리문 실행
			rs.next();  //rs에 저장된 행이 있는지 확인 후 최초행으로 커서 이동 / 행이 없을 때 까지 쿼리문 실행 반복
			totalCount = rs.getInt(1);  //첫번째 컬럼의 값을 가져옴
			//rs.getInt(1) = 위 쿼리문의 첫번째 줄에서 실행한 select count(*)을 뜻하므로 전체 게시글의 갯수를 말함, 반환되는 값이 숫자이므로 getInt()메소드를 이용하여 값을 가져옴
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;  //전체 게시글의 갯수 반환
	}
	
	//게시글 목록 반환하는 메소드
	public List<BoardDTO> selectList(Map<String, Object> map){
		
		//게시물 목록을 반환하기 위한 변수
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "select * from board";
		
		//검색어가 있다면 이 조건문 실행
		if(map.get("searchWord") != null) { 
			query += " where " + map.get("searchField") + " "
				+ "like '%" + map.get("searchWord") + "%'";  
		}	
		
		query += " order by num desc";  //가장 최근글부터 조회
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			//DB에서 한 게시물의 정보를 하나씩 담아와서 남은 데이터가 없을 때까지 반복
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
	
	
	//목록 출력시 페이징 기능 추가하는 메소드
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "select * "
					+ " from ( "
					+ " select rownum rNum, tb.* "
					+ " from ( "
					+ " select * "
					+ " from board ";
					
					if(map.get("searchWord") != null) { 
						query += " where " + map.get("searchField") + " "
							+ "like '%" + map.get("searchWord") + "%'";  
					}
					
					query += " order by num desc "
					+ " ) tb "
					+ " ) "
					+ " where rNum between ? and ?";
					
		//중간에 검색조건을 넣어서 검색하는 기능을 쓸 때도 페이징 기능이 들어가도록 해줌
					
		try {
			psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	
	//작성한 글을 DB에 저장하는 메소드
	public int insertWrite(BoardDTO dto) {
		
		int result = 0;
		
		String query = "insert into board(num,title,content,id,visitcount)"
					+ " values(seq_board_num.nextval,?,?,?,0)";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//하나의 게시글의 상세정보 출력하는 메소드
	public BoardDTO selectView(String num) {
		
		//member 테이블의 아이디와 board 테이블의 아이디가 같은 사용자의 정보를 가져옴
		String query = "select b.* , m.name"
					+ " from member m inner join board b"
					+ " on m.id = b.id"
					+ " where num = ?";
		
		BoardDTO dto = new BoardDTO();
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}		

		return dto;
		
	}
	
	
	//조회수 증가시키는 메소드
	public void updateVisitCount(String num) {
		
		String query = "update board set"
					+ " visitcount = visitcount + 1"
					+ " where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//게시글 수정 처리하는 메소드
	public int updateEdit(BoardDTO dto) {
		 
		int result = 0;
		
		String query = "update board set"
					+ " title = ?, content = ?"
					+ " where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;  //update 함수의 return 값은 업데이트된 행의 갯수 => 성공하면 성공한 행의 갯수인 1 반환, 실패시 0 반환
	}
	
	
	//게시글 삭제 처리하는 메소드 
	public int deletePost(BoardDTO dto) {
		
		int result = 0;
		
		String query = "delete from board where num = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
