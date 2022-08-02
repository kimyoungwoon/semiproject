package com.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {
	
	private Connection conn;
	
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	
	public ProductDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	
	//num의 최대값 고유값 제품번호 만들기
	public int getMaxNum() {
		
		int maxNum = 0;
		
		try {
			
			sql = "select nvl(max(num),0) from product";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1);//컬럼이 하나만나오고 파생컬럼이기떄문에 이름을 쓸수없다
				
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
		
	//입력 --제품추가
	
	public int insertProduct(ProductDTO dto) {
		
		int result = 0;
		
		try {
			
			sql = "insert into product (num,name,price,category,brand,pro_size,";
			sql+= "tag,saveFileName values (?.?.?.?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getCategory());
			pstmt.setInt(5, dto.getBrand());
			pstmt.setInt(6, dto.getPro_size());
			pstmt.setInt(7, dto.getTag());
			pstmt.setString(8, dto.getSaveFileName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			 
		}
		
		return result;
		
	}
	
	//출력
	
	
	
	
	//수정
	
	
	//삭제
	
}
