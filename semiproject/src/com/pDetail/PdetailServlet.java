package com.pDetail;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pDetail.PdetailDAO;
import com.util.DBConn;

public class PdetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void foward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
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
		
		//상세 페이지
		if(uri.indexOf("pdetail.do")!=-1) {
		
			PdetailDTO dto = new PdetailDTO();
			
			dto = dao.getReadData(1);
			
			url = "/shop-details.jsp";
			foward(req, resp, url);
		
		//카트 디비에 저장시킬 것
		}else if(uri.indexOf("pdetail_ok.do")!=-1) {
			
			int pnum = Integer.parseInt(req.getParameter("pnum"));
			int mnum = Integer.parseInt(req.getParameter("mnum"));
			int count = Integer.parseInt(req.getParameter("count"));
			
			url = cp;
			resp.sendRedirect(url);
			
		}

	}
	
}
