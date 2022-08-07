package com.review;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.util.DBConn;
import com.util.MyPage;

public class ReviewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd =
				req.getRequestDispatcher(url);

		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		Connection conn = DBConn.getConnection();
		
		ReviewDAO dao = new ReviewDAO(conn);	
		
		MyPage myPage = new MyPage();
		
		String url;
		
		if(uri.indexOf("write.do")!=-1){
			
			url = cp+ "/writing/reviewer/guest.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1){
			ReviewDTO dto = new ReviewDTO();
			int maxNum = dao.getMaxNum();
			
			dto.setNum(maxNum+1);
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setSavepath(req.getParameter("savepath"));	
			
			dao.insertData(dto);						
		
			url = cp+"/review/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1) {
			
			String pageNum = req.getParameter("pageNum");
			
			//첫시작시 현재페이지 1
			int currentPage = 1;
			
			//넘어온 페이지 번호가 존재할 경우 현재페이지에 값 넣어주기
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			//전체데이터 갯수 구하기
			int dataCount = dao.getDataCount();	
				
			//한페이지에 표시할 데이터의 갯수
			int numPerPage = 3;
				
			//전체 페이지수 구하기
			int totalPage = myPage.getPagecount(numPerPage, dataCount);
				
			//전체페이지수가 표시할 페이지수보다 큰 경우(삭제로 인해)
			if(currentPage>totalPage) { //마지막페이지에 마지막 글을 지웠을때 앞페이지로 이동시켜주는 코딩
				currentPage = totalPage;//ex 12페이지에 하나만있는 글을 지웠을때 11페이지로 이동시켜주는	
			} 
				
			//데이터베이스에서 가져올 rownum의 시작과 끝
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
				
			List<ReviewDTO> lists = dao.getListData(start, end);
			
			//페이징 처리
			String listUrl = "list.do";
			String pageIndexList = 
				myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			req.setAttribute("lists", lists); //���� ���� ������ ������
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("datacount", dataCount);
			
			
			url = "/writing/reviewer/guest.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("delete.do")!=-1) {
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			dao.deleteData(num);
			
			url = cp + "/review/list.do";

			resp.sendRedirect(url);
		}
		
		
	}

}
