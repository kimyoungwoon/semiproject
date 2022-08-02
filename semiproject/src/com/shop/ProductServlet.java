package com.shop;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.MyPage;

public class ProductServlet extends HttpServlet {
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
	public void destroy() {
		DBConn.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBConn.getConnection();
		ProductDAO dao = new ProductDAO(conn);
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		MyPage myPage = new MyPage();
		String url = null;
		
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "productFile";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("insert.do")!=-1) {//관리자 제품추가뷰 보여주기
			
			
			url = "/shop/shop_admin.jsp";
			foward(req, resp, url);
			
		}else if(uri.indexOf("insert_ok.do")!=-1) {//실제 디비에 제품정보 추가
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr =
					new MultipartRequest(req, path, maxSize, encType,
							new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload")!=null) {
				
				ProductDTO dto = new ProductDTO();
				
				int maxNum = dao.getMaxNum();
				
				dto.setNum(maxNum + 1);
				dto.setName(mr.getParameter("pd_name"));
				dto.setPrice(Integer.parseInt(mr.getParameter("pd_price")));
				dto.setCategory(Integer.parseInt(mr.getParameter("pd_categoryNum")));
				dto.setBrand(Integer.parseInt(mr.getParameter("pd_brandNum")));
				dto.setPro_size(Integer.parseInt(mr.getParameter("pd_sizeNum")));
				dto.setColor(Integer.parseInt(mr.getParameter("pd_colorNum")));
				dto.setTag(Integer.parseInt(mr.getParameter("pd_tagNum")));
				dto.setSaveFileName("upload");
				
				dao.product_insertData(dto);
				
			}
		}
	}
	
}
