package com.pdetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pdetail.PdetailDTO;

public class PdetailDAO {

	private Connection conn;
	
	public PdetailDAO(Connection conn) {
		this.conn = conn;
	}
	
	//입력
	public int insertData(int mnum,int pnum,int count) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into cart_product (membernum,productnum,count) ";
			sql+= "values (?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, count);
		
					
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	//num으로 한개의 데이터 가져오기
	public PdetailDTO getReadData(int num) {

		PdetailDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			//num으로 select 해온다
			sql = "select num,name,price,tag ";
			sql+= "from product where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new PdetailDTO();

				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setTag(rs.getInt("tag"));
				
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	
	}
}
