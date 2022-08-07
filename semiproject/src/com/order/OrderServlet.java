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
import com.member.MemberDAO;
import com.member.MemberDTO;
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
		MemberDAO memberDAO = new  MemberDAO(conn);

		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		String url = null;

		HttpSession session = request.getSession();
		session.setAttribute("membernum", 1);



		if(uri.indexOf("payment.do") != -1){


			if(cartDAO.getDataCount() < 1) {

				url = cp + "/cart/cart.do";
				response.sendRedirect(url);
				return;
			}

			//			로그인 구현 후 id를 세션에 담아서 사용.
			//			HttpSession session = request.getSession();
			//			String memberNum = (String)session.getAttribute("id");
			String actualPayment = (String)request.getParameter("discountCost");
			System.out.println(actualPayment);


			session.setAttribute("actualPayment", actualPayment);

			int memberNum  = MEMBER_NUM;
			//int productNum  = Integer.parseInt(request.getParameter("productNum"));

			System.out.println("로그인");
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

			String actualPayment = (String)session.getAttribute("actualPayment");
			if (actualPayment != null) {
				sumCost = Integer.parseInt(actualPayment);
			}

			//주문내역 테이블 입력
			orderDAO.insertOrderHistory(memberNum, orderNum, sumCost);
			cartDAO.deleteCartMember(memberNum);

			url = cp + "/index.jsp";
			response.sendRedirect(url);
		}
		else if(uri.indexOf("actualPayment.do") != -1){

			String actualPayment = (String)session.getAttribute("actualPayment");
			if (actualPayment == null) {
				System.out.println("값 없음");
				actualPayment = "0";
			}

			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":\"" + actualPayment + "\"}");
			response.getWriter().write(result.toString());
		}
		else if(uri.indexOf("billingDetail.do") != -1){


			//장바구니에 들어왔을 때 전달받는 회원번호
			//우리는 membernum은 int인데 dao 수정 해야할듯.
			//			int memberNum = (int)session.getAttribute("membernum");
			int memberNum = (int)session.getAttribute("membernum");
			System.out.println(memberNum);
			MemberDTO info = memberDAO.getReadDataNum(memberNum);

			System.out.println(info.getName());
			System.out.println(info.getTel());
			System.out.println(info.getEmail() );
			System.out.println(info.getAddress());

			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			result.append("{\"value\": \"" + info.getName() + "\"},");
			result.append("{\"value\": \"" + info.getTel() + "\"},");
			result.append("{\"value\": \"" + info.getEmail() + "\"},");
			result.append("{\"value\": \"" + info.getAddress() + "\"},");
			result.append("]}");
			response.getWriter().write(result.toString());
		}
		else if(uri.indexOf("orderHistoryList.do") != -1){

			url = "/orderHistory.jsp";
			myForward(request, response, url);

		}
		else if(uri.indexOf("orderHistory.do") != -1){

			//장바구니에 들어왔을 때 전달받는 회원번호
			//우리는 membernum은 int인데 dao 수정 해야할듯.
			int memberNum = (int)session.getAttribute("membernum");
			
			List<OrderHistoryDTO> order = orderDAO.getCartList(memberNum);
			String[] saveFileName = null;
			
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			for (OrderHistoryDTO orderHistoryDTO : order) {
				
				result.append("[{\"value\": \"" + orderHistoryDTO.getMemberNum() + "\"},");
				result.append("{\"value\": \"" + orderHistoryDTO.getOrderNum()+ "\"},");
				result.append("{\"value\": \"" + orderHistoryDTO.getPaymentCost() + "\"},");
				result.append("{\"value\": \"" + orderHistoryDTO.getOrderDate() + "\"},");
				
				saveFileName = orderDetailDAO.getOrderOnce(memberNum, orderHistoryDTO.getOrderNum());
				result.append("{\"value\": \"" + saveFileName[0] + "\"},");
				result.append("{\"value\": \"" + cp + "/img/pds/" + saveFileName[1] + "\"},");
				result.append("{\"value\": \"" + saveFileName[2] + "\"}],");
			}
			result.append("]}");
			response.getWriter().write(result.toString());

		}
		else if(uri.indexOf("paymentList.do") != -1){
			//임시로 여기 오면 로그인 한거임


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
