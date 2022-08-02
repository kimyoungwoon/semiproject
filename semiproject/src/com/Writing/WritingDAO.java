package com.Writing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




public class WritingDAO {
	
	// 의존성주입
	private Connection conn;

	public WritingDAO(Connection conn) {
		this.conn = conn;
	}

	// num의 최대값
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from writing ";

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
	
	// 입력

	public int insertData(WritingDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into writing (membernum,num,id,pwd,name,email,subject,content,hitCount,created) ";
			sql += "values (?.?,?,?,?,?,?,?,0,sysdate) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getMembernum());
			pstmt.setInt(2, dto.getNum());
			pstmt.setString(3, dto.getId());
			pstmt.setString(5, dto.getName());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getSubject());
			pstmt.setString(8, dto.getContent());

			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;


	}	
	
	
	

}
