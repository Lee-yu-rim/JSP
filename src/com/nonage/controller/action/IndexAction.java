package com.nonage.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.dao.ProductDAO;
import com.nonage.dto.ProductVO;

public class IndexAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index 요청 받을 시 처리하는 파일
		
		String url = "/index.jsp";
		
		//1. DAO를 이용한 데이터 처리
		ProductDAO productDAO = ProductDAO.getInstance();  //싱글톤 패턴 클래스 객체 생성방식
		ArrayList<ProductVO> newProductList = productDAO.listNewProduct();
		ArrayList<ProductVO> bestProductList = productDAO.listBestProduct();
		
		request.setAttribute("newProductList", newProductList);
		request.setAttribute("bestProductList", bestProductList);
		
		//2. view 페이지 지정(.jsp) 및 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
 	}

}
