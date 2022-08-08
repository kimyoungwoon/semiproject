package com.pdetail;

import java.io.File;
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

import com.pdetail.PdetailDAO;
import com.review.ReviewDAO;
import com.review.ReviewDTO;
import com.util.DBConn;
import com.util.MyPage;

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
		
		//수언
		MyPage myPage = new MyPage();
		ReviewDAO reviewdao = new ReviewDAO(conn);
		
		

		// 파일 업로드 위치 지정
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "imageFile";
		//
		
		
		
		
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

			
		}else if(uri.indexOf("review.do")!=-1) {
			
				String pageNum = req.getParameter("pageNum");
				int currentPage = 1; // 처음 띄우는 리스트 페이지
				if (pageNum != null) {
					currentPage = Integer.parseInt(pageNum);
				}

				int dataCount = reviewdao.getDataCount();
				int numPerPage = 3;
				int totalPage = myPage.getPagecount(numPerPage, dataCount);
				if (currentPage > totalPage) {
					currentPage = totalPage;
				}
				int start = (currentPage - 1) * numPerPage + 1;

				int end = currentPage * numPerPage;

				String listUrl = cp + "/detail/review.do";

				List<ReviewDTO> lists = reviewdao.getListData(start, end);
				String pageIndexList = myPage.pageIndexList(currentPage, totalPage,
						listUrl);
				// 삭제경로
				String deletePath = cp + "/review/delete.do";
				// 이미지파일경로
				String imagePath = cp + "/pds/imageFile";
				req.setAttribute("imagePath", imagePath);
				
				int totalArticle = reviewdao.getDataCount();

				// 파일정보 테이블을 리스트로 전달
				
				req.setAttribute("lists", lists);
				req.setAttribute("pageNum", pageNum);
				req.setAttribute("currentPage", currentPage);
				req.setAttribute("deletePath", deletePath);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("totalArticle", totalArticle);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("dataCount", dataCount);	
				
				// list.jsp 페이지로 포워드
				url = "/shop-details.jsp";
				forward(req, resp, url);
			
		}

	}
	
}
