package com.nav;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.CartProductDTO;
import com.util.DBConn;

public class NavigationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("servlet", "하위");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = DBConn.getConnection();

		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		//System.out.println(cp);  /semiproject
		String url = null;


		if(uri.indexOf("session.do") != -1){
			
			//아래 setattribute는 일부러 해줌.
			//write.jsp에서 ${pageNum} 이렇게 쓰기 위해서
			//아래 코드를 지우면  ${param.pageNum} 이렇게 쓰거나
			//request.getParameter("pageNum") 이걸로 직접 받으면 된다.
			//두개는 동일한 방식인데 문법의 차이만 있을 뿐.
			//일단 param을 사용하기 위해서 주석처리.
			//			request.setAttribute("pageNum", request.getParameter("pageNum"));
			String json = "";
			if (session.getAttribute("id") != null && session.getAttribute("id").equals("ingn")) {
				json = "logging";
			}
			else {
				json = "not";
			}
			
			StringBuffer result = new StringBuffer("");
//			result.append("{\"result\":\"" + (String)session.getAttribute("servlet") + "\"}");
			result.append("{\"result\":\"" + json + "\"}");
			System.out.println(result);
			response.getWriter().write(result.toString());
		}
	}

	protected void myForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
