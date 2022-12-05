package fileupload;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool {
	//새로운 게시물 입력
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		
		try {
			
			String query = "insert into myfile ( "
						+ " idx, name, title, cate, ofile, sfile) "
						+ " values ( "
						+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return applyResult;
	}
}
