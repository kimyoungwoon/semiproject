package com.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.CartProductDAO;
import com.util.CustomInfo;
import com.util.DBConn;

public class MemberServlet extends HttpServlet {

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
		resp.setContentType("text/html;charset=UTF-8");

		// DB연결
		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);

		String cp = req.getContextPath();
		String uri = req.getRequestURI();

		String url = null;// 포워딩시킬 데이터 저장할 url

		// 회원가입 페이지
		if (uri.indexOf("created.do") != -1) {

			// 매핑을 해줘야 찾아감
			url = "/member/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created_ok.do") != -1) {

			MemberDTO dto = new MemberDTO();
			int maxNum = dao.getMaxNum();
			// form post방식으로 넘어오니까
			
			String id = req.getParameter("reg_id");
			String pw  = req.getParameter("reg_pw");
			String name  = req.getParameter("reg_name");
			String birth  = req.getParameter("reg_birth");
			
			
			
			if(dao.registerCheck(id)) {
				//true면 중복
				url = cp + "/login/register_fail.do";
			}
			else if(id != null && !id.equals("")
					&& pw != null && !pw.equals("")
					&& name != null && !name.equals("")
					&& birth != null && !birth.equals("")) 	{
				url = cp + "/login/register_success.do";
				dto.setNum(maxNum + 1);
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setBirth(birth);

				dao.insertData(dto);
			}
			else {
				url = cp + "/login/register_fail.do";
			}
			
			resp.sendRedirect(url);

		} else if (uri.indexOf("register_success.do") != -1) {

			url = "/member/register_success.jsp";
			forward(req, resp, url);

		}else if (uri.indexOf("register_fail.do") != -1) {

			url = "/member/register_fail.jsp";
			forward(req, resp, url);
		}
		
		else if (uri.indexOf("login.do") != -1) {

			url = "/member/login.jsp";
			forward(req, resp, url);

			// 아이디 중복확인
		} else if (uri.indexOf("login_ok.do") != -1) {

			String id = req.getParameter("login_id");
			String pw = req.getParameter("login_pw");

			

			MemberDTO dto = dao.getReadData(id);
			
//			// dto==null 일 경우 아이디가 없음
//			// 세션에 있는 pwd가 DB의 pwd와 일치하지 않는 경우
			if (dto == null || (!dto.getPw().equals(pw))) {
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");
				
				url = "/member/login.jsp";
				forward(req, resp, url);
				
				//로그인은 세션변경이지만 이건 로그인 실패니까 포워드로 해도 될듯?
//				url = "/semiproject/member/login.jsp";
//				resp.sendRedirect(url);
				return;
			}

			// 로그인 실패 시 더이상의 소스코드가 실행되지 않도록 return작성
			// 서블릿에서 세션만드는 방법
			HttpSession session = req.getSession();

			// customInfo에 담을 것이니 객체 생성
			CustomInfo info = new CustomInfo();

			info.setId(dto.getId());
			info.setNum(dto.getNum());
			if (dto.getName() == null) {
				info.setName("");
			}
			info.setName(dto.getName());

			// 세션에 로그인 정보 저장
			session.setAttribute("customInfo", info);

			// 저장했으니 메인화면으로 가기
			url = "/semiproject/index.jsp";
			// 세션을 변경시키면 리다이렉트 해야 한다,
			resp.sendRedirect(url);

			// 로그아웃
		} else if (uri.indexOf("logout_ok.do") != -1) {

			HttpSession session = req.getSession();

			session.removeAttribute("customInfo"); // 세션에 있는 변수명 삭제
			session.invalidate();// 세션에 있는 데이터 삭제

			url = "/semiproject/index.jsp";
			resp.sendRedirect(url);

		} else if (uri.indexOf("updated.do") != -1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			MemberDTO dto = dao.getReadData(info.getId());
			req.setAttribute("dto", dto);

			// 회원정보수정 포워드 페이지

			url = "/member/updated.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("updated_ok.do") != -1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			MemberDTO dto = new MemberDTO();

			dto.setNum(Integer.parseInt(req.getParameter("num")));
			dto.setId(info.getId());
			dto.setPw(req.getParameter("pw"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setAddress(req.getParameter("address"));
			dto.setTel(req.getParameter("tel"));
			dto.setGender(req.getParameter("gender"));
			dto.setBirth(req.getParameter("birth"));

			System.out.println(dto.getId());
			System.out.println(dto.getPw());
			System.out.println(dto.getName());
			System.out.println(dto.getEmail());
			System.out.println(dto.getAddress());
			System.out.println(dto.getTel());
			System.out.println(dto.getGender());
			System.out.println(dto.getBirth());

			dao.updateData(dto);

			url = "/member/updated.jsp";
			resp.sendRedirect(url);

		}
	}
}
