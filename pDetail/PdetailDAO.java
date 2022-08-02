package com.pDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PdetailDAO {

	private Connection conn;
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	
	public PdetailDAO(Connection conn) {
		this.conn = conn;
	}
	
	public List<PdetailDTO> getLists() {
		
		List<PdetailDTO> lists = new ArrayList<PdetailDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select num,name,price,pro_size,color,count ";
			sql+= "from product";
					
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PdetailDTO dto = new PdetailDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setSize(rs.getInt("pro_size"));
				dto.setColor(rs.getInt("color"));
				dto.setCount(rs.getInt("count"));
				
				lists.add(dto);
				
			}
			
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
		
	}
	
}
