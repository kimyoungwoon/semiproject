package com.pDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pDetail.PdetailDTO;

public class PdetailDAO {

	private Connection conn;

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	
	public PdetailDAO(Connection conn) {
		this.conn = conn;
	}
	
	//입력
	public int insertData(PdetailDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into cart_product (num,name,price,pro_size,color,count) ";
			sql+= "values (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getSize());
			pstmt.setInt(5, dto.getColor());
			pstmt.setInt(6, dto.getCount());
					
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	//데이터 읽어오기
	public PdetailDTO getReadData(int num) {

		PdetailDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select num,name,price,pro_size,color,count ";
			sql+= "from product where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new PdetailDTO();

				dto.setNum(Integer.parseInt(rs.getString("num")));
				dto.setName(rs.getString("name"));
				dto.setPrice(Integer.parseInt(rs.getString("price")));
				dto.setSize(Integer.parseInt(rs.getString("pro_size")));
				dto.setColor(Integer.parseInt(rs.getString("color")));
				dto.setCount(Integer.parseInt(rs.getString("count")));
				
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	
	}
}
