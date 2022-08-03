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
		ListReturnDAO listReturn_dao = new ListReturnDAO(conn);
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
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				
				
				dao.product_insertData(dto);
				
			}
			
			url = cp + "/shopping/insert.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("list.do")!=-1) {//shop 페이지를 보여줍니다
			
			String str = null;
			str = req.getParameter("category");
			
			if(str==null) {
				str = "0";
			}
			
			int category = Integer.parseInt(str);
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();
			
			int numPerPage = 9;
			
			int totalPage = myPage.getPagecount(numPerPage, dataCount);
			
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = (currentPage*numPerPage);
			
			lists = dao.product_getList(start, end);//전체데이터 출력
			
			
			
			//System.out.println(category);
			
			if(category != 0 ) {
				
				lists = listReturn_dao.category_getList(start, end, category);
				
			}
			
			
			String listUrl = cp + "/shopping/list.do";
			
			String pageIndexList =
					myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String imagePath = cp + "/pds/productFile";
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);
			
			url = "/shop.jsp";
			foward(req, resp, url);
		}
	}
	
}
