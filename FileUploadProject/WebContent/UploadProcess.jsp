<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fileupload.MyfileDAO" %>
<%@ page import="fileupload.MyfileDTO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>

<%
	String saveDirectory = application.getRealPath("/Uploads");  //저장 경로 지정
	//C:\work\jspworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileUploadProject\Uploads
	int maxPostSize = 1024 * 1000;  //파일 최대 크기(1MB)
	String encoding = "UTF-8";  //인코딩 방식
	
	try {
		//1. 객체 생성
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);  //maxPostSize객체는 받을 수 있는 매개변수가 지정되어있음
		
		//1-1. 새로운 파일명 생성
		String fileName = mr.getFilesystemName("attachedFile");  //현재 파일 이름
		String ext = fileName.substring(fileName.lastIndexOf(".")); //.을 기준으로 문자열을 분리해서 확장자만 가져오기
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  //현재 날짜와 시간 가져오기
		String newFileName = now + ext;   //새로운 파일명 생성(현재 날짜/시간 + 확장자)
		
		//1-2. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);  //자바 객체인 File 객체는 파일의 정보를 얻어올 수 있음
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile); 
		
		//2. 나머지 폼 데이터 받아오기
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");  //배열형태로 오는 값은 .getParameterValues()로 받아오기
		StringBuffer cateBuf = new StringBuffer();  //카테고리 정보를 하나의 문자열로 합치기
		if(cateArray == null) { 
			cateBuf.append("선택 없음");
		}else {
			for(String s : cateArray) {
				cateBuf.append(s + ", ");  //배열로 받아오는 값들 붙여주기(연결해주기)
			}
		}
		
		//3. DTO 생성 및 값 저장
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		//4. DAO 생성 및 DB 저장
		MyfileDAO dao =  new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
		//5. 페이지 이동
		response.sendRedirect("FileList.jsp");
	
	}catch(Exception e) {
		e.printStackTrace();
	}
%>





















