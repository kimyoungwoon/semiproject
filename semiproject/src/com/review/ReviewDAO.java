package com.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

	private Connection conn;

	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}

	// num 최댓값
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from review ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;
	}
	//2.입력
	public int insertData(ReviewDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into guest (num,name,subject,content,savepath) ";
			sql += "values (?,?,?,?,sysdate) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());

			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//전체 데이터 조회
	public List<ReviewDTO> getListData(int start, int end) {
		
		List<ReviewDTO> lists= new ArrayList<ReviewDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {			
			sql = "select * from (";
			sql+= "select rownum rnum,data.* from (";
			sql+= "select num,name,to_char(savepath,'YYYY-MM-DD') savepath,";
			sql+= "subject,content from review order by num desc) data ) ";
			sql+= "where rnum >= ? and rnum <=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewDTO dto = new ReviewDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSavepath(rs.getString("savepath"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
		
	}
	
	//전체데이터 갯수

	public int getDataCount() {

		int totalDataCount = 0;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {
						

			sql = "select nvl(count(*),0) from review ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalDataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
	
	// �Խ��� ����

			public int deleteData(int num) {

				int result = 0;
				PreparedStatement pstmt = null;
				String sql;

				try {

					sql = "delete review where num=?";

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
