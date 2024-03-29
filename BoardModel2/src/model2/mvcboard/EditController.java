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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/edit.do")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);  //한 개의 게시글 상세 조회
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./Edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 파일의 물리적인 경로 얻어오기
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
		//2. 파일의 최대 용량 지정
		int maxPostSize = 1024 * 1000;
		
		//3. MultipartRequest를 이용한 파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		//4. 파일 업로드 실행 유무 확인
		if(mr == null) {  
			//파일 업로드 실패
			JSFunction.alertBack(response, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}
		
		//5. 입력 정보 받아오기
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		HttpSession session = request.getSession();
		String pass = (String)session.getAttribute("pass");
		
		//6. DTO에 받아온 정보 저장하기
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		//7. 첨부 파일 변경 유무 확인
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) { //파일 변경 됐을 때
			
			//새로운 파일로 변경해주기
			String ext = fileName.substring(fileName.lastIndexOf(".")); 
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  
			String newFileName = now + ext;  
			
			File oldFile = new File(saveDirectory + File.separator + fileName);  
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//기존 파일 삭제해주기
			FileUtil.deleteFile(request, "Uploads", prevSfile);
			
		}else { //파일 변경 없을 때
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//8. 게시물 수정하기
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result == 1) {
			//수정 성공 시
			session.removeAttribute("pass");
			response.sendRedirect("view.do?idx=" + idx);  //idx 번호를 넘겨줘서 수정된 게시글 페이지로 이동하기
			
		}else {
			//수정 실패 시
			JSFunction.alertLocation(response, "비밀번호 검증을 다시 진행해주세요", "view.do?idx=" + idx);
		}
		
		
		
		
	}

}
