package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewController() {
        super();
    }

    //service 메소드 -> 요청이 들어오면 get, post 방식에 상관없이 호출된다.
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		
		String idx = request.getParameter("idx");  //idx 번호로 데이터 조회
		
		//게시글을 누르면 조회수 올라가는 메소드
		dao.updateVisitCount(idx);
		//게시글 누르면 상세보기 페이지 조회 메소드
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		//줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./View.jsp").forward(request, response);
	}

}
