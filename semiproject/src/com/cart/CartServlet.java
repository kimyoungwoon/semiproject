package com.cart;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ProductDAO;
import com.util.DBConn;

public class CartServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		Connection conn = DBConn.getConnection();
		ProductDAO dao = new ProductDAO(conn);

		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		
		String url = null;

		//파일 저장 경로 설정
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "imageFile";

		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("write.do") != -1){
			
			
			//아래 setattribute는 일부러 해줌.
			//write.jsp에서 ${pageNum} 이렇게 쓰기 위해서
			//아래 코드를 지우면  ${param.pageNum} 이렇게 쓰거나
			//request.getParameter("pageNum") 이걸로 직접 받으면 된다.
			//두개는 동일한 방식인데 문법의 차이만 있을 뿐.
			//일단 param을 사용하기 위해서 주석처리.
//			request.setAttribute("pageNum", request.getParameter("pageNum"));
			
			url = "/imageTest/write.jsp";
			myForward(request, response, url);
		}
		
		
	}

	
	protected void myForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	
}
