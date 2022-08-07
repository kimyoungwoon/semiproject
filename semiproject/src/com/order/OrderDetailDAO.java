package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cart.CartProductDTO;
import com.shop.ProductDTO;

public class OrderDetailDAO {

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<OrderDetailDTO> lists = null;
	OrderDetailDTO dto = null;

	public OrderDetailDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getMaxNum()
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int maxNum = 0;

		try {

			sql = "select nvl(max(ordernum), 0) from order_detail";

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

			sql = "select nvl(count(*), 0) from order_detail";

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

	public void insertOrderDetail(int orderNum, CartProductDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "insert into order_detail (memberNum, orderNum, productNum, count) "
					+ "values (?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMembernum());
			pstmt.setInt(2, orderNum);
			pstmt.setInt(3, dto.getProductnum());
			pstmt.setInt(4, dto.getCount());

			pstmt.executeUpdate();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	//장바구니로 들어갔을 때 해당 회원이 추가한 상품 목록을 보여주기 위함.
	public List<OrderDetailDTO> getOrderDetailList(int pMemberNum, int pOrderNum) {
		lists = new ArrayList<OrderDetailDTO>();
		try {
			
			sql = "select memberNum, orderNum, productNum, count from order_detail "
					+ "where membernum = ? and orderNum = ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pMemberNum);
			pstmt.setInt(2, pOrderNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new OrderDetailDTO();

				dto.setMembernum(rs.getInt(1));
				dto.setOrdernum(rs.getInt(2));
				dto.setProductnum(rs.getInt(3));
				dto.setCount(rs.getInt(4));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//장바구니로 들어갔을 때 해당 회원이 추가한 상품 목록을 보여주기 위함.
		public String[] getOrderOnce(int pMemberNum, int pOrderNum) {
			lists = new ArrayList<OrderDetailDTO>();
			String[] saveFileName = null;
			try {
				
				sql = "select name, savefilename, (select count(*) from order_detail where membernum = ? and orderNum = ?) "
				+ "from product where num = (select productNum from order_detail where membernum = ? and orderNum = ? and rownum = 1)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pMemberNum);
				pstmt.setInt(2, pOrderNum);
				pstmt.setInt(3, pMemberNum);
				pstmt.setInt(4, pOrderNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					saveFileName = new String[3];
					saveFileName[0] = rs.getString(1);
					saveFileName[1] = rs.getString(2);
					saveFileName[2] = rs.getString(3);
				}
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return saveFileName;
		}
}
