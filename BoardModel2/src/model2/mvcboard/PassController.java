package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/pass.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PassController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		request.setAttribute("mode", mode);
		request.getRequestDispatcher("./Pass.jsp").forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass,idx);
		dao.close();
		
		if(confirmed) { //비밀번호가 맞다면(true)
			//요청 정보(mode)가 수정인지 삭제인지 판단
			if(mode.equals("edit")) {  //수정 요청일 때
				
				HttpSession session = request.getSession();  //서블릿에서 session 객체를 사용하는 방법
				session.setAttribute("pass", pass);  //비밀번호를 session 영역에 저장함
				response.sendRedirect("edit.do?idx=" + idx);  //edit.do?idx=일련번호 => 세션영역에 비밀번호를 저장해두었기 때문에 검증 없이 edit 페이지로 접속할 수 있게함
				
			}else if(mode.equals("delete")) {  //삭제 요청일 때
				
				dao = new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);  //현재 글이 존재하는지 확인
				int result = dao.deletePost(idx);
					
				if(result == 1) {  //삭제 성공
					String saveFileName = dto.getSfile();  //첨부파일 삭제하기
					FileUtil.deleteFile(request,"/Uploads",saveFileName);
				}
				
				JSFunction.alertLocation(response, "게시물이 삭제되었습니다.", "list.do");
			}
		}else {
			//비밀번호 틀릴 경우(false)
			JSFunction.alertBack(response, "비밀번호가 일치하지 않습니다.");
		}
	}

}
