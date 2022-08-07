package com.pdetail;

import java.io.IOException;
import java.sql.Connection;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pdetail.PdetailDAO;
import com.util.DBConn;

public class PdetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConn.getConnection();
		PdetailDAO dao = new PdetailDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		String url;
		
		
		PdetailDTO dto = new PdetailDTO();
		//info.setNum(dto.getNum());
		
		//세션에 info 등록
		HttpSession session = req.getSession();
		
		//session.setAttribute("customInfo", info);
		
		url = cp + "/shop-details.jsp";
		
		//상세 페이지로 데이터 받아오기
		if(uri.indexOf("pdetail.do")!=-1) {
			
			int num = 0;// Integer.parseInt(req.getParameter("num"));
			dto = dao.getReadData(num);

			String imagePath = cp + "/img/shop-details";

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);

			url = "/shop-details.jsp";
			forward(req, resp, url);

		//카트 디비에 저장시킬 것
		}else if(uri.indexOf("insert.do")!=-1) {

			int pnum = Integer.parseInt(req.getParameter("pnum"));
			int mnum = Integer.parseInt(req.getParameter("mnum"));
			int count = Integer.parseInt(req.getParameter("count"));

			url = cp;
			resp.sendRedirect(url);

		}

	}
	
}
