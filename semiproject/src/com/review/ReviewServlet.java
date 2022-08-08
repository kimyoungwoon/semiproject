package com.review;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.CustomInfo;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyPage;

public class ReviewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		Connection conn = DBConn.getConnection();
		ReviewDAO dao = new ReviewDAO(conn);

		MyPage myPage = new MyPage();

		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;

		// 파일 업로드 위치 지정
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "imageFile";

		File f = new File(path);
		// 파일 존재하지 않으면 디렉토리 생성
		if (!f.exists()) {
			f.mkdirs();
		}

		if (uri.indexOf("write.do") != -1) {

			url = cp + "/writing/reviewer/guest.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("write_ok.do") != -1) {

			// 파일업로드 페이지 호출(DAO실행)
						String encType = "UTF-8";
						int maxSize = 10 * 1024 * 1024;

						// 물리적 파일 업로드
						MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
						
							ReviewDTO dto = new ReviewDTO();
							int maxNum = dao.getMaxNum();
							
							
							String str = req.getParameter("detailNum");
							
							if(str==null || str.equals("")) {//Null 값이왔을때 처리
								str = "0";
							}
							
							int detailNum = Integer.parseInt(str);//해당상세페이지로 돌아갈수있게 넘값을받음
							
							HttpSession session = req.getSession();
							CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
							
							String subject = mr.getParameter("content");//제목값을 받기위한 스트링변수 
							
							if(subject==null || subject.equals("") || subject.length()<5) {
								subject = "즐거운쇼핑";
							}
							
							
							dto.setNum(maxNum + 1);
							dto.setName(info.getName());				
							dto.setSubject(subject.substring(0, 5));
							dto.setContent(mr.getParameter("content"));
							dto.setSaveFileName(mr.getFilesystemName("imageFile"));
							
							dao.insertData(dto);

						
						url = cp + "/detail/review.do";
						resp.sendRedirect(url);

		} else if (uri.indexOf("list.do") != -1) {

			String pageNum = req.getParameter("pageNum");
			int currentPage = 1; // 처음 띄우는 리스트 페이지
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}

			int dataCount = dao.getDataCount();
			int numPerPage = 3;
			int totalPage = myPage.getPagecount(numPerPage, dataCount);
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			int start = (currentPage - 1) * numPerPage + 1;

			int end = currentPage * numPerPage;

			String listUrl = cp + "/review/list.do";

			List<ReviewDTO> lists = dao.getListData(start, end);
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage,
					listUrl);
			// 삭제경로
			String deletePath = cp + "/review/delete.do";
			// 이미지파일경로
			String imagePath = cp + "/pds/imageFile";
			req.setAttribute("imagePath", imagePath);
			
			int totalArticle = dao.getDataCount();

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

		} else if (uri.indexOf("delete.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			ReviewDTO dto = dao.getReadData(num);
			// 물리적 파일 삭제
			FileManager.doFiledelete(dto.getSaveFileName(), path);
			// 테이블 정보 삭제
			dao.deleteData(num);

			url = cp + "/review/list.do?" + pageNum;

			resp.sendRedirect(url);
		}

	}

}
