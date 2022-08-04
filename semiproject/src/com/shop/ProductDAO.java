package com.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ProductDAO {
	
	private Connection conn;
	
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<ProductDTO> lists = null;
	ProductDTO dto = null;
	
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
				maxNum = rs.getInt(1);//컬럼이 하나만나오고 파생컬럼이기문에 이름을 쓸수없다
				
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
		
	//입력 --제품추가
	
	public int product_insertData(ProductDTO dto) {
		
		int result = 0;
		
		try {
			
			sql = "insert into product (num,name,price,category,brand,pro_size,";
			sql+= "color,tag,saveFileName) values(?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getCategory());
			pstmt.setInt(5, dto.getBrand());
			pstmt.setInt(6, dto.getPro_size());
			pstmt.setInt(7, dto.getColor());
			pstmt.setInt(8, dto.getTag());
			pstmt.setString(9, dto.getSaveFileName());
			
			result = pstmt.executeUpdate();
			
			
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			 
		}
		
		return result;
		
	}
	
	//출력
	public List<ProductDTO> product_getList(int start,int end){
		
		lists = new ArrayList<ProductDTO>();
		
		try {
			
			sql = "select * from (select rownum rnum,data.* "; 
			sql +="from (select num,name,price,category,brand,pro_size,";
			sql +="color,tag,saveFileName from product order by num desc) data) ";
			sql +="where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setCategory(rs.getInt("category"));
				dto.setBrand(rs.getInt("brand"));
				dto.setPro_size(rs.getInt("pro_size"));
				dto.setColor(rs.getInt("color"));
				dto.setTag(rs.getInt("tag"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	//페이징시 필요한 데이타카운트값 구하기
	public int getDataCount() {
		
		int dataCount = 0;
		
		try {
			
			sql = "select nvl(count(*),0) from product";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dataCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dataCount;
	}
	
	//삭제시 필요한 하나의 DTO 가져오기
	public ProductDTO product_getReadData(int num) {
		
		try {
			
			sql = "select num,name,price,category,brand,pro_size,";
			sql+= "color,tag,saveFileName ";
			sql+= "from product where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setCategory(rs.getInt("category"));
				dto.setBrand(rs.getInt("brand"));
				dto.setPro_size(rs.getInt("pro_size"));
				dto.setColor(rs.getInt("color"));
				dto.setTag(rs.getInt("tag"));
				dto.setSaveFileName(rs.getString("saveFileName"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	

	
	
	//삭제
	
	public int product_deleteDate(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete product where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
