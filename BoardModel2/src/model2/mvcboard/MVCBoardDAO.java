package model2.mvcboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class MVCBoardDAO extends DBConnPool {
	
	//게시물 갯수 확인
	public int selectCount(Map<String,Object> map) {
		
		int totalCount = 0;
		
		String query = "select count(*) from mvcboard";
		
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	//게시물 목록 조회
	public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
		
		List<MVCBoardDTO> board = new ArrayList<>();
		
		String query = " "
                + "SELECT * FROM ( "
                + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                + "        SELECT * FROM mvcboard ";

		if (map.get("searchWord") != null)
		{
			query += " WHERE " + map.get("searchField")
			+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
	
	   	query += "        ORDER BY idx DESC "
	   			+ "    ) Tb "
	   			+ " ) "
	   			+ " WHERE rNum BETWEEN ? AND ?";
				
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,map.get("start").toString());
			psmt.setString(2,map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				board.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	
	//작성한 게시글 DB에 저장
	public int insertWrite(MVCBoardDTO dto) {
		
		int result = 0;
		
		//기본값이 있는 데이터를 제외한 나머지 값을 DB에 넣어줌
		String query = "insert into mvcboard (idx,name,title,content,ofile,sfile,pass)"
					+ " values (seq_board_num.nextval,?,?,?,?,?,?)";
		
		try{
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			
			result = psmt.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//조회수 증가 메소드
	public void updateVisitCount(String idx) {
		
		String query = "update mvcboard"
					+ " set visitcount = visitcount + 1"
					+ " where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			psmt.executeQuery();
			
		}catch(Exception e) {
			System.out.println("게시물 조회 수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	
	//게시물 상세보기 메소드
	public MVCBoardDTO selectView(String idx) {
		
		MVCBoardDTO dto = new MVCBoardDTO();
		
		String query = "select * from mvcboard where idx = ?";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			rs = psmt.executeQuery();  
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
			
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	//다운로드 횟수 증가 메소드
	public void downCountPlus(int idx) {
		
		String query = "update mvcboard"
					+ " set downcount = downcount + 1"
					+ " where idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, idx);
			
			psmt.executeQuery();
			
			
		}catch(SQLException e) {
			System.out.println("다운로드 횟수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	
	//게시물 수정, 삭제 시 비밀번호 검증 메소드
	public boolean confirmPassword(String pass, String idx) {
		
		boolean isCorr = true;
		
		String query = "select count(*) from mvcboard where pass = ? and idx = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			
			rs.next();
			if(rs.getInt(1) == 0 ) { //첫번째 쿼리문의 값이 0이라면 => 비밀번호 틀림 / select 문의 값이 1이어야 true 값 반환됨
				isCorr = false;
			}
			
		}catch(SQLException e) {
			isCorr = false;
			e.printStackTrace();
		}
		
		return isCorr;
	}
	
	
	
	//게시물 삭제 메소드
	public int deletePost(String idx) {
		
		int result = 0;
		
		String query = "delete from mvcboard where idx = ?";
		
		try {
		
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			result = psmt.executeUpdate();  //결과값이 1이면 성공, 0이면 실패
			
		}catch(SQLException e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//게시물 수정 메소드
	public int updatePost(MVCBoardDTO dto) {
		
		int result = 0;
		
		String query = "update mvcboard"
					+ " set title = ?, name = ?, content = ?, ofile = ?, sfile = ?"
					+ " where idx = ? and pass = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			result = psmt.executeUpdate();  //결과값이 1이면 성공, 0이면 실패
			
		}catch(SQLException e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
	
	
}
