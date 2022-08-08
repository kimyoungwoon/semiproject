package com.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.ProductDTO;

public class CartProductDAO {

	private Connection conn;


	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<CartProductDTO> lists = null;
	CartProductDTO dto = null;

	public CartProductDAO(Connection conn) {
		this.conn = conn;
	}

	
	public int getDataCount() {
		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*), 0) from cart_product";

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
	
	//회원번호를 기준으로 갯수를 가져옴.
	public int getDataCount(int pMemberNum) {
		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {

			sql = "select nvl(count(*), 0) from cart_product where memberNum = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pMemberNum);
			
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
	
	//장바구니로 들어갔을 때 해당 회원이 추가한 상품 목록을 보여주기 위함.
	public List<CartProductDTO> getCartList(int pMemberNum) {
		lists = new ArrayList<CartProductDTO>();
		try {

			sql = "select membernum, productnum, count, p.name as name, p.price as price, p.savefilename as savefilename from ";
			sql+= "cart_product c, product p where membernum = ? and p.num = c.productnum";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMemberNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new CartProductDTO();

				dto.setMembernum(rs.getInt(1));
				dto.setProductnum(rs.getInt(2));
				dto.setCount(rs.getInt(3));
				dto.setName(rs.getString(4));
				dto.setPrice(rs.getInt(5));
				dto.setSaveFileName(rs.getString(6));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	public int updateCart_Product(int pMeberNum, int pProductNum, int count) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update cart_product set count = ? where membernum=? and productNum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, pMeberNum);
			pstmt.setInt(3, pProductNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int deleteCart_Product(int pMeberNum, int pProductNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete cart_product where membernum=? and productNum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMeberNum);
			pstmt.setInt(2, pProductNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int deleteCartMember(int pMeberNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "delete cart_product where membernum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pMeberNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
