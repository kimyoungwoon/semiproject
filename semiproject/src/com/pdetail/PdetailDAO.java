package com.pdetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pdetail.PdetailDTO;
import com.shop.ProductDTO;

public class PdetailDAO {

	private Connection conn;
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<PdetailDTO> lists = null;
	PdetailDTO dto = null;
	
	public PdetailDAO(Connection conn) {
		this.conn = conn;
	}
	
	//입력
	public int insertData(int mnum,int pnum,int count) {
		
		int result = 0;
		
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

		try {
			//num으로 select 해온다
			sql = "select num,name,price,tag,brand,saveFileName ";
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
				dto.setBrand(rs.getInt("brand"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	
	}


	//사이즈
	public int sizeCart(int num) {
		
		int result = 0;
		
		try {
			
			sql = "select name from psize where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}
	
	//컬러
	public int colorCart(int num) {
		
		int result = 0;
		
		try {
			
			sql = "select name from color where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}

}

//	//사이즈 카트에 넘겨주기
//	public List<PdetailDTO> sizeOption(int size,int startnum,int endnum) {
//
//		lists = new ArrayList<PdetailDTO>();
//
//		try {
//			
//			sql =  "select ? from psize where rnum>=? and rnum<=?";
//
//			pstmt = conn.prepareStatement(sql);
//
//			pstmt.setInt(1, size);
//			pstmt.setInt(2, startnum);
//			pstmt.setInt(3, endnum);
//
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//
//				dto = new PdetailDTO();
//				dto.setSize(rs.getInt("sizenum"));
//
//				lists.add(dto);
//
//			}
//
//			rs.close();
//			pstmt.close();
//
//
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//
//		return lists;
//	}
//	
//	//컬러 카트에 넘겨주기
//	public List<PdetailDTO> colorOption(int color,int startnum,int endnum) {
//
//		lists = new ArrayList<PdetailDTO>();
//
//		try {
//			
//			sql =  "select ? from color where rnum>=? and rnum<=?";
//
//			pstmt = conn.prepareStatement(sql);
//
//			pstmt.setInt(1, color);
//			pstmt.setInt(2, startnum);
//			pstmt.setInt(3, endnum);
//
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//
//				dto = new PdetailDTO();
//				dto.setColor(rs.getInt("colornum"));
//
//				lists.add(dto);
//
//			}
//
//			rs.close();
//			pstmt.close();
//
//
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//		
//		return lists;
//		
//	}	
//}
