package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.ProductDTO;

public class OrderHistoryDAO {

	private Connection conn;


	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<OrderHistoryDTO> lists = null;
	OrderHistoryDTO dto = null;

	public OrderHistoryDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getMaxNum()
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int maxNum = 0;

		try {

			sql = "select nvl(max(ordernum), 0) from order_history";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();


			if(rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;
	}

	public int getDataCount() {
		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*), 0) from order_history";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return dataCount;
	}

	public void insertOrderHistory(int memberNum, int orderNum, int paymentCost) {
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into order_history (memberNum, orderNum, paymentCost, orderDate) "
				+ "values (?, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, orderNum);
			pstmt.setInt(3, paymentCost);
			
			pstmt.executeUpdate();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	//장바구니로 들어갔을 때 해당 회원이 추가한 상품 목록을 보여주기 위함.
	public List<OrderHistoryDTO> getCartList(int pMemberNum, int pOrderNum) {
		lists = new ArrayList<OrderHistoryDTO>();
		try {

			sql = "select memberNum, orderNum, orderDate from ";
			sql+= "order_history where memberNum = ? and orderNum = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMemberNum);
			pstmt.setInt(2, pOrderNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new OrderHistoryDTO();

				dto.setMembernum(rs.getInt(1));
				dto.setOrdernum(rs.getInt(2));
				dto.setOrderdate(rs.getString(3));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	public int deleteOrderHistory(int pMeberNum, int pOrderNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete order_history where membernum=? and orderNum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMeberNum);
			pstmt.setInt(2, pOrderNum);
			
			result = pstmt.executeUpdate();
			
		
			
			sql = "delete order_detail where membernum=? and orderNum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMeberNum);
			pstmt.setInt(2, pOrderNum);
			
			result = pstmt.executeUpdate();
			
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
