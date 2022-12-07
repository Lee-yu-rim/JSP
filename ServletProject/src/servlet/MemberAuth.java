package servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;


@WebServlet(urlPatterns = {"/MemberAuth.mvc"}, 
			initParams = {@WebInitParam(name="admin_id",value="nakja")})  //=> 추가 속성 사용 시 적용하는 방식
			//서블릿에서 param 값 초기화 하기
public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO dao;

    public MemberAuth() {
        super();

    }


	public void init() throws ServletException {
		ServletContext application = this.getServletContext();  //application 객체의 정보 받아오기 -> web.xml에 저장된 param 정보를 읽어올 수 있게됨
		
		//web.xml에서 DB 연결정보 가져오기
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass= application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);  //JDBConnect의 4가지 매개변수를 받는 메소드가 호출됨 -> connection 객체가 생성
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");  //여기서 this는 자기자신인 MemberAuth 객체인데, 이 객체는 HttpServlet 객체를 상속받으므로 자시닝 Servlet 객체가 된다.
		//this가 서블릿 객체이므로 위에 initParam에서 초기화한 param 값을 가져올 수 있다.
		
		//MemberAuth.jsp에서 parameter 값 가져오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//DTO에 id와 pass 정보가 있는지 확인
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		
		//회원이라면
		if(memberName != null) {
			request.setAttribute("authMessage", memberName + "회원님 반갑습니다.");
		}else {
			if(admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
			}else {
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
			}
		}
		
		request.getRequestDispatcher("./MemberAuth.jsp").forward(request,response);
	}

	public void destroy() {
		dao.close();
	}
}

