package com.cart;

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

import com.shop.ProductDAO;
import com.util.CustomInfo;
import com.util.DBConn;

public class CartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = DBConn.getConnection();
		CartProductDAO dao = new CartProductDAO(conn);

		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		String url = null;

		HttpSession session = request.getSession();
		CustomInfo info =  (CustomInfo)session.getAttribute("customInfo");
		if(info == null) {
			url = cp + "/shopping/list.do";
			response.sendRedirect(url);
			return;
		}
		
		int memberNum = info.getNum();

		if(uri.indexOf("cart.do") != -1){
			
//			HttpSession session = request.getSession();
//			session.removeAttribute("id");
//			System.out.println("로그아웃");
			//아래 setattribute는 일부러 해줌.
			//write.jsp에서 ${pageNum} 이렇게 쓰기 위해서
			//아래 코드를 지우면  ${param.pageNum} 이렇게 쓰거나
			//request.getParameter("pageNum") 이걸로 직접 받으면 된다.
			//두개는 동일한 방식인데 문법의 차이만 있을 뿐.
			//일단 param을 사용하기 위해서 주석처리.
			//			request.setAttribute("pageNum", request.getParameter("pageNum"));
			
			url = "/shopping-cart.jsp";
			myForward(request, response, url);
		}
//		원래 할인금액 데이터 처리로 가지고 있는건데 당장은 쓸모가 없음
//		다만 현재 처리가 보안이 아예 안되어서 추후에 써야할듯.
//		else if(uri.indexOf("curCartCount.do") != -1){
//			//			로그인 구현 후 id를 세션에 담아서 사용.
//			//			HttpSession session = request.getSession();
//			//			String memberNum = (String)session.getAttribute("id");
//			
//			String discountCost  = request.getParameter("discountCost");
//			
//			//int productNum  = Integer.parseInt(request.getParameter("productNum"));
//			
//			request.setAttribute("discountCost", discountCost);
//			
//			url = cp +"/order/payment.do";
//			response.sendRedirect(url);
//		}
		//동일한 제품이 장바구니에 있을 경우 개수만 늘려줌
		else if(uri.indexOf("updatePC.do") != -1){
			
			int productNum  = Integer.parseInt(request.getParameter("productNum"));
			int count  = Integer.parseInt(request.getParameter("count"));

			dao.updateCart_Product(memberNum, productNum, count);
		}
		else if(uri.indexOf("cartList.do") != -1){
			//장바구니에 들어왔을 때 전달받는 회원번호
			
			
			List<CartProductDTO> lists = dao.getCartList(memberNum);
			String imagePath = cp + "/img/pds/";
			
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			for(int i = 0; i < lists.size(); i++) {
				result.append("[{\"value\": \"" + lists.get(i).getMembernum() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getProductnum() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getCount() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getName() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getPrice() + "\"},");
				result.append("{\"value\": \"" + cp + "/img/pds/" + lists.get(i).getSaveFileName() + "\"}]}");
				
			}
			result.append("]}");
			response.getWriter().write(result.toString());
		}
		else if(uri.indexOf("countCart.do") != -1){
			//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");

			System.out.println("여기 아니냐??");
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":\"" + String.valueOf(dao.getDataCount(memberNum)) + "\"}");
			System.out.println(result);
			response.getWriter().write(result.toString());
		}
		else if(uri.indexOf("deleteCart.do") != -1){
			//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");

			int productNum  = Integer.parseInt(request.getParameter("productNum"));

			dao.deleteCart_Product(memberNum, productNum);
		}
	}

	protected void myForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
