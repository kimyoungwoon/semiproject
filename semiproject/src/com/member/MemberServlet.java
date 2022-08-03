package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.util.DBConn;

public class MemberServlet extends HttpServlet{

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
		
		//DB연결
		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		//CategoryDAO dao1 = new CategoryDAO(conn);
	
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		
		String url;//포워딩시킬 데이터 저장할 url
		

		//회원가입 페이지
		if(uri.indexOf("login.do")!= -1) {
	
			// 매핑을 해줘야 찾아감
			url = "/member/login.jsp";
			forward(req, resp, url);

			
		}
		else if(uri.indexOf("login_ok.do")!= -1) {
			
			MemberDTO dto = new MemberDTO();
			
			//form  post방식으로 넘어오니까
			dto.setId(req.getParameter("id"));
			dto.setPw(req.getParameter("pw"));
			dto.setName(req.getParameter("name"));
			dto.setDate(req.getParameter("date"));			
			
			dao.insertData(dto);
			
			url = cp + "/login/login.do";
			resp.sendRedirect(url);
			
			
		}else if(uri.indexOf("login.do")!= -1) {
			
			//로그인 시 포워드 페이지
			String listUrl = "/semiroject/member/login.jsp";
			req.setAttribute("listUrl", listUrl);

/*			List<MemberDTO> brandLists = 
			dao2.getBrandLists();		
			
 	        req.setAttribute("brandLists", brandLists);
		*/
			url = "/semiproject/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!= -1) {
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			System.out.println(id);
		
			MemberDTO dto = dao.getReadData(id);
			
			
			//dto==null 일 경우 아이디가 없음
			//세션에 있는  pwd가  DB의 pwd와 일치하지 않는 경우
//			if(dto==null || (!dto.getPwd().equals(pwd))) {
				
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");
				url = "/semiroject/member/login.jsp";
				
				forward(req, resp, url);
				
				return;//로그인 실패 시 더이상의 소스코드가 실행되지 않도록 return작성
			}
		/*	if(id.equals("hwcotton")) {
				
				url = "/shoppingmall/productSave/productSave.jsp";
				
				forward(req, resp, url);
				
				return;//로그인 실패 시 더이상의 소스코드가 실행되지 않도록 return작성
			}*/
			
				
			//서블릿에서 세션만드는 방법
			HttpSession session = req.getSession();
			
			//customInfo에 담을 것이니 객체 생성
			Custominfo info = new Custominfo();
			
			info.setId(dto.getId());
			info.setName(dto.getName());
			
			//세션에 로그인 정보 저장
			session.setAttribute("customInfo", info);

			//저장했으니 메인화면으로 가기
			url = cp + "/shop/main/main.do";
			//세션을 변경시키면 리다이렉트 해야 한다,
			resp.sendRedirect(url);
				
			
			
			
			
		}else if(uri.indexOf("logout.do")!= -1) {
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("customInfo"); //세션에 있는 변수명 삭제
			session.invalidate();//세션에 있는 데이터 삭제
			
			url = cp + "/shop/main/main.do";
			resp.sendRedirect(url);
		
			
		}else if(uri.indexOf("update.do")!= -1) {
			
			String listUrl = cp + "/shop/category/category.do";
			req.setAttribute("listUrl", listUrl);

			List<ProductDTO> brandLists = 
					dao2.getBrandLists();			
			req.setAttribute("brandLists", brandLists);
			
			
			HttpSession session = req.getSession();
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			MemberDTO dto = dao.getReadData(info.getId());
			req.setAttribute("dto", dto);
			//회원정보수정 포워드 페이지
			
			url = "/member/update.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updated_ok.do")!=-1) {
			
			HttpSession session = req.getSession();
			Custominfo info = (Custominfo)session.getAttribute("customInfo");
			
			
			MemberDTO dto = new MemberDTO();
		
			dto.setId(info.getId());
			dto.setrPw(req.getParameter("Pw"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
	
			dao.updateData(dto);
		
			url = cp ;
			resp.sendRedirect(url);
			
		}
		
		/*//아이디 중복확인
		}else if(uri.indexOf("idcheck.do")!=-1) {
			
			url = "/shoppingmall/join/idcheck.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("idcheck_ok.do")!=-1) {
			
			String id = req.getParameter("id");
			
			System.out.println(id);
			
			MemberDTO dto = dao.getReadData(id);
		
			
			
			if(dto==null || dto.equals(id)) {
				
				req.setAttribute("message", "이미사용중인 아이디입니다");
				
				url = "/shoppingmall/join/idcheck.jsp";
				forward(req, resp, url);
				return;
				
			}else {
				
				req.setAttribute("message2", "사용가능한 아이디입니다.");
				

				url = "/shoppingmall/join/idcheck.jsp";
				forward(req, resp, url);
				return;
			}
			
		}else if(uri.indexOf("jusoPopup.do")!=-1) {
			
			
			url = "/shoppingmall/join/jusoPopup.jsp";
			forward(req, resp, url);
			}*/
			
		}
			
}


