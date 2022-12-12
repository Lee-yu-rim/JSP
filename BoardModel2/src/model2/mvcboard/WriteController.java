package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("./Write.jsp").forward(request, response);
	}
	
	//파일 업로드 기능
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");  //서블릿 클래스에서 application 영역에 접근하는 방식
		int maxPostSize = 1024 * 1000;
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		//업로드 실패
		if(mr == null) {
			JSFunction.alertLocation(response, "첨부 파일이 제한 용량을 초과합니다.", "write.do");
			return;
		}
		
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			String ext = fileName.substring(fileName.lastIndexOf(".")); 
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  
			String newFileName = now + ext;  
			
			File oldFile = new File(saveDirectory + File.separator + fileName);  
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
		}
		
		//게시글 작성하는 기능
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		//업로드 성공
		if(result == 1) {
			response.sendRedirect("list.do");
		}else {
			response.sendRedirect("write.do");
		}
	}
}






















