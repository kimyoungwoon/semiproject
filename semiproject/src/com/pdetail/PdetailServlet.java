package com.pdetail;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDTO;
import com.pdetail.PdetailDAO;
import com.shop.ProductDAO;
import com.shop.ProductDTO;
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
		resp.setCharacterEncoding("UTF-8");
		
		
		Connection conn = DBConn.getConnection();
		ProductDAO dao = new ProductDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		//List<PdetailDTO> lists = null;
		
		String url;
		
		//info.setNum(dto.getNum());
		
		//세션에 info 등록
		//HttpSession session = req.getSession();
		
		//session.setAttribute("customInfo", info);
		
		url = cp + "/shop-details.jsp";
		
		//상세 페이지로 데이터 받아오기
//		int color;
//		int size;
//		int startnum, endnum;
		//lists = dao.sizeOption(size, startnum, endnum);
		//lists = dao.colorOption(color, startnum, endnum);
		
		
		if(uri.indexOf("pdetail.do")!=-1) {
			
//			System.out.println(req.getParameter("productNum"));
//			
//			int num = 0;// Integer.parseInt(req.getParameter("num"));
//			dto = dao.getReadData(num);
//
//			String imagePath = cp + "/img/shop-details";
//
//			req.setAttribute("imagePath", imagePath);
//			req.setAttribute("dto", dto);

			url = "/shop-details.jsp?productNum=" + req.getParameter("productNum");
			forward(req, resp, url);

		//카트 디비에 저장시킬 것
		}else if(uri.indexOf("insert.do")!=-1) {

			int pnum = Integer.parseInt(req.getParameter("pnum"));
			int mnum = Integer.parseInt(req.getParameter("mnum"));
			int count = Integer.parseInt(req.getParameter("count"));

			url = cp;
			resp.sendRedirect(url);
		}
		else if(uri.indexOf("pdetailList.do")!=-1) {
			int productNum = Integer.parseInt(req.getParameter("productNum"));
			
			ProductDTO dto = dao.product_details_getReadData(productNum);
			System.out.println(productNum);
			System.out.println(dto.getName());
			
			StringBuffer result = new StringBuffer("");
			
			result.append("{\"result\":[");
			result.append("{\"value\": \"" + dto.getNum() + "\"},");
			result.append("{\"value\": \"" + dto.getName() + "\"},");
			result.append("{\"value\": \"" + dto.getPrice() + "\"},");
			result.append("{\"value\": \"" + dto.getCategory() + "\"},");
			result.append("{\"value\": \"" + dto.getBrand() + "\"},");
			result.append("{\"value\": \"" + dto.getSaveFileName1() + "\"},");
			result.append("{\"value\": \"" + dto.getSaveFileName2() + "\"},");
			result.append("{\"value\": \"" + dto.getSaveFileName3() + "\"},");
			result.append("{\"value\": \"" + dto.getSaveFileName4() + "\"}]}");
			
			resp.getWriter().write(result.toString());
			
		}
	}

}

