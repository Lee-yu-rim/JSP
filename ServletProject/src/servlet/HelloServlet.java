package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HelloServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//html 형식의 서블릿 요청
//		PrintWriter out = response.getWriter();
//		out.println("<html>");
//		out.println("<body>");
//		out.println("<h1>Hello Servlet</h1>");
//		out.println("</body>");
//		out.println("</html>");
		
		//애너테이션 방식의 서블릿 요청
		request.setAttribute("message", "HelloServlet");
		request.getRequestDispatcher("HelloServlet.jsp").forward(request, response);
		//url을 통해 서블릿에 get방식으로 요청이 들어옴 -> 서블릿에서 request객체에 message를 저장함 -> request 객체에 저장된 message를 클라이언트 쪽으로 보냄
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
