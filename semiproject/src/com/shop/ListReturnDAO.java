package com.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListReturnDAO {

	private Connection conn;


	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<ProductDTO> lists = null;
	ProductDTO dto = null;

	public ListReturnDAO (Connection conn) {
		this.conn = conn;
	}
	
	//카테고리별 해당 전체리스트를 반환
	public List<ProductDTO> category_getList(int start,int end,int category){

		lists = new ArrayList<ProductDTO>();

		try {
			//select * from (select rownum rnum,data.* from (select num,name,price,category,brand,pro_size,color,tag,saveFileName from product where category = 2 order by num desc) data) where rnum >= 1 and rnum <=1;
			sql =  "select * from (select rownum rnum,data.* ";
			sql+= "from (select num,name,price,category,brand,pro_size,";
			sql+= "color,tag,saveFileName from product where category = ? order by num desc) ";
			sql+= "data) where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

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
	
	//브랜드별 해당 전체리스트를 반환
	public List<ProductDTO> branding_getList(int start,int end,int brand){

		lists = new ArrayList<ProductDTO>();

		try {
			//select * from (select rownum rnum,data.* from (select num,name,price,category,brand,pro_size,color,tag,saveFileName from product where category = 2 order by num desc) data) where rnum >= 1 and rnum <=1;
			sql =  "select * from (select rownum rnum,data.* ";
			sql+= "from (select num,name,price,category,brand,pro_size,";
			sql+= "color,tag,saveFileName from product where brand = ? order by num desc) ";
			sql+= "data) where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, brand);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

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
	
	//가격별 해당 전체리스트를 반환
		public List<ProductDTO> price_getList(int start,int end,int priceMin,int priceMax){

			lists = new ArrayList<ProductDTO>();

			try {
				//select * from (select rownum rnum,data.* from (select num,name,price,category,brand,pro_size,color,tag,saveFileName from product where category = 2 order by num desc) data) where rnum >= 1 and rnum <=1;
				sql =  "select * from (select rownum rnum,data.* ";
				sql+= "from (select num,name,price,category,brand,pro_size,";
				sql+= "color,tag,saveFileName from product where price >= ? and price <= ? order by num desc) ";
				sql+= "data) where rnum >= ? and rnum <=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, priceMin);
				pstmt.setInt(2, priceMax);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);

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
		//관리자가정한 최소가격보다 비싼 제품 전체출력
		public List<ProductDTO> priceUp_getList(int start,int end,int priceMin){

			lists = new ArrayList<ProductDTO>();

			try {
				//select * from (select rownum rnum,data.* from (select num,name,price,category,brand,pro_size,color,tag,saveFileName from product where category = 2 order by num desc) data) where rnum >= 1 and rnum <=1;
				sql =  "select * from (select rownum rnum,data.* ";
				sql+= "from (select num,name,price,category,brand,pro_size,";
				sql+= "color,tag,saveFileName from product where price >= ? order by num desc) ";
				sql+= "data) where rnum >= ? and rnum <=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, priceMin);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);

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
		

		
}



