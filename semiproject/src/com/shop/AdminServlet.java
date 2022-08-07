package com.shop;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.MyPage;

public class AdminServlet extends HttpServlet {
	
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
		ListReturnDAO listReturn_dao = new ListReturnDAO(conn);
		ListSortReturnDAO listSortReturn_dao = new ListSortReturnDAO(conn);
		ListSortHighReturnDAO listSortHighReturn_dao = new ListSortHighReturnDAO(conn);
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		MyPage myPage = new MyPage();
		String url = null;
		List<ProductDTO> lists = null;
		
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "productFile";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("insert.do")!=-1) {//관리자 제품추가뷰 보여주기
			
			
			url = "/shop/admin_product.jsp";
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
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				
				
				dao.product_insertData(dto);
				
			}
			
			url = cp + "/setting/insert.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("list.do")!=-1) {//관리자페이지 초기화면 보여주기
			
			url = "/adminMain.jsp";
			foward(req, resp, url);
			
		}else if(uri.indexOf("setting.do")!=-1) {//제품(컬러,태그,사이즈)등록 페이지로포워딩 및 리스트반환
			
			
			
			
			
			List<ProductDTO> settinglists = listReturn_dao.product_getList();//관리자용 전체리스트
			
			String imagePath = cp + "/pds/productFile";
			
			req.setAttribute("settinglists", settinglists);
			req.setAttribute("imagePath", imagePath);
			
			url = "/shop/admin_product_setting.jsp";
			foward(req, resp, url);
			
		}else if(uri.indexOf("insertSize.do")!=-1) {//제품의 사이즈등록
			
			int num = Integer.parseInt(returnNull(req.getParameter("size_nameNum")));
			int sizeNum = Integer.parseInt(returnNull(req.getParameter("pd_sizeNum")));
			
			
			dao.size_insertData(num, sizeNum);
			
			url = cp + "/setting/setting.do";
			resp.sendRedirect(url);
			
			
		}else if(uri.indexOf("insertColor.do")!=-1) {//제품의 컬러등록
			
			int num = Integer.parseInt(returnNull(req.getParameter("color_nameNum")));
			int colorNum = Integer.parseInt(returnNull(req.getParameter("pd_colorNum")));
			
			
			dao.color_insertData(num, colorNum);
			
			url = cp + "/setting/setting.do";
			resp.sendRedirect(url);
			
					
		}else if(uri.indexOf("insertTag.do")!=-1) {//제품의 태그 등록
			
			int num = Integer.parseInt(returnNull(req.getParameter("tag_nameNum")));
			int tagNum = Integer.parseInt(returnNull(req.getParameter("pd_tagNum")));
			
			
			dao.tag_insertData(num, tagNum);
			
			url = cp + "/setting/setting.do";
			resp.sendRedirect(url);
			
			
		}
	}
	//파라미터로 오는 분류값이 null이라면 
		//null을 0으로 바꿔 에러안나게 처리메서드
		public String returnNull(String str) {
			
			if(str==null) {
				str = "-1";
			}
			
			return str;
		}
}
