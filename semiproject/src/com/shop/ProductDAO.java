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
			
			sql = "insert into product (num,name,price,category,brand,";
			sql+= "saveFileName) values(?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setInt(4, dto.getCategory());
			pstmt.setInt(5, dto.getBrand());
			pstmt.setString(6, dto.getSaveFileName());
			
			
			result = pstmt.executeUpdate();
			/*
			if(result==0) {
				return result; //제품등록 실패
			}
			*/
			
			/*
			//조인테이블에 제품사이즈 추가
			sql = "insert into product_size (productnum,sizenum) ";
			sql+= "values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, dto.getPro_size());
			result = pstmt.executeUpdate();
			
			//조인테이블에 제품컬러 추가
			sql = "insert into product_color (productnum,COLORNUM) ";
			sql+= "values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, dto.getColor());
			result = pstmt.executeUpdate();
			
			//조인테이블에 제품컬러 추가
			sql = "insert into product_tag (productnum,TAGNUM) ";
			sql+= "values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, dto.getTag());
			result = pstmt.executeUpdate();
			*/
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return -1;//db오류 (제품등록 실패
			 
		}
		
		return result;//제품등록 성공
		
	}
	
	
	//페이징시 필요한 데이타카운트값 구하기
	public int getDataCount(String searchValue) {
		
		int dataCount = 0;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT NVL(COUNT(*),0) FROM (";
			sql+= "SELECT NUM,NAME,PRICE,CATEGORY,BRAND,SAVEFILENAME,SNAME,SNUM,CNAME,CNUM,TNAME,TNUM,CTNAME,CTNUM,BRNAME,BRNUM FROM (";
			sql+= "SELECT A.NUM,A.NAME,A.PRICE,A.CATEGORY,A.BRAND,SAVEFILENAME,";
			sql+= "B.NAME SNAME,B.NUM SNUM,C.NAME CNAME,B.NUM CNUM,D.NAME TNAME,D.NUM TNUM,";
			sql+= "E.NAME CTNAME,E.NUM CTNUM,F.NAME BRNAME,F.NUM BRNUM ";
			sql+= "FROM PRODUCT A, PSIZE B, COLOR C, TAG D, CATEGORY E, BRAND F ";
			sql+= "WHERE A.NUM = B.NUM(+) ";
			sql+= "AND A.NUM = C.NUM(+) ";
			sql+= "AND A.NUM = D.NUM(+) ";
			sql+= "AND A.CATEGORY = E.NUM(+) ";
			sql+= "AND A.BRAND = F.NUM(+) ";
			sql+= "ORDER BY A.NUM) ";
			sql+= "WHERE NAME LIKE ? ";
			sql+= "OR SNAME LIKE ? ";
			sql+= "OR PRICE LIKE ? ";
			sql+= "OR CNAME LIKE ? ";
			sql+= "OR TNAME LIKE ? ";
			sql+= "OR CTNAME LIKE ? ";
			sql+= "OR BRNAME LIKE ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setString(2, searchValue);
			pstmt.setString(3, searchValue);
			pstmt.setString(4, searchValue);
			pstmt.setString(5, searchValue);
			pstmt.setString(6, searchValue);
			pstmt.setString(7, searchValue);
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
			
			sql = "select num,name,price,category,brand,";
			sql+= "saveFileName ";
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
	
	//삭제시 필요한 하나의 DTO 가져오기
		public ProductDTO product_details_getReadData(int num) {
			
			try {
				
				sql = "select num,name,price,category,brand,savefilename1,savefilename2,savefilename3,savefilename4 ";
				sql+= "from product where num=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new ProductDTO();
					
					dto.setNum(rs.getInt(1));
					dto.setName(rs.getString(2));
					dto.setPrice(rs.getInt(3));
					dto.setCategory(rs.getInt(4));
					dto.setBrand(rs.getInt(5));
					
					dto.setSaveFileName1(rs.getString(6));
					dto.setSaveFileName2(rs.getString(7));
					dto.setSaveFileName3(rs.getString(8));
					dto.setSaveFileName4(rs.getString(9));
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
	
	//입력
	//제품에 컬러 추가
	public int color_insertData(int num,int colorNum) {
		
		int result = 0;
		
		try {
			
			
			sql = "insert into product_color (productnum,colornum) ";
			sql+= "values (?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, colorNum);
			result = pstmt.executeUpdate();
			pstmt.close();
					
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//입력
	//제품에 사이즈 추가
	public int size_insertData(int num,int sizeNum) {
		
		int result = 0;
		
		try {
			;
			
			
				sql = "insert into product_size (productnum,sizenum) ";
				sql+= "values (?,?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, sizeNum);
				result = pstmt.executeUpdate();
				pstmt.close();
				
			
					
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//입력
	//제품에 사이즈 추가
	public int tag_insertData(int num,int tagNum) {
		
		int result = 0;
		
		try {
			
			
			sql = "insert into product_tag (productnum,tagnum) ";
			sql+= "values (?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, tagNum);
			result = pstmt.executeUpdate();
			pstmt.close();
			
				
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	
	public int insertCart(int memberNum,int productNum) {
		
		int result = 0;
		
		try {
			sql = "select count from cart_product where membernum = ? and productnum = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, productNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		
			if(result == 0) {
				sql = "insert into cart_product (membernum, productnum, count) ";
				sql+= "values (?,?,1)";
			}
			else {
				sql = "update cart_product set count = count + 1 "
					+ "where membernum = ? and productnum = ?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, productNum);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}	
	public int insertCart(int memberNum,int productNum, int count) {
		
		int result = 0;
		
		try {
			sql = "select count from cart_product where membernum = ? and productnum = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, productNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println(memberNum);
			System.out.println(productNum);
			if(result == 0) {
				sql = "insert into cart_product (count, membernum, productnum) ";
				sql+= "values (?,?,?)";
			}
			else {
				sql = "update cart_product set count = count + ? "
					+ "where membernum = ? and productnum = ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, memberNum);
			pstmt.setInt(3, productNum);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}	
	
}
