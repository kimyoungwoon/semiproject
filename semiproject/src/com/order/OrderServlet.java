package com.order;

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

import com.cart.CartProductDAO;
import com.cart.CartProductDTO;
import com.shop.ProductDAO;
import com.util.DBConn;

public class OrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		final int MEMBER_NUM = 1;

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		Connection conn = DBConn.getConnection();
		OrderHistoryDAO orderDAO = new OrderHistoryDAO(conn);
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO(conn);
		CartProductDAO cartDAO = new CartProductDAO(conn);

		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		String url = null;


		if(uri.indexOf("payment.do") != -1){
			//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");
			String aa = (String)request.getParameter("discountCost");
			System.out.println(aa);
			int memberNum  = MEMBER_NUM;
			//int productNum  = Integer.parseInt(request.getParameter("productNum"));

			url = "/payment.jsp";
			myForward(request, response, url);
		}
		else if(uri.indexOf("payment_ok.do") != -1){
			System.out.println("결제 완료");
//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");
			
			int memberNum  = MEMBER_NUM;
			int orderNum = orderDAO.getMaxNum() + 1;
			
			List<CartProductDTO> list = cartDAO.getCartList(memberNum);
			int sumCost = 0;
			
			//주문상세 테이블 입력
			for (CartProductDTO cartProductDTO : list) {
				orderDetailDAO.insertOrderDetail(orderNum, cartProductDTO);
				sumCost += cartProductDTO.getCount() * cartProductDTO.getPrice();
			}
			
			//주문내역 테이블 입력
			orderDAO.insertOrderHistory(memberNum, orderNum, sumCost);
			cartDAO.deleteCartMember(memberNum);
			
			url = cp + "/order/orderHistory.do";
			response.sendRedirect(url);
		}
		
		else if(uri.indexOf("orderHistory.do") != -1){
			
			//추후에는 결제 성공 페이지로
			url = "/shopping-cart.jsp";
			myForward(request, response, url);
		}
		else if(uri.indexOf("paymentList.do") != -1){
			
			
			//장바구니에 들어왔을 때 전달받는 회원번호
			int memberNum = Integer.parseInt(request.getParameter("memberNum"));

			List<CartProductDTO> lists = cartDAO.getCartList(memberNum);

			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			for(int i = 0; i < lists.size(); i++) {
				result.append("[{\"value\": \"" + lists.get(i).getMembernum() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getProductnum() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getCount() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getName() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getPrice() + "\"}],");
			}
			result.append("]}");
			response.getWriter().write(result.toString());
		}
		else if(uri.indexOf("deleteOrder.do") != -1){
			//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");
			int memberNum = MEMBER_NUM;
			int orderNum  = Integer.parseInt(request.getParameter("orderNum"));

			orderDAO.deleteOrderHistory(memberNum, orderNum);
		}
	}

	protected void myForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}


}
