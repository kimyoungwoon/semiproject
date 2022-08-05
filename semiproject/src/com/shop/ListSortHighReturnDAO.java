package com.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListSortHighReturnDAO {

	private Connection conn;


	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	List<ProductDTO> lists = null;
	ProductDTO dto = null;

	public ListSortHighReturnDAO (Connection conn) {
		this.conn = conn;
	}

	//출력
	//페이징처리된 사용자용 전체리스트
	public List<ProductDTO> product_getList(int start,int end){

		lists = new ArrayList<ProductDTO>();

		try {

			sql = "select * from (select rownum rnum,data.* "; 
			sql +="from (select num,name,price,category,brand,saveFileName ";
			sql +="from product order by price desc) data) ";
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

	//카테고리별 해당 전체리스트를 반환
	public List<ProductDTO> category_getList(int start,int end,int category){

		lists = new ArrayList<ProductDTO>();

		try {
			//select * from (select rownum rnum,data.* from (select num,name,price,category,brand,pro_size,color,tag,saveFileName from product where category = 2 order by num desc) data) where rnum >= 1 and rnum <=1;
			sql =  "select * from (select rownum rnum,data.* ";
			sql+= "from (select num,name,price,category,brand,pro_size,";
			sql+= "color,tag,saveFileName from product where category = ? order by price desc) ";
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
			sql+= "color,tag,saveFileName from product where brand = ? order by price desc) ";
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
			sql+= "color,tag,saveFileName from product where price >= ? and price <= ? order by price desc) ";
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
			sql+= "color,tag,saveFileName from product where price >= ? order by price desc) ";
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

	//사이즈별로 리스트 반환하는 메서드
	public List<ProductDTO> size_getList(int start,int end,int size){

		lists = new ArrayList<ProductDTO>();

		try {

			sql =  "select * from (select rownum rnum,data.* from (";
			sql+= "select e.num,e.name,e.price,e.category,e.brand,e.savefilename,";
			sql+= "d.PRODUCTNUM,d.sizenum from PRODUCT E,PRODUCT_SIZE D ";
			sql+= "WHERE E.NUM = D.PRODUCTNUM AND D.SIZENUM = ? ";
			sql+= "order by price desc) data) where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, size);
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
				dto.setPro_size(rs.getInt("sizenum"));
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
	//컬러카테고리별로 리스트 반환하는 메서드
	public List<ProductDTO> color_getList(int start,int end,int color){

		lists = new ArrayList<ProductDTO>();

		try {

			sql =  "select * from (select rownum rnum,data.* from (";
			sql+= "select e.num,e.name,e.price,e.category,e.brand,e.savefilename,";
			sql+= "d.PRODUCTNUM,d.colornum from PRODUCT E,PRODUCT_COLOR D ";
			sql+= "WHERE E.NUM = D.PRODUCTNUM AND D.colorNUM = ? ";
			sql+= "order by price desc) data) where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, color);
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
				dto.setColor(rs.getInt("colornum"));
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
	//태그카테고리별로 리스트 반환하는 메서드
	public List<ProductDTO> tag_getList(int start,int end,int tag){

		lists = new ArrayList<ProductDTO>();

		try {

			sql =  "select * from (select rownum rnum,data.* from (";
			sql+= "select e.num,e.name,e.price,e.category,e.brand,e.savefilename,";
			sql+= "d.PRODUCTNUM,d.TAGNUM from PRODUCT E,PRODUCT_TAG D ";
			sql+= "WHERE E.NUM = D.PRODUCTNUM AND D.TAGNUM = ? ";
			sql+= "order by price desc) data) where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, tag);
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
				dto.setColor(rs.getInt("tagnum"));
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


